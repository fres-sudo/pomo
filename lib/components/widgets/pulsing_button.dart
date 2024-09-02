import 'package:flutter/material.dart';

class PulsingButton extends StatefulWidget {
  const PulsingButton({
    required Key key,
    required this.onTap,
    required this.child,
    this.shape = BoxShape.rectangle,
    this.borderRadius = 12,
    required this.buttonColor,
  }) : super(key: key);

  final GestureTapCallback onTap;
  final Widget child;
  final BoxShape shape;
  final double borderRadius;
  final Color buttonColor;

  @override
  _PulsingButtonState createState() => _PulsingButtonState();
}

class _PulsingButtonState extends State<PulsingButton> with SingleTickerProviderStateMixin {
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
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, _) {
          return Ink(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: widget.buttonColor,
              shape: widget.shape,
              boxShadow: [
                for (int i = 1; i <= 2; i++)
                  BoxShadow(
                    color: Colors.white.withOpacity(_animationController.value / 2),
                    spreadRadius: _animation.value * i,
                  )
              ],
            ),
            child: widget.child,
          );
        },
      ),
    );
  }
}