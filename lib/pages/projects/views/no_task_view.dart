import 'package:flutter/material.dart';
import 'package:pomo/extension/sized_box_extension.dart';

import '../../../i18n/strings.g.dart';
import '../../../models/project/project.dart';
import '../widget/task_bottom_sheet.dart';

class NoTaskView extends StatelessWidget {
  const NoTaskView({super.key, this.project});

  final Project? project;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/no-task-image.png",
          width: MediaQuery.sizeOf(context).width / 2,
        ),
        Gap.SM,
        Text(
          "${t.general.still_dont_have} \n ${t.tasks.any_tasks}",
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
        Gap.MD,
        ElevatedButton(
            style: ElevatedButton.styleFrom(minimumSize: const Size(150, 48)),
            onPressed: () => showModalBottomSheet(
                useRootNavigator: true,
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return TaskBottomSheet(project: project);
                }),
            child: Text(
              t.tasks.create.title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
            ))
      ],
    );
  }
}
