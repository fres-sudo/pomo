import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pomo/components/cards/active_task_card.dart';
import 'package:pomo/components/utils/utils.dart';
import 'package:pomo/extension/sized_box_extension.dart';

import '../../../i18n/strings.g.dart';
import '../../../routes/app_router.gr.dart';

class NoProjectView extends StatelessWidget {
  const NoProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/no-proj-image.png",
          scale: 0.85,
        ),
        Gap.SM,
        Text(
          "${t.general.still_dont_have} \n ${t.projects.any_project}",
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
        Gap.MD,
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(150, 48)
            ),
            onPressed: () => context.router.push(CreateProjectRoute()),
            child: Text(
              t.projects.create.title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
            ))
      ],
    );
  }
}

class EmptySearchProjectView extends StatelessWidget {
  const EmptySearchProjectView({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/no-proj-image.png",
            scale: 0.85,
          ),
          Gap.SM,
          Text(
            text ?? "${t.projects.any_project.capitalize()} \n ${t.projects.has_been_found}",
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
