import 'package:flutter/material.dart';
import '../../../components/cards/project_card.dart';
import '../../../models/project/project.dart';

class ProjectView extends StatelessWidget {
  const ProjectView({super.key, required this.projects});

  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 1.6,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: projects.length,
          itemBuilder: (context, index) => ProjectCard(project: projects[index])),
    );
  }
}
