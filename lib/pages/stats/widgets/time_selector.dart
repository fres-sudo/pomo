import 'package:flutter/material.dart';

class TimeSelector extends StatelessWidget {
  const TimeSelector({super.key, required this.text, required this.isSelected});

  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).cardTheme.surfaceTintColor : Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).dividerColor,
          )
        ),
        padding: const EdgeInsets.all(8),
        child: Text(text, style: Theme
            .of(context)
            .textTheme
            .titleSmall?.copyWith(
          color:  isSelected ? Theme.of(context).cardColor : Theme.of(context).cardTheme.surfaceTintColor
        ),
        ),
      ),
    );
  }
}

