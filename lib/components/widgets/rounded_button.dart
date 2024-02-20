import 'package:flutter/material.dart';
import 'package:pomo/constants/colors.dart';
import 'package:tap_debouncer/tap_debouncer.dart';

class RoundedButton extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _RoundedButtonState();
  }

  const RoundedButton({
    Key? key,
    required this.child,
    this.width = 311.0,
    this.height = 48.0,
    required this.onPressed,
    this.opacity,
    this.color,
    this.borderColor = kNeutral1000,
    this.border = true,
    this.borderRadius = 16,
    this.progressColor = kPrimary500,
    this.decoration
  }) : super(key : key);

  final Color? color;
  final Color borderColor;
  final Color progressColor;
  final Widget child;
  final double width;
  final double height;
  final bool border;
  final double borderRadius;
  final VoidCallback onPressed;
  final bool? opacity;
  final BoxDecoration? decoration;
}

class _RoundedButtonState extends State<RoundedButton> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width == 311 ? MediaQuery.sizeOf(context).width : widget.width,
      height: widget.height,
      decoration: widget.decoration ?? BoxDecoration(
        color: widget.color ?? kNeutralWhite,
        borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
        border: widget.border ? Border.all(color: widget.borderColor, width: 1) : null,
      ),
      child: TapDebouncer(
        onTap: () async => (widget.opacity != null && widget.opacity == false) ? null : widget.onPressed(),
        builder: (BuildContext context, TapDebouncerFunc? onTap) {
          return Material(
            color: Colors.transparent,
            child: InkResponse(
              highlightShape: BoxShape.rectangle,
              radius: widget.borderRadius,
              borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
              onTap: onTap,
              child: onTap == null ? null : Center(
                child: widget.child,
              ),
            ),
          );
        },
        waitBuilder: (_, Widget child) {
          return Stack(
            children: <Widget>[
              child,
              Center(child: SizedBox(width: 16, height: 16, child: CircularProgressIndicator(color: widget.progressColor))),
            ],
          );
        },
      ),
    );
  }
}