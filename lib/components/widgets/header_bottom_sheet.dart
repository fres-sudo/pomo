import 'package:flutter/material.dart';
import 'package:pomo/constants/device.dart';
import 'package:pomo/extension/extensions.dart';

class HeaderBottomSheet extends StatelessWidget {
  const HeaderBottomSheet({
    super.key,
    required this.title,
    this.titleStyle,
    required this.subtitle,
    this.subtitleStyle,
  });

  final String title;
  final String subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            spacing: Sizes.sm,
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: titleStyle ??
                    Theme.of(context).textTheme.headlineMedium?.bold,
              ),
              Text(
                subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: subtitleStyle ??
                    Theme.of(context).textTheme.labelMedium?.muted(context),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close),
        ),
      ],
    );
  }
}
