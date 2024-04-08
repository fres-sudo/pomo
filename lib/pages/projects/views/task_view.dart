import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pomo/models/project/project.dart';

import '../../../components/cards/task_card.dart';
import '../../../models/task/task.dart';
import '../widget/task_bottom_sheet.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key, required this.tasks, required this.project});

  final Project project;
  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {

    List<Task> completedTasks = tasks.where((task) => task.completed).toList();
    List<Task> inProgressTasks = tasks.where((task) => !task.completed).toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("In Progress",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontSize: 16)),
            InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                showModalBottomSheet(
                    useRootNavigator: true,
                    context: context,
                    builder: (context) {
                      return TaskBottomSheet(project: project);
                    });
              },
              child: SvgPicture.asset(
                "assets/icons/plus.svg",
                colorFilter: ColorFilter.mode(
                    Theme.of(context).iconTheme.color!, BlendMode.srcIn),
              ),
            )
          ],
        ),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: inProgressTasks.length,
            itemBuilder: (context, index) {
              return TaskCard(task: inProgressTasks[index]);
            }),
        const SizedBox(
          height: 32,
        ),
        Text("Already Done",
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(fontSize: 16)),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: completedTasks.length,
            itemBuilder: (context, index) {
              return TaskCard(task: completedTasks[index]);
            }),
      ],
    );
  }
}
