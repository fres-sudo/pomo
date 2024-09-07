import 'package:flutter/material.dart';

class DottedDivider extends StatelessWidget {
  final double height;
  final Color? color;
  final double dashFactor;

  const DottedDivider({super.key,
    this.height = 1,
    this.color,
    this.dashFactor = 1
  });

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: List.generate((450 * dashFactor)~/10, (index) => Expanded(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: index%2==0? Colors.transparent
                : color ?? Theme.of(context).dividerColor,
          ),
          height: height,
        ),
      )),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashSpacing;

  DottedLinePainter({
    required this.color,
    required this.dashWidth,
    required this.dashSpacing,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = size.height;

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpacing;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}