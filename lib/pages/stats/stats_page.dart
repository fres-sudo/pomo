import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../blocs/project/project_bloc.dart';
import '../../blocs/stats/stats_bloc.dart';
import '../../components/widgets/profile_picture.dart';
import '../../components/widgets/snack_bars.dart';
import '../../constants/colors.dart';
import '../../constants/text.dart';
import '../../cubits/auth/auth_cubit.dart';
import '../../cubits/timer/timer_cubit.dart';
import '../../extension/sized_box_extension.dart';
import '../../i18n/strings.g.dart';
import '../../models/task/task.dart';
import 'charts/bar_chart.dart';
import 'charts/line_chart.dart';
import 'no_stats_page.dart';
import 'widgets/time_selector.dart';

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

  Future<void> _fetchStats() async {
    String id = context.read<AuthCubit>().state.maybeWhen(authenticated: (user) => user.id, orElse: () => "");
    context.read<StatsBloc>().fetchStats(userId: id);
  }

  double _formatFocusTime(int? time){
    final focusTime = context.select<TimerCubit, int>((cubit) => cubit.state.focusTime);
    final hours = time ?? 0 * focusTime / 25;
    return double.tryParse(hours.toStringAsFixed(1)) ?? 0;
  }

  double _formatBreakTime(int? time){
    final breakTime = context.select<TimerCubit, int>((cubit) => cubit.state.breakTime);
    final hours = time ?? 0 * breakTime / 25;
    return double.tryParse(hours.toStringAsFixed(1)) ?? 0;
  }

  @override
  void initState() {
    _fetchStats();
    context.read<ProjectBloc>().state.projects.forEach((proj) => tasks.addAll(proj.tasks ?? []));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return BlocConsumer<StatsBloc, StatsState>(
      listener: (BuildContext context, StatsState state) => state.error != null ? onErrorState(context, state.error!.localizedString(context)) : null,
      builder: (BuildContext context, state) => Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: RefreshIndicator(
              onRefresh: _fetchStats,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(alignment: Alignment.topLeft, child: Text(t.stats.title, style: kSerzif(context))),
                  Gap.MD,
                  Skeletonizer(
                    enabled: state.isLoading,
                    child: tasks.isEmpty
                        ? const NoStatsPage()
                        : Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                                  boxShadow: const [
                                    BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 10),
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
                                                for (int buttonIndex = 0; buttonIndex < selectedMode.length; buttonIndex++) {
                                                  if (buttonIndex == index) {
                                                    selectedMode[buttonIndex] = true;
                                                  } else {
                                                    selectedMode[buttonIndex] = false;
                                                  }
                                                }
                                              });
                                            },
                                            children: [
                                              TimeSelector(text: t.general.today, isSelected: selectedMode[0]),
                                              TimeSelector(text: t.general.yesterday, isSelected: selectedMode[1]),
                                              TimeSelector(text: t.general.all_times, isSelected: selectedMode[2]),
                                            ]),
                                        IconButton(
                                            onPressed: () => onAvailableSoon(context),
                                            icon: Icon(
                                              Icons.ios_share_rounded,
                                              color: Theme.of(context).iconTheme.color,
                                            ))
                                      ],
                                    ),
                                    Gap.MD,
                                    Row(
                                      children: [
                                        const ProfilePicture(
                                          width: 83,
                                          height: 83,
                                        ),
                                        Gap.MD,
                                        SizedBox(
                                          width: MediaQuery.sizeOf(context).width / 2,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    t.tasks.focus_time,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall
                                                        ?.copyWith(color: Theme.of(context).colorScheme.onSecondaryContainer),
                                                  ),
                                                  Text(
                                                    "${selectedMode[0]
                                                        ? _formatFocusTime(state.statistics?.totalTasksToday): selectedMode[1]
                                                        ? _formatFocusTime(state.statistics?.totalTasksYesterday)
                                                        : _formatFocusTime(state.statistics?.totalTasksAll)}h",
                                                    style: Theme.of(context).textTheme.titleMedium,
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    t.tasks.break_time,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall
                                                        ?.copyWith(color: Theme.of(context).colorScheme.onSecondaryContainer),
                                                  ),
                                                  Text(
                                                    "${selectedMode[0]
                                                        ? _formatBreakTime(state.statistics?.totalTasksToday) : selectedMode[1]
                                                        ? _formatBreakTime(state.statistics?.totalTasksYesterday)
                                                        : _formatBreakTime(state.statistics?.totalTasksAll)}h",
                                                    style: Theme.of(context).textTheme.titleMedium,
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    t.tasks.total_tasks,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall
                                                        ?.copyWith(color: Theme.of(context).colorScheme.onSecondaryContainer),
                                                  ),
                                                  Text(
                                                    "${selectedMode[0]
                                                        ? state.statistics?.totalTasksToday ?? 0 : selectedMode[1]
                                                        ? state.statistics?.totalTasksYesterday ?? 0
                                                        : state.statistics?.totalTasksAll ?? 0}",
                                                    style: Theme.of(context).textTheme.titleMedium,
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
                              Gap.MD,
                              Container(
                                padding: const EdgeInsets.all(16),
                                width: MediaQuery.sizeOf(context).width,
                                height: MediaQuery.sizeOf(context).height / 3.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                                  boxShadow: const [
                                    BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 10),
                                  ],
                                ),
                                child: CustomBarChart(
                                  tasks: tasks,
                                  barBackgroundColor: kNeutral500,
                                  barColor: Theme.of(context).primaryColor,
                                  touchedBarColor: Theme.of(context).primaryColor,
                                  stats: state.statistics!,
                                ),
                              ),
                              Gap.MD,
                              Container(
                                padding: const EdgeInsets.all(16),
                                height: MediaQuery.sizeOf(context).height / 4.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                                  boxShadow: const [
                                    BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 10),
                                  ],
                                ),
                                child: CustomLineChart(
                                  stats: state.statistics!,
                                ),
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
