import 'package:auto_route/auto_route.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/widgets/destruction_bottomsheet.dart';
import '../../../constants/colors.dart';
import '../../../cubits/timer/timer_cubit.dart';

class TimerView extends StatefulWidget {
   TimerView({super.key, required this.onComplete, required this.timerController});

   final VoidCallback? onComplete;
   CountDownController timerController;

  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kPrimary100,
                boxShadow: [
                  BoxShadow(
                    color: kPrimary400.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 100,
                  ),
                ],
              ),
              height: MediaQuery.sizeOf(context).height / 3,
              padding: const EdgeInsets.all(18.5),
            ),
            Container(
              height: MediaQuery.sizeOf(context).height / 3 - 37,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: kPrimary300,
              ),
            ),
            Container(
              height:
              MediaQuery.sizeOf(context).height / 3 - (37 * 2),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: kPrimary900,
              ),
              child: CircularCountDownTimer(
                duration: context.read<TimerCubit>().focusTime * 60,
                initialDuration: 0,
                controller: widget.timerController,
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 2,
                ringColor: kPrimary300,
                fillColor: kPrimary900,
                fillGradient: const RadialGradient(
                  radius: 10,
                  colors: [kPrimary900, kPrimary300],
                ),
                backgroundColor: kPrimary900,
                backgroundGradient: null,
                strokeWidth: 10.0,
                strokeCap: StrokeCap.round,
                textStyle: GoogleFonts.inter(
                  fontSize: 33.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textFormat: CountdownTextFormat.S,
                isReverse: true,
                isReverseAnimation: true,
                isTimerTextShown: true,
                autoStart: false,
                onStart: () {},
                onComplete: widget.onComplete,
                timeFormatterFunction: (defaultFormatterFunction, Duration duration) {
                  int minutes = duration.inMinutes;
                  int seconds = duration.inSeconds.remainder(60);
                  return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
                },
              ),
            ),
          ],
        ),
        Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () {
                  if (!widget.timerController.isStarted) {
                    widget.timerController.start();
                  } else {
                    if (widget.timerController.isPaused) {
                      widget.timerController.resume();
                    } else {
                      widget.timerController.pause();
                    }
                  }
                  setState(() {}); // Update UI after modifying timer state
                },
                onLongPress: () => showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) =>
                        DestructionBottomSheet(title: "Reset Timer", buttonText: "Reset",
                            description: "Are you sure you want to reset the timer",
                            function: () {widget.timerController.restart(duration: 25*60); context.router.pop();} )),
                child: widget.timerController.isStarted && !widget.timerController.isPaused
                    ? Icon(Icons.pause_circle_filled_rounded,
                    color: Theme.of(context).iconTheme.color, size: 70)
                    : Icon(Icons.play_circle_fill_rounded,
                    color: Theme.of(context).iconTheme.color, size: 70),
              ),
            ),

          ],
        ),
      ],
    );
  }
}
