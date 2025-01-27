import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/components/utils/utils.dart';

import '../../../cubits/timer/timer_cubit.dart';
import '../../../cubits/work_session_cubit.dart';
import '../../../extension/sized_box_extension.dart';
import '../../../i18n/strings.g.dart';
import '../../../models/task/task.dart';

class CurrentTaskWidget extends StatelessWidget {
  const CurrentTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkSessionCubit, Task?>(
        builder: (context, task) => task != null
            ? Container(
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
                          task.name.capitalize(),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Gap.XS,
                        Text(
                          task.pomodoro > 1
                              ? "${durationToString(task.pomodoro * (context.watch<TimerCubit>().state.focusTime + context.watch<TimerCubit>().state.breakTime))} ${t.general.hours} "
                              : durationToString(task.pomodoro *
                                  (context.watch<TimerCubit>().state.focusTime +
                                      context.watch<TimerCubit>().state.breakTime)),
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () => context.read<WorkSessionCubit>().clear(),
                          child: Icon(Icons.close, size: 18, color: Theme.of(context).colorScheme.onSecondary),
                        ),
                        Text(
                          "${task.pomodoroCompleted}/${task.pomodoro}",
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).primaryColor),
                        )
                      ],
                    )
                  ],
                ),
              )
            : Gap.MD);
  }
}
