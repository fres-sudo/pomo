import 'package:flutter/material.dart';
import 'package:pomo/pages/projects/widget/no_task_view.dart';
import '../../../components/cards/task_card.dart';
import '../../../models/task/task.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key, required this.tasks});

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return tasks.isNotEmpty ? Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: tasks.length,
              itemBuilder: (context, index) => TaskCard(task: tasks[index])),
          const SizedBox(
            height: 300,
          ),
        ]
    ) : const NoTaskView();
  }
}

