import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/blocs/project/project_bloc.dart';
import 'package:pomo/pages/projects/views/header_project_details.dart';

import '../../blocs/task/task_bloc.dart';
import '../../components/widgets/snack_bars.dart';
import '../../models/project/project.dart';
import '../../models/task/task.dart';
import 'views/task_view.dart';

@RoutePage()
class ProjectDetailsPage extends StatefulWidget {
  ProjectDetailsPage({super.key, required this.project, this.isCreatedProject = false});

  Project project;
  final bool isCreatedProject;

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
  List<Task> tasks = [];

  void updateTaskView(TaskState state, BuildContext context) {
    state.maybeWhen(
      created: (newTasks) => {
        context.read<ProjectBloc>().updateProjectsTasks(projectId: widget.project.id ?? "", tasks: List.from(tasks)..add(newTasks)),
        setState(() {
          tasks = List<Task>.from(tasks);
          tasks.add(newTasks);
        }),
        onSuccessState(context, "created new task"),
      },
      updated: (task) => {
        context.read<ProjectBloc>().updateProjectsTasks(
            projectId: widget.project.id ?? "",
            tasks: List.from(tasks)
              ..removeWhere((t) => t.id == task.id)
              ..add(task)),
        setState(() {
          List.from(tasks)
            ..removeWhere((t) => t.id == task.id)
            ..add(task);
        }),
      },
      deleted: (task) => {
        setState(() {
          tasks = List<Task>.from(tasks);
          tasks.remove(task);
        }),
        context
            .read<ProjectBloc>()
            .updateProjectsTasks(projectId: widget.project.id ?? "", tasks: List.from(tasks)..removeWhere((t) => task.id == t.id)),
        onSuccessState(context, "deleted your task")
      },
      orElse: () {},
    );
  }

  @override
  void initState() {
    tasks = List<Task>.from(tasks);
    tasks = widget.project.tasks ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskBloc, TaskState>(
      listener: (BuildContext context, TaskState state) => state.whenOrNull(
        errorFetching: () => onErrorState(context, "loading tasks"),
        errorCreating: () => onErrorState(context, "creating tasks"),
        errorUpdating: () => onErrorState(context, "updating tasks"),
        errorDeleting: () => onErrorState(context, "deleting project"),
        deleted: (_) => updateTaskView(state, context),
        created: (_) => updateTaskView(state, context),
        updated: (_) => updateTaskView(state, context)
      ),
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HeaderProjectDetails(project: widget.project, isProjectCreated: widget.isCreatedProject),
                  TaskView(
                    project: widget.project,
                    tasks: tasks,
                  ),
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}
