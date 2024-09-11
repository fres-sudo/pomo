import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/components/utils/utils.dart';
import 'package:pomo/components/widgets/back_icon_button.dart';
import 'package:pomo/cubits/timer/timer_cubit.dart';
import 'package:pomo/pages/projects/widget/custom_toggle_button.dart';
import 'package:pomo/pages/quick_session/views/quick_break_view.dart';
import 'package:pomo/pages/quick_session/views/quick_timer_view.dart';
import '../../blocs/task/task_bloc.dart';
import '../../constants/text.dart';
import '../../extension/sized_box_extension.dart';
import '../../i18n/strings.g.dart';
import '../../models/task/task.dart';
import '../../routes/app_router.gr.dart';

@RoutePage()
class WorkSessionPage extends StatefulWidget {
  const WorkSessionPage({super.key, required this.task});

  final Task task;

  @override
  State<WorkSessionPage> createState() => _WorkSessionPageState();
}

class _WorkSessionPageState extends State<WorkSessionPage> {
  var selectedMode = [true, false];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(children: [
                    BackIconButton(onPress: () => context.router.maybePop()),
                    Text(
                      t.general.work_session,
                      style: kSerzif(context),
                    ),
                  ]),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Theme.of(context).cardColor),
                    child: ToggleButtons(
                        renderBorder: false,
                        splashColor: Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                        focusColor: Colors.transparent,
                        selectedColor: Colors.transparent,
                        fillColor: Colors.transparent,
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
                        isSelected: selectedMode,
                        children: [
                          CustomToggleButton(text: t.tasks.timer, selectedMode: selectedMode[0]),
                          CustomToggleButton(text: t.tasks.breaktime, selectedMode: selectedMode[1]),
                        ]),
                  ),
                ],
              ),
              selectedMode[0] ?
                  QuickTimerView(onComplete: () {
                    final isTaskCompleted =(widget.task.pomodoroCompleted ?? 0 + 1) == widget.task.pomodoro ;
                    context.read<TaskBloc>().update(
                        id: widget.task.id!,
                        task: widget.task.copyWith(
                          pomodoroCompleted: (widget.task.pomodoroCompleted ?? 0 + 1),
                          completedAt: isTaskCompleted ? DateTime.now() : null,
                        ));

                    if(isTaskCompleted){
                      context.router.push(const SessionCompleteRoute());
                    }
                    setState(() {
                      selectedMode = [false, true];
                    });
                  })
              : QuickBreakView(onComplete: () =>  setState(() {
                selectedMode = [true, false];
              })),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.task.name.capitalize(),
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                        ),
                        Gap.XS,
                        Text(
                          widget.task.pomodoro > 1 ? "${durationToString(widget.task.pomodoro * (context.watch<TimerCubit>().state.focusTime + context.watch<TimerCubit>().state.breakTime))} ${t.general.hours} " : "${widget.task.pomodoro * (context.watch<TimerCubit>().state.focusTime + context.watch<TimerCubit>().state.breakTime)} min",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
                        ),
                      ],
                    ),
                    Text(
                      "${ widget.task.pomodoroCompleted}/${widget.task.pomodoro}",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Theme.of(context).primaryColor),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
