import 'package:flutter/material.dart';
import 'package:pomo/models/project/project.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../components/cards/task_card.dart';
import '../../../models/task/task.dart';
import '../widget/task_bottom_sheet.dart';
import 'no_task_view.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    List<Task> completedTasks = project.tasks?.where((task) => task.pomodoro == task.pomodoroCompleted).toList() ?? [];
    List<Task> inProgressTasks = project.tasks?.where((task) => task.pomodoro != task.pomodoroCompleted).toList() ?? [];

    return project.tasks?.isEmpty ?? true
        ? NoTaskView(project: project,)
        : Skeletonizer(
            enabled: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("In Progress", style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 16)),
                    InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          showModalBottomSheet(
                              useRootNavigator: true,
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return TaskBottomSheet(project: project);
                              });
                        },
                        child: const Icon(Icons.add_circle_outline_rounded))
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
                Text("Already Done", style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 16)),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: completedTasks.length,
                    itemBuilder: (context, index) {
                      return TaskCard(task: completedTasks[index]);
                    }),
              ],
            ),
          );
  }
}
