import 'package:auto_route/auto_route.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/widgets/destruction_bottomsheet.dart';
import '../../../constants/colors.dart';
import '../../../cubits/timer/timer_cubit.dart';

class BreakView extends StatefulWidget {
   BreakView({super.key, required this.onComplete, required this.breakController});

  final VoidCallback? onComplete;
  CountDownController breakController;


  @override
  State<BreakView> createState() => _BreakViewState();
}

class _BreakViewState extends State<BreakView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kGreen200,
                    boxShadow: [
                      BoxShadow(
                        color: kGreen200.withOpacity(0.51),
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
                    color: kGreen400,
                  ),
                ),
                Container(
                  height:
                  MediaQuery.sizeOf(context).height / 3 - (37 * 2),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: kGreen600,
                  ),
                  child: CircularCountDownTimer(
                    duration: state.breakTime * 60,
                    initialDuration: 0,
                    controller: widget.breakController,
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 2,
                    ringColor: kGreen400,
                    fillColor: kGreen600,
                    fillGradient: const RadialGradient(
                      radius: 10,
                      colors: [kGreen600, kGreen400],
                    ),
                    backgroundColor: kGreen600,
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
                    onStart: () {
                      print('Countdown Started');
                    },
                    onComplete: widget.onComplete,
                    timeFormatterFunction: (defaultFormatterFunction, Duration duration) {
                      // Custom time formatter function
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
                      if (!widget.breakController.isStarted) {
                        widget.breakController.start();
                      } else {
                        if (widget.breakController.isPaused) {
                          widget.breakController.resume();
                        } else {
                          widget.breakController.pause();
                        }
                      }
                      setState(() {}); // Update UI after modifying timer state
                    },
                    onLongPress: () => showModalBottomSheet(
                        context: context,
                        useRootNavigator: true,
                        builder: (BuildContext context) =>
                            DestructionBottomSheet(title: "Reset Timer", buttonText: "Reset",
                                description: "Are you sure you want to reset the timer",
                                function: () {widget.breakController.restart(duration: state.breakTime * 60); context.router.pop();} )),
                    child: widget.breakController.isStarted && !widget.breakController.isPaused
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
    );
  }
}
