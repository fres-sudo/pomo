import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class CustomToggleButton extends StatelessWidget {
  const CustomToggleButton({super.key, required this.text, required this.selectedMode, });

  final String text;
  final bool selectedMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1 / 2 - 32,
      decoration: BoxDecoration(
          color: selectedMode ? Theme.of(context).scaffoldBackgroundColor : Colors.transparent,
          borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: selectedMode
              ? kPrimary500
              : Theme.of(context).colorScheme.onSecondaryContainer)
        ),
      ),
    );
  }
}
