import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pomo/constants/colors.dart';
import 'package:pomo/extension/sized_box_extension.dart';

import '../../i18n/strings.g.dart';

class InvalidInputDialog extends StatelessWidget {
  const InvalidInputDialog({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: Container(
          height: 250,
          padding: const EdgeInsets.only(top: 16, left: 16, right:16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "📝",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Gap.MD,
              Text(
                text ?? t.errors.valid_info,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Gap.MD,
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: kYellow500, foregroundColor: kYellow100, elevation: 0),
                  onPressed: () => context.router.maybePop(),
                  child: const Center(
                    child: Text("Ok"),
                  ))
            ],
          ),
        ));
  }
}
