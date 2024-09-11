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
  List<String> titles = [t.tasks.focus_time, t.tasks.break_time, t.tasks.total_tasks];
  List<String> days = [t.general.today, t.general.yesterday, t.general.all_times];

  Future<void> _fetchStats() async {
    String id = context.read<AuthCubit>().state.maybeWhen(authenticated: (user) => user.id, orElse: () => "");
    context.read<StatsBloc>().fetchStats(userId: id);
  }

  String _formatTime(int? time, int factor) {
    final hours = (time ?? 0) * factor / 60;
    return _formatHours(double.tryParse(hours.toStringAsFixed(2)) ?? 0);
  }

  String _formatHours(double decimalHours) {
    int hours = decimalHours.floor(); // Get the whole number part (hours)
    int minutes = ((decimalHours - hours) * 60).round(); // Convert the decimal part to minutes

    return hours > 0 ? '${hours}h ${minutes}m' : '${minutes}m';
  }

  @override
  void initState() {
    _fetchStats();
    context.read<ProjectBloc>().state.projects.forEach((proj) => tasks.addAll(proj.tasks ?? []));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final focusTime = context.select<TimerCubit, int>((cubit) => cubit.state.focusTime);
    final breakTime = context.select<TimerCubit, int>((cubit) => cubit.state.breakTime);

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
                    child: (state.statistics?.totalTasksAll ?? 0) == 0
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
                                          isSelected: selectedMode,
                                          onPressed: (int index) {
                                            setState(() {
                                              for (int buttonIndex = 0; buttonIndex < selectedMode.length; buttonIndex++) {
                                                selectedMode[buttonIndex] = buttonIndex == index;
                                              }
                                            });
                                          },
                                          children: List.generate(3, (index) => TimeSelector(text: days[index], isSelected: selectedMode[index])),
                                        ),
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
                                        Gap.MD_H,
                                        Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: titles
                                                .map((title) => Text(
                                                      title,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleSmall
                                                          ?.copyWith(color: Theme.of(context).colorScheme.onSecondaryContainer),
                                                    ))
                                                .toList(growable: false)),
                                        const Spacer(),
                                        Column(
                                          children: [
                                            Text(
                                              selectedMode[0] ? _formatTime(state.statistics?.totalTasksToday, focusTime) : selectedMode[1] ? _formatTime(state.statistics?.totalTasksYesterday, focusTime) : _formatTime(state.statistics?.totalTasksAll, focusTime),
                                              style: Theme.of(context).textTheme.titleMedium,
                                            ),
                                            Text(
                                              selectedMode[0] ? _formatTime(state.statistics?.totalTasksToday, breakTime) : selectedMode[1] ? _formatTime(state.statistics?.totalTasksYesterday, breakTime) : _formatTime(state.statistics?.totalTasksAll, breakTime),
                                              style: Theme.of(context).textTheme.titleMedium,
                                            ),
                                            Text(
                                              "${selectedMode[0] ? state.statistics?.totalTasksToday ?? 0 : selectedMode[1] ? state.statistics?.totalTasksYesterday ?? 0 : state.statistics?.totalTasksAll ?? 0}",
                                              style: Theme.of(context).textTheme.titleMedium,
                                            )
                                          ],
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
