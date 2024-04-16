import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/blocs/task/task_bloc.dart';
import 'package:pomo/components/utils/my_progress_indicator.dart';
import 'package:pomo/constants/colors.dart';
import 'package:pomo/cubits/auth/auth_cubit.dart';
import 'package:pomo/pages/error_page.dart';
import 'package:pomo/pages/stats/charts/bar_chart.dart';
import 'package:pomo/pages/stats/charts/line_chart.dart';
import 'package:pomo/pages/stats/logic/stats_brain.dart';
import 'package:pomo/pages/stats/widgets/time_selector.dart';

import '../../components/fancy_shimmer/fancy_shimmer_image.dart';
import '../../components/widgets/snack_bars.dart';
import '../../constants/text.dart';
import '../../models/task/task.dart';
import 'no_stats_page.dart';

@RoutePage()
class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  var selectedMode = [true, false, false];
  List<Task> tasks = [];
  List<Task> completedTasks = [];
  StatsBrain? brain;

  Future<void> _onRefresh() async {
    String id = context.read<AuthCubit>().state.maybeWhen(authenticated: (user) => user.id, orElse: () => "");
    context.read<TaskBloc>().getTasksByUser(userId: id);
  }

  @override
  void initState() {
    String id = context.read<AuthCubit>().state.maybeWhen(authenticated: (user) => user.id, orElse: () => "");
    context.read<TaskBloc>().getTasksByUser(userId: id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<TaskBloc, TaskState>(
      listener: (BuildContext context, TaskState state) {
        state.whenOrNull(
            fetchedByUser: (tasks) => setState(() {
              this.tasks = tasks;
              completedTasks = tasks.where((task) => task.completed).toList();
              brain = StatsBrain(completedTasks: completedTasks, selectedMode: selectedMode);
            }),
            errorFetchingByUser: () => onErrorState(context, "fetching tasks"));
      },
      builder: (BuildContext context, state) => Scaffold(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                body: SafeArea(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16.0), // Add vertical padding to ensure shadow visibility
                      child: RefreshIndicator(
                            onRefresh: _onRefresh,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text("Statistics", style: kSerzif(context))),
                                const SizedBox(
                                  height: 20,
                                ),
                                state.maybeWhen(
                                  fetchingByUser: () => const Center(child:  MyProgressIndicator()),
                                  errorFetchingByUser: () => const ErrorPage(text: "fetching tasks"),
                                  noneUsers: () => const NoStatsPage(),
                                  orElse: () => Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black12, spreadRadius: 0, blurRadius: 10),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              ToggleButtons(
                                                  renderBorder: false,
                                                  splashColor: Colors.transparent,
                                                  borderRadius: BorderRadius.circular(12),
                                                  focusColor: Colors.transparent,
                                                  selectedColor: Colors.transparent,
                                                  fillColor: Colors.transparent,
                                                  isSelected: selectedMode,
                                                  onPressed: (int index) {
                                                    setState(() {
                                                      for (int buttonIndex = 0;
                                                      buttonIndex < selectedMode.length;
                                                      buttonIndex++) {
                                                        if (buttonIndex == index) {
                                                          selectedMode[buttonIndex] = true;
                                                        } else {
                                                          selectedMode[buttonIndex] = false;
                                                        }
                                                      }
                                                    });
                                                  },
                                                  children: [
                                                    TimeSelector(
                                                        text: "Today", isSelected: selectedMode[0]),
                                                    TimeSelector(
                                                        text: "Yesterday",
                                                        isSelected: selectedMode[1]),
                                                    TimeSelector(
                                                        text: "All Time",
                                                        isSelected: selectedMode[2]),
                                                  ]),
                                              IconButton(
                                                  onPressed: () => onAvailableSoon(context),
                                                  icon: Icon(
                                                    Icons.ios_share_rounded,
                                                    color: Theme.of(context).iconTheme.color,
                                                  ))
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 22,
                                          ),
                                          Row(
                                            children: [
                                              context.read<AuthCubit>().state.maybeWhen(
                                                  authenticated: (user) {
                                                    if (user.photo == null) {
                                                      return const CircleAvatar(
                                                        backgroundImage:  AssetImage("assets/images/propic-placeholder.jpg"),
                                                      );
                                                    } else {
                                                      return ClipOval(
                                                          child: SizedBox(
                                                              height: 83,
                                                              width: 83,
                                                              child: FancyShimmerImage(imageUrl: user.photo!)));
                                                    }
                                                  },
                                                  orElse: () => const CircleAvatar(
                                                    backgroundImage:  AssetImage("assets/images/propic-placeholder.jpg"),
                                                  )),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.sizeOf(context).width / 2,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Focus Time",
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .titleSmall
                                                              ?.copyWith(
                                                              color: Theme.of(context)
                                                                  .colorScheme
                                                                  .onSecondaryContainer),
                                                        ),
                                                        Text(
                                                          "${selectedMode[0] ? brain?.getFocusTimeToday() : selectedMode[1] ? brain?.getFocusTimeYesterday() : brain?.getFocusTimeAll()}h",
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .titleMedium,
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Break Time",
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .titleSmall
                                                              ?.copyWith(
                                                              color: Theme.of(context)
                                                                  .colorScheme
                                                                  .onSecondaryContainer),
                                                        ),
                                                        Text(
                                                          "${selectedMode[0] ? brain?.getBreakTimeToday() : selectedMode[1] ? brain?.getBreakTimeYesterday() : brain?.getBreakTimeAll()}h",
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .titleMedium,
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Total Tasks",
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .titleSmall
                                                              ?.copyWith(
                                                              color: Theme.of(context)
                                                                  .colorScheme
                                                                  .onSecondaryContainer),
                                                        ),
                                                        Text(
                                                          "${selectedMode[0] ? brain?.getAllTasksToday() : selectedMode[1] ? brain?.getAllTasksYesterday() : brain?.getAllTasksAll()}",
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .titleMedium,
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(16),
                                      width: MediaQuery.sizeOf(context).width,
                                      height: MediaQuery.sizeOf(context).height / 3.5,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black12, spreadRadius: 0, blurRadius: 10),
                                        ],
                                      ),
                                      child: CustomBarChart(
                                          brain: brain ?? StatsBrain(completedTasks: [], selectedMode: []),
                                          tasks: tasks,
                                          barBackgroundColor: kNeutral500,
                                          barColor: Theme.of(context).primaryColor,
                                          touchedBarColor: Theme.of(context).primaryColor),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(16),
                                      height: MediaQuery.sizeOf(context).height / 4.5,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black12, spreadRadius: 0, blurRadius: 10),
                                        ],
                                      ),
                                      child: CustomLineChart(
                                        brain: brain ?? StatsBrain(completedTasks: [], selectedMode: []),
                                      ),
                                    ),
                                  ],
                                ),)
                              ],
                            ),
                          ),
                        ),
                    ),),

    );
  }
}
