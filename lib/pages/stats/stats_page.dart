import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../blocs/stats/stats_bloc.dart';
import '../../components/widgets/profile_picture.dart';
import '../../components/widgets/snack_bars.dart';
import '../../components/widgets/title_page.dart';
import '../../constants/colors.dart';
import '../../cubits/auth/auth_cubit.dart';
import '../../cubits/timer/timer_cubit.dart';
import '../../extension/sized_box_extension.dart';
import '../../i18n/strings.g.dart';
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
  List<String> titles = [t.tasks.focus_time, t.tasks.break_time, t.tasks.total_tasks];
  List<String> days = [t.general.today, t.general.yesterday, t.general.all_times];

  Future<void> _fetchStats() async {
    final userId = switch (context.read<AuthCubit>().state) {
      AuthenticatedAuthState(:final user) => user.id,
      _ => ""
    };
    context.read<StatsBloc>().fetchStats(userId: userId);
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final focusTime = context.select<TimerCubit, int>((cubit) => cubit.state.focusTime);
    final breakTime = context.select<TimerCubit, int>((cubit) => cubit.state.breakTime);

    return BlocConsumer<StatsBloc, StatsState>(
      listener: (BuildContext context, StatsState state) => switch (state) {
        ErrorStatsState(:final error) => onErrorState(context, error.localizedString(context)),
        _ => null
      },
      buildWhen: (_, next) => switch (next) { ErrorStatsState() => false, _ => true },
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
                  Align(
                      alignment: Alignment.topLeft,
                      child: TitlePage(title: t.stats.title, subtitle: t.stats.subtitle)),
                  Gap.MD,
                  switch (state) {
                    FetchingStatsState() => const StatsLoading(),
                    FetchedStatsState(:final statistics) => (statistics.totalTasksAll) == 0
                        ? const NoStatsPage()
                        : Column(
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
                                    ToggleButtons(
                                      renderBorder: false,
                                      isSelected: selectedMode,
                                      onPressed: (int index) {
                                        setState(() {
                                          for (int buttonIndex = 0;
                                              buttonIndex < selectedMode.length;
                                              buttonIndex++) {
                                            selectedMode[buttonIndex] = buttonIndex == index;
                                          }
                                        });
                                      },
                                      children: [
                                        TimeSelector(
                                            text: t.general.today, isSelected: selectedMode[0]),
                                        TimeSelector(
                                            text: t.general.yesterday, isSelected: selectedMode[1]),
                                        TimeSelector(
                                            text: t.general.all_times, isSelected: selectedMode[2])
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
                                            children: [
                                              Text(
                                                t.tasks.focus_time,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall
                                                    ?.copyWith(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onSecondaryContainer),
                                              ),
                                              Text(
                                                t.tasks.break_time,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall
                                                    ?.copyWith(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onSecondaryContainer),
                                              ),
                                              Text(
                                                t.tasks.total_tasks,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall
                                                    ?.copyWith(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onSecondaryContainer),
                                              )
                                            ]),
                                        const Spacer(),
                                        Column(
                                          children: [
                                            Text(
                                              selectedMode[0]
                                                  ? _formatTime(
                                                      statistics.totalTasksToday, focusTime)
                                                  : selectedMode[1]
                                                      ? _formatTime(
                                                          statistics.totalTasksYesterday, focusTime)
                                                      : _formatTime(
                                                          statistics.totalTasksAll, focusTime),
                                              style: Theme.of(context).textTheme.titleMedium,
                                            ),
                                            Text(
                                              selectedMode[0]
                                                  ? _formatTime(
                                                      statistics.totalTasksToday, breakTime)
                                                  : selectedMode[1]
                                                      ? _formatTime(
                                                          statistics.totalTasksYesterday, breakTime)
                                                      : _formatTime(
                                                          statistics.totalTasksAll, breakTime),
                                              style: Theme.of(context).textTheme.titleMedium,
                                            ),
                                            Text(
                                              "${selectedMode[0] ? statistics.totalTasksToday : selectedMode[1] ? statistics.totalTasksYesterday : statistics.totalTasksAll}",
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
                                    BoxShadow(
                                        color: Colors.black12, spreadRadius: 0, blurRadius: 10),
                                  ],
                                ),
                                child: CustomBarChart(
                                  barBackgroundColor: kNeutral500,
                                  barColor: Theme.of(context).primaryColor,
                                  touchedBarColor: Theme.of(context).primaryColor,
                                  stats: statistics,
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
                                    BoxShadow(
                                        color: Colors.black12, spreadRadius: 0, blurRadius: 10),
                                  ],
                                ),
                                child: CustomLineChart(
                                  stats: statistics,
                                ),
                              ),
                            ],
                          ),
                    _ => const SizedBox.shrink()
                  }
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class StatsLoading extends StatelessWidget {
  const StatsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        child: Column(
            children: List.generate(
                3,
                (_) => Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    ))));
  }
}
