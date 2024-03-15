import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/blocs/task/task_bloc.dart';
import 'package:pomo/components/utils/utils.dart';
import 'package:pomo/pages/stats/charts/bar_chart.dart';
import 'package:pomo/pages/stats/charts/line_chart.dart';
import 'package:pomo/pages/stats/logic/stats_brain.dart';
import 'package:pomo/pages/stats/widgets/time_selector.dart';

import '../../constants/text.dart';
import '../../models/task/task.dart';

@RoutePage()
class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  var selectedMode = [true, false, false];
  List<Task> tasks = [];

  @override
  void initState() {
    //    String id = context.read<AuthCubit>().state.maybeWhen(authenticated: (user) => user.id, orElse: () => "");
    context.read<TaskBloc>().getTasksByUser(userId: "65e31000c48a3a97e1a5147a");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Task> completedTasks = tasks.where((task) => task.completed).toList();
    StatsBrain brain = StatsBrain(completedTasks, selectedMode);

    return BlocConsumer<TaskBloc, TaskState>(
      listener: (BuildContext context, TaskState state) {
        state.whenOrNull(
            fetchedByUser: (tasks) => this.tasks = tasks,
            errorFetchingByUser: () => onErrorState(context, "fetching tasks"));
      },
      builder: (BuildContext context, state) => Scaffold(
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text("Statistics", style: kSerzif(context))),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height / 4.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Theme.of(context).cardColor,
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
                              onPressed: () {},
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
                          const CircleAvatar(
                            radius: 83 / 2,
                          ),
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
                                      "${brain.focusTime}h",
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
                                      "${brain.breakTime}h",
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
                                      brain.allTasks.toString(),
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
                    color: Theme.of(context).cardColor,
                  ),
                  child: CustomBarChart(
                      barBackgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      barColor: Theme.of(context).primaryColor,
                      touchedBarColor: Theme.of(context).primaryColor),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height / 4.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Theme.of(context).cardColor,
                  ),
                  child: const CustomLineChart(),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
