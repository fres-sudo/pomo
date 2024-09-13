import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String herTag;

  const CustomFloatingActionButton({super.key, required this.onPressed, required this.herTag});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: herTag,
      backgroundColor: kPrimary500,
      onPressed: onPressed,
      elevation: 0,
      highlightElevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
      ),
      child: const Icon(
        Icons.add_rounded,
        color: Colors.white,
      ),
    );
  }
}
