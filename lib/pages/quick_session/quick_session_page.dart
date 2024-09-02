import 'package:auto_route/auto_route.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pomo/components/widgets/sound_player.dart';
import 'package:pomo/cubits/auth/auth_cubit.dart';
import 'package:pomo/extension/sized_box_extension.dart';
import 'package:pomo/models/task/task.dart';
import 'package:pomo/pages/projects/widget/custom_toggle_button.dart';
import 'package:pomo/pages/quick_session/views/quick_break_view.dart';
import 'package:pomo/pages/quick_session/views/quick_timer_view.dart';

import '../../blocs/task/task_bloc.dart';
import '../../constants/text.dart';
import '../../i18n/strings.g.dart';
import '../../main.dart';
import '../../models/user/user.dart';

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
        listener: (context, state) {},
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(t.general.quick_session, style: kSerzif(context)),
                              SoundPlayer(),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Theme.of(context).cardColor),
                            child: ToggleButtons(
                                renderBorder: false,
                                onPressed: (int index) {
                                  setState(() {
                                    for (int buttonIndex = 0; buttonIndex < selectedMode.length; buttonIndex++) {
                                      selectedMode[buttonIndex] = buttonIndex == index;
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
                          ? QuickTimerView(
                              onComplete: () async {
                                final user =
                                    context.read<AuthCubit>().state.maybeWhen(authenticated: (user) => user, orElse: () => User.generateFakeData());
                                context.read<TaskBloc>().createTask(
                                    task: Task(
                                        name: "user-${user.id}-${DateTime.now()}",
                                        pomodoro: 1,
                                        userId: user.id,
                                        highPriority: false,
                                        dueDate: DateTime.now(),
                                        createdAt: DateTime.now(),
                                        completedAt: DateTime.now(),
                                        pomodoroCompleted: 1));
                                setState(() {
                                  selectedMode = [false, true];
                                });
                                const NotificationDetails notificationDetails = NotificationDetails();
                                await flutterLocalNotificationsPlugin.show(0, 'Great! 🎉',
                                    'You successfully completed your focus session, let\'s take a quick brake ☕️', notificationDetails,
                                    payload: 'item x');
                              },
                              timerController: _timerController)
                          : QuickBreakView(
                              onComplete: () {
                                setState(() {
                                  selectedMode = [true, false];
                                });
                              },
                              breakController: _breakController),
                      Gap.MD,
                    ],
                  ),
                ),
              ),
            ));
  }
}
