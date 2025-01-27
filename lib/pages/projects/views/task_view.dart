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

  _fetchTasks(BuildContext context) => context.read<TaskBloc>().getByProject(projectId: project.id ?? "");

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskBloc, TaskState>(
        listener: (context, state) {
          state.whenOrNull(
            errorCreating: (error) => onErrorState(context, error.localizedString(context)),
            errorUpdating: (error) => onErrorState(context, error.localizedString(context)),
            errorDeleting: (error) => onErrorState(context, error.localizedString(context)),
            errorFetchingByProject: (error) => onErrorState(context, error.localizedString(context)),
            created: (_) => _fetchTasks(context),
            updated: (_) => _fetchTasks(context),
            deleted: () => _fetchTasks(context),
          );
        },
        buildWhen: (_, current) => current.maybeWhen(
            fetchingByProject: () => true,
            creating: () => true,
            updating: () => true,
            deleting: () => true,
            fetchedByProject: (_) => true,
            orElse: () => false),
        builder: (context, state) {
          return state.maybeWhen(
              fetchingByProject: () => const LoadingTasksState(),
              creating: () => const LoadingTasksState(),
              updating: () => const LoadingTasksState(),
              deleting: () => const LoadingTasksState(),
              fetchedByProject: (tasks) {
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
              },
              orElse: () => SizedBox.shrink());
        });
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
