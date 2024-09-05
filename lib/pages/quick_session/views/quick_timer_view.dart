import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/components/widgets/destruction_bottomsheet.dart';
import 'package:pomo/components/widgets/pulsing_wrapper.dart';
import 'package:pomo/extension/sized_box_extension.dart';

import '../../../components/widgets/count_down_timer.dart';
import '../../../constants/colors.dart';
import '../../../cubits/timer/timer_cubit.dart';
import '../../../i18n/strings.g.dart';

class QuickTimerView extends StatefulWidget {
  QuickTimerView({super.key, required this.onComplete});

  final VoidCallback? onComplete;

  @override
  State<QuickTimerView> createState() => _QuickTimerViewState();
}

class _QuickTimerViewState extends State<QuickTimerView> {
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
    return BlocBuilder<TimerCubit, TimerState>(builder: (context, state) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PulsingWrapper(
            shape: BoxShape.circle,
            pulseColor: kPrimary300,
            pulseFactor: 2,
            disabled: !_isRunning,
            child: CountDownTimer(
              innerColor: kPrimary900,
              middleColor: kPrimary300,
              outerColor: kPrimary400,
              darkShadow: kPrimary500,
              lightShadow: kPrimary600.withOpacity(0.8),
              durationInMinutes: state.focusTime,
              onControllerCreated: _onControllerCreated,
            ),
          ),
          Column(
            children: [
              Gap.XL,
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
    });
  }
}