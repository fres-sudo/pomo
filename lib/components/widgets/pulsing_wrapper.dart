import 'package:flutter/material.dart';

class PulsingWrapper extends StatefulWidget {
  const PulsingWrapper({
    super.key,
    required this.child,
    this.shape = BoxShape.rectangle,
    this.borderRadius,
    required this.pulseColor,
    this.disabled = false,
    this.backgroundColor,
    this.pulseFactor = 0.5
  });

  final Widget child;
  final BoxShape shape;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final Color pulseColor;
  final bool disabled;
  final double pulseFactor;

  @override
  State<PulsingWrapper> createState() => _PulsingWrapperState();
}

class _PulsingWrapperState extends State<PulsingWrapper> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween(begin: 0.0, end: 12.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, _) {
        return Container(
          decoration: BoxDecoration(
            shape: widget.shape,
            color: widget.backgroundColor ?? Theme.of(context).colorScheme.secondary,
            borderRadius: widget.borderRadius,
            boxShadow: [
              for (int i = 1; i <= 2; i++)
                BoxShadow(
                color: widget.disabled
                    ? Colors.transparent
                    : widget.pulseColor.withOpacity(_animationController.value / 2),
                  spreadRadius: _animation.value * widget.pulseFactor * i ,
                )
            ],
          ),
          child: widget.child,
        );
      },
    );
  }
}