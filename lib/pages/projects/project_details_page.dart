import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/pages/projects/views/header_project_details.dart';

import '../../blocs/task/task_bloc.dart';
import '../../models/project/project.dart';
import 'views/task_view.dart';

@RoutePage()
class ProjectDetailsPage extends StatelessWidget implements AutoRouteWrapper{
  const ProjectDetailsPage({super.key, required this.project, this.isCreatedProject = false});


  @override
  Widget wrappedRoute(BuildContext context) {
    context.read<TaskBloc>().getByProject(projectId: project.id ?? "");
    return this;
  }

  final Project project;
  final bool isCreatedProject;

  Future<void> _onRefresh(BuildContext context, String projectId) async => context.read<TaskBloc>().getByProject(projectId: projectId);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HeaderProjectDetails(project: project, isProjectCreated: isCreatedProject),
                    RefreshIndicator.adaptive(
                      onRefresh: () => _onRefresh(context, project.id ?? ""),
                      child: TaskView(
                        project: project,
                      ),
                    ),
                  ],
                ),
              ),
            )),
      );
    }
  }


