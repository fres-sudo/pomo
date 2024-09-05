import 'package:flutter/material.dart';

import '../../i18n/strings.g.dart';

class OrSeparator extends StatelessWidget {
  final double height;

  const OrSeparator({super.key, this.height = 0});

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(child: Divider(height: height)),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          t.general.or,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
        ),
      ),
      Expanded(child: Divider(height: height)),
    ],
  );
}
