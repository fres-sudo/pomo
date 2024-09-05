import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/blocs/task/task_bloc.dart';
import 'package:pomo/extension/sized_box_extension.dart';
import 'package:pomo/models/project/project.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../components/cards/task_card.dart';
import '../../../i18n/strings.g.dart';
import '../../../models/task/task.dart';
import '../widget/task_bottom_sheet.dart';
import 'no_task_view.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key, required this.project, required this.tasks});

  final Project project;
  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {

    List<Task> completedTasks = tasks.where((task) => task.pomodoro == task.pomodoroCompleted).toList() ?? [];
    List<Task> inProgressTasks = tasks.where((task) => task.pomodoro != task.pomodoroCompleted).toList() ?? [];


    return project.tasks?.isEmpty ?? true
        ? NoTaskView(project: project)
        : Skeletonizer(
            enabled: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(t.projects.in_progress, style: Theme.of(context).textTheme.titleMedium),
                    InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () => showModalBottomSheet(
                              useRootNavigator: true,
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return TaskBottomSheet(project: project);
                              }),
                        child: const Icon(Icons.add_circle_outline_rounded))
                  ],
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: inProgressTasks.length,
                    itemBuilder: (context, index) => TaskCard(task: inProgressTasks[index])),
                Text(t.projects.already_done, style: Theme.of(context).textTheme.titleMedium),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: completedTasks.length,
                    itemBuilder: (context, index) => TaskCard(task: completedTasks[index])),
              ],
            ),
          );
  }
}
