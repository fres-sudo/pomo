import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/blocs/task/task_bloc.dart';
import 'package:pomo/models/project/project.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../blocs/project/project_bloc.dart';
import '../../../components/cards/task_card.dart';
import '../../../components/widgets/snack_bars.dart';
import '../../../i18n/strings.g.dart';
import '../../../models/task/task.dart';
import '../widget/task_bottom_sheet.dart';
import 'no_task_view.dart';

class TaskView extends StatelessWidget {
  const TaskView({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskBloc, TaskState>(listener: (context, state) {
      state.error != null ? onErrorState(context, state.error!.localizedString(context)) : null;
      return switch(state.operation){
        TaskOperation.create => context.read<ProjectBloc>().updateProjectsTasks(projectId: project.id ?? "", tasks: state.tasks),
        TaskOperation.update => context.read<ProjectBloc>().updateProjectsTasks(projectId: project.id ?? "", tasks: state.tasks),
        TaskOperation.delete => context.read<ProjectBloc>().updateProjectsTasks(projectId: project.id ?? "", tasks: state.tasks),
        _ => null
      };
    }, builder: (context, state) {

      List<Task> completedTasks = state.tasks
          .where((task) => task.pomodoro == task.pomodoroCompleted)
          .toList()
        ..sort((a, b) => a.dueDate.compareTo(b.dueDate));

      List<Task> inProgressTasks = state.tasks
          .where((task) => task.pomodoro != task.pomodoroCompleted)
          .toList()
        ..sort((a, b) => a.dueDate.compareTo(b.dueDate));

      return state.tasks.isEmpty
          ? NoTaskView(project: project)
          : Skeletonizer(
              enabled: state.isLoading,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(t.projects.in_progress, style: Theme.of(context).textTheme.titleMedium),
                      InkWell(
                          borderRadius: BorderRadius.circular(12),
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
                      itemBuilder: (context, index) => TaskCard(task: completedTasks[index],)),
                ],
              ),
            );
    });
  }
}
