import 'package:auto_route/auto_route.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/blocs/user/user_bloc.dart';
import 'package:pomo/models/task/task.dart';
import 'package:pomo/pages/projects/widget/custom_toggle_button.dart';
import 'package:pomo/pages/quick_session/views/quick_break_view.dart';
import 'package:pomo/pages/quick_session/views/quick_timer_view.dart';
import '../../blocs/task/task_bloc.dart';
import '../../constants/text.dart';

@RoutePage()
class QuickSessionPage extends StatefulWidget {
  const QuickSessionPage({super.key});

  @override
  State<QuickSessionPage> createState() => _QuickSessionPageState();
}

class _QuickSessionPageState extends State<QuickSessionPage> {
  var selectedMode = [true, false];

  final CountDownController _timerController = CountDownController();
  final CountDownController _breakController = CountDownController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskBloc, TaskState>(
      listener: (context , state){},
      builder: (context, state) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Quick Session", style: kSerzif(context)),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 14),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Theme
                              .of(context)
                              .cardColor),
                      child: ToggleButtons(
                          renderBorder: false,
                          splashColor: Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          focusColor: Colors.transparent,
                          selectedColor: Colors.transparent,
                          fillColor: Colors.transparent,
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
                          isSelected: selectedMode,
                          children: [
                            CustomToggleButton(text: "Timer", selectedMode: selectedMode[0]),
                            CustomToggleButton(text: "Break", selectedMode: selectedMode[1])
                          ]),
                    ),
                  ],
                ),

                selectedMode[0]
                    ? QuickTimerView(onComplete: () {
                 String id = context.read<UserBloc>().state.maybeWhen(authenticated: (user) => user.id, orElse: () => "");
                  context.read<TaskBloc>().createTask(task: Task(name: "user-$id-${DateTime.now()}",
                      pomodoro: 1,
                      completed: true,
                      user: id,
                      createdAt: DateTime.now(),
                      completedAt: DateTime.now(),
                      pomodoroCompleted: 1));
                  setState(() {
                    selectedMode = [false, true];
                  });
                }, timerController: _timerController)
                    : QuickBreakView(
                    onComplete: () {
                      setState(() {
                        selectedMode = [true, false];
                      });
                    }, breakController: _breakController),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
