// ... (previous SoundPlayer and SoundCubit code remains the same)

// QuickSessionPage
import 'dart:ui';
import 'package:auto_route/auto_route.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pomo/components/widgets/sound_player.dart';
import 'package:pomo/cubits/auth/auth_cubit.dart';
import 'package:pomo/cubits/sound_cubit.dart';
import 'package:pomo/extension/sized_box_extension.dart';
import 'package:pomo/models/task/task.dart';
import 'package:pomo/pages/projects/widget/custom_toggle_button.dart';
import 'package:pomo/pages/quick_session/views/quick_break_view.dart';
import 'package:pomo/pages/quick_session/views/quick_timer_view.dart';

import '../../blocs/task/task_bloc.dart';
import '../../constants/colors.dart';
import '../../constants/constants.dart';
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
        body: BlocBuilder<SoundCubit, int>(
          builder: (context, index) {
            return Stack(
              children: [
                if (index != kSounds.length)
                  Container(
                    decoration: BoxDecoration(
                      gradient: kGradientPurple2,
                      image: DecorationImage(
                        image: Image.asset(kBackgroundsImages[index]).image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                      child: Container(
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ),
                  ),
                // Content
                SafeArea(
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
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Theme.of(context).cardColor.withOpacity(0.8),
                              ),
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
                                  CustomToggleButton(text: t.tasks.timer, selectedMode: selectedMode[0]),
                                  CustomToggleButton(text: t.tasks.breaktime, selectedMode: selectedMode[1])
                                ],
                              ),
                            ),
                          ],
                        ),
                        selectedMode[0]
                            ? QuickTimerView(
                          onComplete: () async {
                            final user = context.read<AuthCubit>().state.maybeWhen(
                                authenticated: (user) => user,
                                orElse: () => User.generateFakeData());
                            context.read<TaskBloc>().createTask(
                              task: Task(
                                name: "user-${user.id}-${DateTime.now()}",
                                pomodoro: 1,
                                pomodoroCompleted: 1,
                                userId: user.id,
                                highPriority: false,
                                dueDate: DateTime.now(),
                                createdAt: DateTime.now(),
                                completedAt: DateTime.now(),
                              ),
                            );
                            setState(() {
                              selectedMode = [false, true];
                            });
                            const NotificationDetails notificationDetails = NotificationDetails();
                            await flutterLocalNotificationsPlugin.show(
                              0,
                              'Great! 🎉',
                              'You successfully completed your focus session, let\'s take a quick brake ☕️',
                              notificationDetails,
                              payload: 'item x',
                            );
                          },
                        )
                            : QuickBreakView(
                          onComplete: () {
                            setState(() {
                              selectedMode = [true, false];
                            });
                          },
                          breakController: _breakController,
                        ),
                        Gap.MD,
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}