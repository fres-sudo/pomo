import 'package:flutter/material.dart';
import 'package:pomo/pages/projects/widget/no_proj_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../components/cards/project_card.dart';
import '../../../models/project/project.dart';

class ProjectView extends StatelessWidget {
   const ProjectView({super.key, required this.projects});

  final List<Project> projects;
  @override
  Widget build(BuildContext context) {
    return projects.isNotEmpty ? Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: projects.length,
            itemBuilder: (context, index) => ProjectCard(project: projects[index])),
          const SizedBox(
            height: 300,
          ),
        ]
    ) : const NoProjectView();
  }
}

