import 'package:flutter/material.dart';
import 'package:pomo/constants/colors.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    super.key,
    this.color
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator.adaptive(
              backgroundColor: color ?? kNeutralWhite,
            )));
  }
}
