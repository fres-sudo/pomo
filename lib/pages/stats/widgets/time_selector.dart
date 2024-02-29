import 'package:flutter/material.dart';
import 'package:pomo/components/utils/utils.dart';
import 'package:pomo/constants/theme.dart';

class TimeSelector extends StatefulWidget {
  const TimeSelector({super.key, required this.text, required this.isSelected});

  final String text;
  final bool isSelected;

  @override
  State<TimeSelector> createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.isSelected ? Theme.of(context).cardTheme.surfaceTintColor : Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).dividerColor,
        )
      ),
      child: Text(widget.text, style: Theme
          .of(context)
          .textTheme
          .titleSmall?.copyWith(
      ),
      ),
    );
  }
}

