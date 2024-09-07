import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/widgets/count_down_timer.dart';
import '../../../components/widgets/destruction_bottomsheet.dart';
import '../../../components/widgets/pulsing_wrapper.dart';
import '../../../constants/colors.dart';
import '../../../cubits/timer/timer_cubit.dart';
import '../../../i18n/strings.g.dart';

class QuickBreakView extends StatefulWidget {
  QuickBreakView({super.key, required this.onComplete, });

  final VoidCallback? onComplete;

  @override
  State<QuickBreakView> createState() => _QuickBreakViewState();
}

class _QuickBreakViewState extends State<QuickBreakView> {

  late AnimationController _controller;
  bool _isRunning = false;

  void _onControllerCreated(AnimationController controller) {
    _controller = controller;
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onComplete?.call();
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PulsingWrapper(
              shape: BoxShape.circle,
              pulseColor: kGreen400,
              pulseFactor: 2,
              disabled: !_isRunning,
              child: CountDownTimer(
                innerColor: kGreen600,
                middleColor: kGreen400,
                outerColor: kGreen200,
                darkShadow: kGreen200.withOpacity(0.51),
                lightShadow: kGreen300.withOpacity(0.8),
                durationInMinutes: state.breakTime,
                onControllerCreated: _onControllerCreated,
              ),
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
                      setState(() {
                        if (!_isRunning) {
                          _controller.forward();
                        } else {
                          if (_controller.isAnimating) {
                            _controller.stop();
                          } else {
                            _controller.forward();
                          }
                        }
                        _isRunning = !_isRunning;
                      });
                    },
                    onLongPress: () => showModalBottomSheet(
                      useRootNavigator: true,
                      context: context,
                      builder: (BuildContext context) => DestructionBottomSheet(
                        title: t.tasks.reset_timer.title,
                        buttonText: t.general.reset,
                        description: t.tasks.reset_timer.description,
                        function: () {
                          _controller.reset();
                          _isRunning = false;
                          setState(() {});
                          context.router.maybePop();
                        },
                      ),
                    ),
                    child: Icon(
                      _isRunning && _controller.isAnimating
                          ? Icons.pause_circle_filled_rounded
                          : Icons.play_circle_fill_rounded,
                      color: Theme.of(context).iconTheme.color,
                      size: 70,
                    ),
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
