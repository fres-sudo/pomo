import 'package:flutter/material.dart';

import '../../constants/text.dart';
import '../../pages/schedule/widget/session_widget.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: kSerzif(context)),
            Text(subtitle, style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            )),
          ],
        ),
        SessionWidget()
      ],
    );
  }
}