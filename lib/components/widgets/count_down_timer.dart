import 'package:flutter/material.dart';
import 'package:pomo/components/utils/utils.dart';

class CountDownTimer extends StatefulWidget {
  final int durationInMinutes;
  final Function(AnimationController) onControllerCreated;
  final Color innerColor;
  final Color outerColor;
  final Color middleColor;
  final Color darkShadow;
  final Color lightShadow;

  const CountDownTimer({
    super.key,
    required this.durationInMinutes,
    required this.onControllerCreated,
    required this.innerColor,
    required this.outerColor,
    required this.middleColor,
    required this.darkShadow,
    required this.lightShadow,
  });

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  void _initializeController() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(minutes: widget.durationInMinutes),
    );
    widget.onControllerCreated(_controller);
  }

  @override
  void didUpdateWidget(CountDownTimer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.durationInMinutes != oldWidget.durationInMinutes) {
      // If the duration has changed, update the controller
      _controller.duration = Duration(minutes: widget.durationInMinutes);
      // If the timer was running, restart it with the new duration
      if (_controller.isAnimating) {
        _controller.forward(from: 0);
      } else {
        // If it wasn't running, just reset it
        _controller.reset();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(
            spreadRadius: 3,
            color: context.isDarkMode ? widget.darkShadow : widget.lightShadow,
            blurRadius: 50
        )],
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.outerColor,
        ),
        padding: const EdgeInsets.all(25),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.middleColor,
            boxShadow: const [BoxShadow(spreadRadius: 5, color: Colors.black12, blurRadius: 10)],
          ),
          padding: const EdgeInsets.all(25),
          child: Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.innerColor,
              boxShadow: const [BoxShadow(spreadRadius: 12, color: Colors.black12, blurRadius: 10)],
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(12),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                Duration remaining = _controller.duration! * (1 - _controller.value);
                return Text(
                  formatTime(remaining),
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}