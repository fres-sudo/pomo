import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pomo/components/utils/utils.dart';
import 'package:pomo/components/widgets/custom_floating_button.dart';
import 'package:pomo/components/widgets/dotted_divider.dart';
import 'package:pomo/constants/colors.dart';
import 'package:pomo/constants/enum.dart';
import 'package:pomo/constants/styles.dart';
import 'package:pomo/cubits/auth/auth_cubit.dart';
import 'package:pomo/cubits/schedule/schedule_cubit.dart';
import 'package:pomo/pages/projects/widget/task_bottom_sheet.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../blocs/project/project_bloc.dart';
import '../../blocs/task/task_bloc.dart';
import '../../components/cards/task_card.dart';
import '../../constants/text.dart';
import '../../extension/sized_box_extension.dart';
import '../../i18n/strings.g.dart';

@RoutePage()
class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  void fetchScheduledTask(BuildContext context) {
    final userId = context.read<AuthCubit>().state.maybeWhen(authenticated: (user) => user.id, orElse: () => "oresle");
    context.read<TaskBloc>().fetch(userId: userId, date: context.read<ScheduleCubit>().state.selectedDay, type: FetchType.month);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) => state.whenOrNull(
        authenticated: (user) => {
          context.read<TaskBloc>().fetch(userId: user.id, date: context.read<ScheduleCubit>().state.selectedDay, type: FetchType.month),
          context.read<ProjectBloc>().getProjectsByUser(userId: user.id)
        },
      ),
      child: BlocConsumer<TaskBloc, TaskState>(
        listener: (context, state) {
          context.read<ScheduleCubit>().setSelectedTasks(
              tasks: state.tasks.where((t) => isSameDay(t.dueDate, context.read<ScheduleCubit>().state.selectedDay)).toList(growable: false));
        },
        builder: (context, state) {
          return Scaffold(
              floatingActionButton: CustomFloatingActionButton(
                  herTag: "fab-schedule",
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        useRootNavigator: true,
                        isScrollControlled: true,
                        builder: (context) => TaskBottomSheet(
                              dueDate: context.read<ScheduleCubit>().state.selectedDay,
                            ));
                  }),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Skeletonizer(
                      enabled: context.watch<AuthCubit>().state.maybeWhen(authenticated: (_) => false, orElse: () => true) &&
                          state.isLoading &&
                          context.watch<ProjectBloc>().state.isLoading,
                      child: BlocBuilder<ScheduleCubit, ScheduleState>(
                        builder: (context, scheduleState) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(t.general.schedule, style: kSerzif(context)),
                              TableCalendar(
                                  focusedDay: scheduleState.focusedDay,
                                  firstDay: DateTime.now().subtract(const Duration(days: 365)),
                                  lastDay: DateTime.now().add(const Duration(days: 365)),
                                  onDaySelected: (selectedDay, focusedDay) => context.read<ScheduleCubit>().onDaySelected(
                                      selectedDay: selectedDay,
                                      focusedDay: focusedDay,
                                      onFetch: () => fetchScheduledTask(context),
                                      onNoFetch: () => context.read<ScheduleCubit>().setSelectedTasks(
                                          tasks: state.tasks.where((t) => isSameDay(t.dueDate, selectedDay)).toList(growable: false))),
                                  calendarBuilders: CalendarBuilders(markerBuilder: (context, day, events) {
                                    final tasks = context.watch<ScheduleCubit>().state.tasks;
                                    return Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: state.tasks.where((task) => isSameDay(task.dueDate, day)).toList().isNotEmpty
                                              ? Theme.of(context).primaryColor.withOpacity(0.4)
                                              : Colors.transparent),
                                    );
                                  }),
                                  headerStyle: HeaderStyle(
                                    formatButtonDecoration: const BoxDecoration(),
                                    titleTextFormatter: (date, locale) =>
                                        "${DateFormat.MMMM(locale).format(date).capitalize()} ${DateFormat.y(locale).format(date)}",
                                  ),
                                  availableCalendarFormats: {
                                    CalendarFormat.week: t.general.week,
                                    CalendarFormat.month: t.general.month,
                                    CalendarFormat.twoWeeks: "2 ${t.general.weeks}"
                                  },
                                  calendarFormat: scheduleState.calendarFormat,
                                  onFormatChanged: (format) => context.read<ScheduleCubit>().changeCalendarFormat(format: format),
                                  locale: TranslationProvider.of(context).flutterLocale.languageCode,
                                  startingDayOfWeek: StartingDayOfWeek.monday,
                                  selectedDayPredicate: (day) => isSameDay(scheduleState.selectedDay, day),
                                  rangeSelectionMode: RangeSelectionMode.disabled,
                                  calendarStyle: kCalendarStyle(context)),
                              Gap.XS,
                              const DottedDivider(),
                              Gap.SM,
                              BlocBuilder<ProjectBloc, ProjectState>(
                                builder: (context, projectState) {
                                  final endingProjects =
                                      projectState.projects.where((p) => isSameDay(p.endDate, scheduleState.focusedDay)).toList(growable: false);
                                  return endingProjects.isNotEmpty
                                      ? Skeletonizer(
                                        enabled: projectState.isLoading,
                                        child: Column(
                                            children: [
                                              Container(
                                                height: 35,
                                                decoration:
                                                    BoxDecoration(color: kPrimary500, borderRadius: BorderRadius.circular(12)),
                                                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    const Icon(
                                                      Icons.playlist_add_check_rounded,
                                                      color: Colors.white,
                                                    ),
                                                    Gap.SM_H,
                                                    Text(
                                                      "${t.projects.ending_today}: ",
                                                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        endingProjects.map((p) => p.name).toList(growable: false).join(', '),
                                                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                                          color: Colors.white,
                                                        ),
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Gap.XS,
                                              const DottedDivider(),
                                              Gap.XS,
                                            ],
                                          ),
                                      )
                                      : const SizedBox();
                                },
                              ),
                              Expanded(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: scheduleState.tasks.length,
                                    itemBuilder: (context, index) => TaskCard(
                                          task: scheduleState.tasks[index],
                                          size: TaskCardSize.small,
                                        )),
                              ),
                            ],
                          );
                        },
                      )),
                ),
              ));
        },
      ),
    );
  }
}
