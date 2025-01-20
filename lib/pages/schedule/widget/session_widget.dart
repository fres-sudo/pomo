import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/constants/colors.dart';
import 'package:pomo/cubits/timer_session_cubit.dart';

class SessionWidget extends StatelessWidget {
  const SessionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerSessionCubit, TimerSessionState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => AutoTabsRouter.of(context).setActiveIndex(2),
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(value: state.remainingTime == Duration.zero ? 1 : state.progress, color: kPrimary500),
              state.isRunning && !state.isPaused && state.progress < 1
                  ? Icon(
                      Icons.pause_rounded,
                      color: kPrimary500,
                    )
                  : Icon(
                      Icons.play_arrow_rounded,
                      color: kPrimary500,
                    ),
            ],
          ),
        );
      },
    );
  }
}
