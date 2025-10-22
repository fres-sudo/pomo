import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pomo/components/utils/utils.dart';
import 'package:pomo/components/widgets/custom_floating_button.dart';
import 'package:pomo/components/widgets/dotted_divider.dart';
import 'package:pomo/components/widgets/snack_bars.dart';
import 'package:pomo/components/widgets/title_page.dart';
import 'package:pomo/constants/styles.dart';
import 'package:pomo/cubits/auth/auth_cubit.dart';
import 'package:pomo/cubits/notification/notification_cubit.dart';
import 'package:pomo/pages/projects/widget/task_bottom_sheet.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../blocs/project/project_bloc.dart';
import '../../blocs/task/task_bloc.dart';
import '../../components/cards/task_card.dart';
import '../../cubits/schedule/schedule_cubit.dart';
import '../../extension/sized_box_extension.dart';
import '../../i18n/strings.g.dart';
import 'widget/ending_project_widget.dart';

@RoutePage()
class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  void initState() {
    context.read<AuthCubit>().checkAuthentication();
    super.initState();
  }

  void fetchTasks() {
    context.read<TaskBloc>().fetch(
        date: context.read<ScheduleCubit>().state.selectedDay,
        format: context.read<ScheduleCubit>().state.calendarFormat);
  }

  @override
  Widget build(BuildContext context) {
    switch (context.watch<AuthCubit>()) {
      case AuthenticatedAuthState():
        context.read<TaskBloc>().fetch(
            date: context.read<ScheduleCubit>().state.selectedDay, format: CalendarFormat.month);
        break;
      default:
        break;
    }
    return MultiBlocListener(
      listeners: [
        BlocListener<ProjectBloc, ProjectState>(
            listener: (context, state) => switch (state) {
                  FetchedProjectState(:final projects) => () {
                      for (final project in projects) {
                        if (project.completedAt != null) {
                          final notificationId = context
                              .read<NotificationCubit>()
                              .state
                              .scheduledNotifications[project.id];
                          if (notificationId != null) {
                            // NotificationService.cancelNotification(notificationId);
                            context
                                .read<NotificationCubit>()
                                .removeScheduledNotification(project.id ?? "");
                          }
                        }
                      }
                    },
                  _ => null,
                }),
        BlocListener<TaskBloc, TaskState>(
            listener: (context, state) => switch (state) {
                  ErrorFetchigProjectState(:final error) =>
                    onErrorState(context, error.localizedString(context)),
                  CreatedTaskState() => fetchTasks(),
                  UpdatedTaskState() => fetchTasks(),
                  DeletedTaskState() => fetchTasks(),
                  FetchedTaskState(:final tasks) => () {
                      context.read<ScheduleCubit>().setSelectedTasks(
                          tasks: tasks
                              .where((t) => isSameDay(
                                  t.dueDate, context.read<ScheduleCubit>().state.selectedDay))
                              .toList(growable: false));
                      for (final task in tasks) {
                        if (task.completedAt != null) {
                          final notificationId = context
                              .read<NotificationCubit>()
                              .state
                              .scheduledNotifications[task.id];
                          if (notificationId != null) {
                            // NotificationService.cancelNotification(notificationId);
                            context
                                .read<NotificationCubit>()
                                .removeScheduledNotification(task.id ?? "");
                          }
                        }
                      }
                    },
                  _ => null
                })
      ],
      child: BlocBuilder<TaskBloc, TaskState>(
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
                  child: BlocBuilder<ScheduleCubit, ScheduleState>(
                    builder: (context, scheduleState) {
                      final isAuthLoading = switch (context.watch<AuthCubit>().state) {
                        AuthenticatedAuthState() => false,
                        _ => true,
                      };
                      final isProjectLoading = switch (context.watch<ProjectBloc>().state) {
                        FetchingProjectState() => true,
                        _ => false,
                      };
                      final isLoading = isAuthLoading || isProjectLoading;
                      final username = switch (context.read<AuthCubit>().state) {
                        AuthenticatedAuthState(:final user) => user.username,
                        _ => "",
                      };
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitlePage(
                              title: "${t.schedule.title} $username 👋",
                              subtitle: t.schedule.subtitle),
                          Skeletonizer(
                            enabled: isLoading,
                            child: TableCalendar(
                                focusedDay: scheduleState.focusedDay,
                                firstDay: DateTime.now().subtract(const Duration(days: 365)),
                                lastDay: DateTime.now().add(const Duration(days: 365)),
                                onDaySelected: (selectedDay, focusedDay) => context
                                    .read<ScheduleCubit>()
                                    .onDaySelected(
                                        selectedDay: selectedDay,
                                        focusedDay: focusedDay,
                                        onPress: () => context
                                            .read<ScheduleCubit>()
                                            .setSelectedTasks(
                                                tasks: switch (state) {
                                              FetchedTaskState(:final tasks) => tasks
                                                  .where((t) => isSameDay(t.dueDate, selectedDay))
                                                  .toList(growable: false),
                                              _ => [],
                                            })),
                                calendarBuilders:
                                    CalendarBuilders(markerBuilder: (context, day, events) {
                                  return Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: switch (state) {
                                          FetchedTaskState(:final tasks) => tasks
                                                  .where((task) => isSameDay(task.dueDate, day))
                                                  .toList()
                                                  .isNotEmpty ||
                                              switch (context.watch<ProjectBloc>().state) {
                                                FetchedProjectState(:final projects) => projects
                                                    .where((project) =>
                                                        isSameDay(project.endDate, day))
                                                    .toList()
                                                    .isNotEmpty,
                                                _ => false
                                              },
                                          _ => false
                                        }
                                            ? Theme.of(context)
                                                .colorScheme
                                                .primaryContainer
                                                .withValues(alpha: .6)
                                            : Colors.transparent),
                                  );
                                }),
                                headerStyle: HeaderStyle(
                                  formatButtonDecoration: const BoxDecoration(),
                                  titleCentered: true,
                                  titleTextFormatter: (date, locale) =>
                                      "${DateFormat.MMMM(locale).format(date).capitalize()} ${DateFormat.y(locale).format(date)}",
                                ),
                                availableCalendarFormats: {
                                  CalendarFormat.month: t.general.month,
                                  CalendarFormat.week: t.general.week,
                                },
                                onPageChanged: (date) {
                                  context.read<ScheduleCubit>().onDaySelected(
                                        selectedDay: date,
                                        focusedDay: date,
                                      );
                                  context.read<TaskBloc>().fetch(
                                      date: date,
                                      format: context.read<ScheduleCubit>().state.calendarFormat);
                                },
                                calendarFormat: scheduleState.calendarFormat,
                                onFormatChanged: (format) {
                                  context
                                      .read<TaskBloc>()
                                      .fetch(date: scheduleState.selectedDay, format: format);
                                  context
                                      .read<ScheduleCubit>()
                                      .changeCalendarFormat(format: format);
                                },
                                locale: TranslationProvider.of(context).flutterLocale.languageCode,
                                startingDayOfWeek: StartingDayOfWeek.monday,
                                selectedDayPredicate: (day) =>
                                    isSameDay(scheduleState.selectedDay, day),
                                rangeSelectionMode: RangeSelectionMode.disabled,
                                calendarStyle: kCalendarStyle(context)),
                          ),
                          Gap.XS,
                          const DottedDivider(),
                          Gap.SM,
                          EndingProjectWidget(
                            focusedDay: scheduleState.focusedDay,
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
                  ),
                ),
              ));
        },
      ),
    );
  }
}
