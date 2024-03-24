import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo/components/utils/utils.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:pomo/pages/projects/views/break_view.dart';
import 'package:pomo/pages/projects/views/timer_view.dart';
import 'package:pomo/pages/projects/widget/custom_toggle_button.dart';
import 'package:pomo/routes/app_router.gr.dart';
import '../../blocs/task/task_bloc.dart';
import '../../constants/colors.dart';
import '../../constants/text.dart';
import '../../models/task/task.dart';

@RoutePage()
class WorkSessionPage extends StatefulWidget {
  const WorkSessionPage({super.key, required this.task});

  final Task task;

  @override
  State<WorkSessionPage> createState() => _WorkSessionPageState();
}

class _WorkSessionPageState extends State<WorkSessionPage> {
  var selectedMode = [true, false];

  final CountDownController _timerController = CountDownController();
  final CountDownController _breakController = CountDownController();

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
                    InkWell(
                      onTap: () {
                        context.router.pop();
                      },
                      child: SvgPicture.asset(
                        'assets/icons/arrow-left.svg',
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).iconTheme.color ?? Colors.white,
                            BlendMode.srcIn),
                      ),
                    ),
                    Text(
                      "Work Session",
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
                          CustomToggleButton(text: "Timer", selectedMode: selectedMode[0]),
                          CustomToggleButton(text: "Break", selectedMode: selectedMode[1]),
                        ]),
                  ),
                ],
              ),
              selectedMode[0] ?
              TimerView(
                  timerController: _timerController,
                  onComplete: () {
                    context.read<TaskBloc>().updateTaskById(
                        id: widget.task.id!,
                        task: widget.task.copyWith(
                            pomodoroCompleted: (widget.task.pomodoroCompleted! + 1),
                            completed: widget.task.pomodoroCompleted == widget.task.pomodoroCompleted,
                            completedAt: widget.task.pomodoroCompleted == widget.task.pomodoroCompleted ? DateTime.now() : null,
                        ));

                    if((widget.task.pomodoroCompleted! + 1) == widget.task.pomodoro){
                    context.router.push(const SessionCompleteRoute());
                    }
                    setState(() {
                      selectedMode = [false, true];
                    });
              }) :
              BreakView(onComplete:  () {
                setState(() {
                  selectedMode = [true, false];
                });
              }, breakController: _breakController),
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
                              .displaySmall
                              ?.copyWith(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${widget.task.pomodoro * 30} min",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: kNeutral600),
                        ),
                      ],
                    ),
                    Text(
                      "${widget.task.pomodoroCompleted}/${widget.task.pomodoro}",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: kPrimary500),
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
