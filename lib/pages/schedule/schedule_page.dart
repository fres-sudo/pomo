import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/components/widgets/custom_floating_button.dart';
import 'package:pomo/components/widgets/dotted_divider.dart';
import 'package:pomo/constants/enum.dart';
import 'package:pomo/constants/styles.dart';
import 'package:pomo/cubits/auth/auth_cubit.dart';
import 'package:pomo/cubits/schedule/schedule_cubit.dart';
import 'package:pomo/pages/projects/widget/task_bottom_sheet.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../blocs/task/task_bloc.dart';
import '../../components/cards/task_card.dart';
import '../../components/widgets/profile_picture.dart';
import '../../constants/text.dart';
import '../../extension/sized_box_extension.dart';
import '../../i18n/strings.g.dart';
import '../../routes/app_router.gr.dart';

@RoutePage()
class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  void fetchScheduledTask(BuildContext context) {
    final userId = context.read<AuthCubit>().state.maybeWhen(authenticated: (user) => user.id, orElse: () => "oresle");
    print("USERID: $userId");
    context.read<TaskBloc>().fetch(userId: userId, date: context.read<ScheduleCubit>().state.selectedDay, type: FetchType.month);
  }

  bool isLoading = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((duration) => Future.delayed(duration, () {
          fetchScheduledTask(context);
          setState(() {
            isLoading = false;
          });
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskBloc, TaskState>(
      listener: (context, state) {
        context.read<ScheduleCubit>().setSelectedTasks(
            tasks: state.tasks.where((t) => isSameDay(t.dueDate, context.read<ScheduleCubit>().state.selectedDay)).toList(growable: false));
      },
      builder: (context, state) {
        return Scaffold(
            floatingActionButton: CustomFloatingActionButton(onPressed: () {
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
                    enabled: isLoading || state.isLoading,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Schedule", style: kSerzif(context)),
                            InkWell(
                                borderRadius: BorderRadius.circular(50),
                                onTap: () => context.router.push(const ProfileRoute()),
                                child: const ProfilePicture()),
                          ],
                        ),
                        BlocBuilder<ScheduleCubit, ScheduleState>(
                            builder: (context, scheduleState) => TableCalendar(
                                focusedDay: scheduleState.focusedDay,
                                firstDay: DateTime.now().subtract(const Duration(days: 365)),
                                lastDay: DateTime.now().add(const Duration(days: 365)),
                                onDaySelected: (selectedDay, focusedDay) => context.read<ScheduleCubit>().onDaySelected(
                                    selectedDay: selectedDay,
                                    focusedDay: focusedDay,
                                    onFetch: () => fetchScheduledTask(context),
                                    onNoFetch: () {
                                      context.read<ScheduleCubit>().setSelectedTasks(
                                        tasks: state.tasks.where((t) => isSameDay(t.dueDate, selectedDay)).toList(growable: false));
                                    }),
                                calendarFormat: scheduleState.calendarFormat,
                                onFormatChanged: (format) => context.read<ScheduleCubit>().changeCalendarFormat(format: format),
                                locale: TranslationProvider.of(context).flutterLocale.languageCode,
                                startingDayOfWeek: StartingDayOfWeek.monday,
                                selectedDayPredicate: (day) => isSameDay(scheduleState.selectedDay, day),
                                rangeSelectionMode: RangeSelectionMode.disabled,
                                calendarStyle: kCalendarStyle(context))),
                        Gap.SM,
                        const DottedDivider(),
                        Gap.SM,
                        BlocBuilder<ScheduleCubit, ScheduleState>(
                            builder: (context, scheduleState) => Expanded(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: scheduleState.tasks.length,
                                      itemBuilder: (context, index) => TaskCard(
                                            task: scheduleState.tasks[index],
                                            size: TaskCardSize.small,
                                          )),
                                )),
                      ],
                    )),
              ),
            ));
      },
    );
  }
}
