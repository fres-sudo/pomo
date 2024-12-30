import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pomo/components/utils/utils.dart';
import 'package:pomo/components/widgets/custom_floating_button.dart';
import 'package:pomo/components/widgets/dotted_divider.dart';
import 'package:pomo/components/widgets/profile_picture.dart';
import 'package:pomo/components/widgets/snack_bars.dart';
import 'package:pomo/components/widgets/title_page.dart';
import 'package:pomo/constants/styles.dart';
import 'package:pomo/cubits/auth/auth_cubit.dart';
import 'package:pomo/cubits/notification/notification_cubit.dart';
import 'package:pomo/pages/projects/widget/task_bottom_sheet.dart';
import 'package:pomo/pages/schedule/widget/session_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../blocs/project/project_bloc.dart';
import '../../blocs/task/task_bloc.dart';
import '../../components/cards/task_card.dart';
import '../../constants/text.dart';
import '../../cubits/schedule/schedule_cubit.dart';
import '../../extension/sized_box_extension.dart';
import '../../i18n/strings.g.dart';
import '../../routes/app_router.gr.dart';
import '../../services/notification/notification_service.dart';
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

  @override
  Widget build(BuildContext context) {
    context.watch<AuthCubit>().state.whenOrNull(
      authenticated: (user) {
        context.read<TaskBloc>().fetch(userId: user.id, date: context.read<ScheduleCubit>().state.selectedDay, format: CalendarFormat.month);
        context.read<ProjectBloc>().getProjectsByUser(userId: user.id);
      },
    );
    return MultiBlocListener(
      listeners: [
        BlocListener<ProjectBloc, ProjectState>(
          listener: (context, state) {
            for (final project in state.projects) {
              if (project.completedAt != null) {
                final notificationId = context.read<NotificationCubit>().state.scheduledNotifications[project.id];
                if (notificationId != null) {
                  NotificationService.cancelNotification(notificationId);
                  context.read<NotificationCubit>().removeScheduledNotification(project.id ?? "");
                }
              }
            }
          },
        ),
        BlocListener<TaskBloc, TaskState>(
          listener: (context, state) {
            for (final task in state.tasks) {
              if (task.completedAt != null) {
                final notificationId = context.read<NotificationCubit>().state.scheduledNotifications[task.id];
                if (notificationId != null) {
                  NotificationService.cancelNotification(notificationId);
                  context.read<NotificationCubit>().removeScheduledNotification(task.id ?? "");
                }
              }
            }
            if (state.error != null) {
              onErrorState(context, state.error!.localizedString(context));
            }
            context.read<ScheduleCubit>().setSelectedTasks(
                tasks: state.tasks.where((t) => isSameDay(t.dueDate, context.read<ScheduleCubit>().state.selectedDay)).toList(growable: false));
          },
        )
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
                  child: Skeletonizer(
                      enabled: context.watch<AuthCubit>().state.maybeWhen(authenticated: (_) => false, orElse: () => true) &&
                          state.isLoading &&
                          context.watch<ProjectBloc>().state.isLoading,
                      child: BlocBuilder<ScheduleCubit, ScheduleState>(
                        builder: (context, scheduleState) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitlePage(
                                  title: "Hi ${context.read<AuthCubit>().state.maybeWhen(authenticated:(user) => user.username, orElse: () => "")}",
                                  subtitle: t.schedule.subtitle),
                              TableCalendar(
                                  focusedDay: scheduleState.focusedDay,
                                  firstDay: DateTime.now().subtract(const Duration(days: 365)),
                                  lastDay: DateTime.now().add(const Duration(days: 365)),
                                  onDaySelected: (selectedDay, focusedDay) => context.read<ScheduleCubit>().onDaySelected(
                                      selectedDay: selectedDay,
                                      focusedDay: focusedDay,
                                      onPress: () => context.read<ScheduleCubit>().setSelectedTasks(
                                          tasks: state.tasks.where((t) => isSameDay(t.dueDate, selectedDay)).toList(growable: false))),
                                  calendarBuilders: CalendarBuilders(markerBuilder: (context, day, events) {
                                    return Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: state.tasks.where((task) => isSameDay(task.dueDate, day)).toList().isNotEmpty || context.watch<ProjectBloc>().state.projects.where((project) => isSameDay(project.endDate, day)).toList().isNotEmpty
                                              ? Theme.of(context).colorScheme.primaryContainer.withOpacity(0.6)
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
                                  },
                                  onPageChanged: (date) {
                                    context.read<ScheduleCubit>().onDaySelected(
                                          selectedDay: date,
                                          focusedDay: date,
                                        );
                                    context.read<TaskBloc>().fetch(
                                        userId: context.read<AuthCubit>().state.whenOrNull(authenticated: (user) => user.id) ?? "",
                                        date: date,
                                        format: context.read<ScheduleCubit>().state.calendarFormat);
                                  },
                                  calendarFormat: scheduleState.calendarFormat,
                                  onFormatChanged: (format) {
                                    context.read<TaskBloc>().fetch(
                                        userId: context.read<AuthCubit>().state.whenOrNull(authenticated: (user) => user.id) ?? "",
                                        date: scheduleState.selectedDay,
                                        format: format);
                                    context.read<ScheduleCubit>().changeCalendarFormat(format: format);
                                  },
                                  locale: TranslationProvider.of(context).flutterLocale.languageCode,
                                  startingDayOfWeek: StartingDayOfWeek.monday,
                                  selectedDayPredicate: (day) => isSameDay(scheduleState.selectedDay, day),
                                  rangeSelectionMode: RangeSelectionMode.disabled,
                                  calendarStyle: kCalendarStyle(context)),
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
                      )),
                ),
              ));
        },
      ),
    );
  }
}
