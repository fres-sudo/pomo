import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/blocs/task/task_bloc.dart';
import 'package:pomo/models/project/project.dart';
import 'package:skeletonizer/skeletonizer.dart';

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

  _fetchTasks(BuildContext context) =>
      context.read<TaskBloc>().getByProject(projectId: project.id ?? "");

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskBloc, TaskState>(
        listener: (context, state) => switch (state) {
              ErrorCreatingTaskState(:final error) =>
                onErrorState(context, error.localizedString(context)),
              ErrorUpdatingTaskState(:final error) =>
                onErrorState(context, error.localizedString(context)),
              ErrorDeletingTaskState(:final error) =>
                onErrorState(context, error.localizedString(context)),
              ErrorFetchingByProjectTaskState(:final error) =>
                onErrorState(context, error.localizedString(context)),
              CreatedTaskState() => _fetchTasks(context),
              UpdatedTaskState() => _fetchTasks(context),
              DeletedTaskState() => _fetchTasks(context),
              _ => null,
            },
        buildWhen: (_, current) => switch (current) {
              FetchingByProjectTaskState() => true,
              CreatingTaskState() => true,
              UpdatingTaskState() => true,
              DeletingTaskState() => true,
              FetchedByProjectTaskState() => true,
              _ => false
            },
        builder: (context, state) {
          return switch (state) {
            FetchingByProjectTaskState() => const LoadingTasksState(),
            CreatingTaskState() => const LoadingTasksState(),
            UpdatingTaskState() => const LoadingTasksState(),
            DeletingTaskState() => const LoadingTasksState(),
            FetchedByProjectTaskState(:final tasks) => _buildTasksList(tasks, context),
            _ => SizedBox.shrink(),
          };
        });
  }

  Widget _buildTasksList(List<Task> tasks, BuildContext context) {
    List<Task> completedTasks = tasks
        .where((task) => (task.pomodoroCompleted ?? 0) >= task.pomodoro)
        .toList()
      ..sort((a, b) => a.dueDate.compareTo(b.dueDate));

    List<Task> inProgressTasks = tasks
        .where((task) => task.pomodoro > (task.pomodoroCompleted ?? 0))
        .toList()
      ..sort((a, b) => a.dueDate.compareTo(b.dueDate));

    return tasks.isEmpty
        ? NoTaskView(project: project)
        : Column(
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
                          builder: (context) => TaskBottomSheet(project: project)),
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
          );
  }
}

class LoadingTasksState extends StatelessWidget {
  const LoadingTasksState({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(t.projects.in_progress, style: Theme.of(context).textTheme.titleMedium),
              const Icon(Icons.add_circle_outline_rounded)
            ],
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) => TaskCard(task: Task.fake())),
          Text(t.projects.already_done, style: Theme.of(context).textTheme.titleMedium),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) => TaskCard(task: Task.fake())),
        ],
      ),
    );
  }
}
