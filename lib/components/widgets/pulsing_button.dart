import 'package:flutter/material.dart';
import 'package:pomo/components/widgets/pulsing_wrapper.dart';

class PulsingButton extends StatelessWidget {
  const PulsingButton(
      {super.key,
      required this.onTap,
      required this.child,
      this.shape = BoxShape.rectangle,
      this.borderRadius = 12,
      this.onLongPress,
      required this.pulseColor,
      this.disabled = false});

  final GestureTapCallback onTap;
  final GestureTapCallback? onLongPress;
  final Widget child;
  final BoxShape shape;
  final double borderRadius;
  final Color pulseColor;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onTap,
        onLongPress: onLongPress,
        child: PulsingWrapper(
            pulseColor: pulseColor,
            shape: shape,
            disabled: disabled,
            borderRadius: BorderRadius.circular(borderRadius),
            child: child));
  }
}
