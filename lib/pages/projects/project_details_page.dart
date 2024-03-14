import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/pages/error_page.dart';
import 'package:pomo/pages/projects/views/header_projeect_details.dart';
import 'package:pomo/pages/projects/views/no_task_view.dart';
import '../../blocs/task/task_bloc.dart';
import '../../components/utils/my_progress_indicator.dart';
import '../../components/utils/utils.dart';
import '../../models/project/project.dart';
import '../../models/task/task.dart';
import 'views/task_view.dart';

@RoutePage()
class ProjectDetailsPage extends StatefulWidget {
   ProjectDetailsPage({super.key, required this.project});

   Project project;

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
   List<Task>? tasks;

   @override
  void initState() {
    _getTasksByProject(context);
     super.initState();
  }

   void _getTasksByProject(BuildContext context) {
     context.read<TaskBloc>().getTasksByProject(projectId: widget.project.id!);
   }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskBloc, TaskState>(
      listener: (BuildContext context, TaskState state) =>
        state.whenOrNull(
          errorFetching: () => onErrorState(context, "loading tasks"),
          errorCreating: () => onErrorState(context, "creating tasks"),
          errorUpdating: () => onErrorState(context, "updating tasks"),
          updated: (task) { _getTasksByProject(context); onSuccessState(context, "update your task"); },
          deleted: () { _getTasksByProject(context); onSuccessState(context, "delete your task"); },
          fetched: (tasks) => this.tasks = tasks,
          created: (task) { _getTasksByProject(context); onSuccessState(context, "create your task"); },
        ),

      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      HeaderProjectDetails(project: widget.project),
                      state.maybeWhen(
                          fetching: () => const MyProgressIndicator(),
                          creating: () => const MyProgressIndicator(),
                          updating: () => const MyProgressIndicator(),
                          fetched: (tasks) => TaskView(tasks: tasks, project: widget.project),
                          deleted: () => TaskView(tasks: tasks!, project: widget.project),
                          updated: (task) => TaskView(tasks: tasks!, project: widget.project),
                          none: () => NoTaskView(project: widget.project,),
                          errorUpdating: () => const ErrorPage(text: "updating tasks",),
                          errorFetching: () => const ErrorPage(text: "fetching tasks",),
                          errorCreating: () => const ErrorPage(text: "creating tasks",),
                          orElse: () => const SizedBox.shrink()),
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}
