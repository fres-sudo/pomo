import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pomo/components/fancy_shimmer/fancy_shimmer_image.dart';
import 'package:pomo/components/utils/utils.dart';
import 'package:pomo/constants/colors.dart';
import 'package:pomo/models/project/project.dart';
import 'package:pomo/routes/app_router.gr.dart';

enum ProjectStatus {
  progress,
  completed,
  expired,
}

extension ProjectExt on ProjectStatus {
  String get label {
    return switch (this) { ProjectStatus.completed => "COMPLETED", ProjectStatus.expired => "EXPIRED", ProjectStatus.progress => "IN PROGRESS" };
  }

  Color get foregroundColor {
    return switch (this) { ProjectStatus.completed => kGreen300, ProjectStatus.expired => kRed300, ProjectStatus.progress => kYellow300 };
  }

  Color get backGroundColor {
    return switch (this) { ProjectStatus.completed => kGreen100, ProjectStatus.expired => kRed100, ProjectStatus.progress => kYellow100 };
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.project,
  });

  final Project project;

  ProjectStatus _getStatus(Project project) {
    int completedTask = project.tasks?.map((task) => task.completedAt != null).toList().length ?? 0;
    int totalTasks = project.tasks?.length ?? 0;
    if (completedTask == totalTasks) {
      return ProjectStatus.completed;
    }
    if (completedTask < totalTasks && project.completedAt == null) {
      return ProjectStatus.expired;
    } else {
      return ProjectStatus.progress;
    }
  }

  @override
  Widget build(BuildContext context) {
    ProjectStatus status = _getStatus(project);

    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16),
      child: InkWell(
        onTap: () => context.router.push(ProjectDetailsRoute(project: project)),
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 15),
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              project.imageCover != null && project.imageCover!.isEmpty
                  ? ClipRRect(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 7,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("assets/images/project-placeholder.png"), // Replace with your placeholder image path
                          fit: BoxFit.cover,
                        )),
                      ),
                    )
                  : ClipRRect(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 7,
                        width: MediaQuery.of(context).size.width,
                        child: FancyShimmerImage(
                          imageUrl: project.imageCover!,
                          errorWidget: Image.asset("assets/images/project-placeholder.png", fit: BoxFit.cover),
                          boxFit: BoxFit.cover,
                        ),
                      ),
                    ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                    color: Theme.of(context).cardColor),
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(project.name.capitalize(),
                                overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 16)),
                            Text(DateFormat('MMM dd, yyyy').format(project.endDate), style: Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
                        Chip(
                            side: BorderSide(
                              color: status.foregroundColor,
                            ),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            labelPadding: EdgeInsets.zero,
                            labelStyle: Theme.of(context).textTheme.labelSmall?.copyWith(color: status.foregroundColor),
                            backgroundColor: status.backGroundColor,
                            label: Text(status.label)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(project.description == null || project.description!.isEmpty ? "No description" : project.description!,
                            maxLines: 2, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodySmall),
                        Text("${project.tasks?.length != null ? project.tasks!.length.toString() : "0"} tasks",
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).primaryColor))
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
