import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pomo/components/fancy_shimmer/fancy_shimmer_image.dart';
import 'package:pomo/components/utils/utils.dart';
import 'package:pomo/constants/colors.dart';
import 'package:pomo/extension/date_extension.dart';
import 'package:pomo/models/project/project.dart';
import 'package:pomo/routes/app_router.gr.dart';

import '../../i18n/strings.g.dart';

enum ProjectStatus { progress, completed, expired, archived }

extension ProjectExt on ProjectStatus {
  String get label {
    return switch (this) {
      ProjectStatus.completed => "COMPLETED",
      ProjectStatus.expired => "EXPIRED",
      ProjectStatus.progress => "IN PROGRESS",
      ProjectStatus.archived => "ARCHIVED"
    };
  }

  Color get foregroundColor {
    return switch (this) {
      ProjectStatus.completed => kGreen300,
      ProjectStatus.expired => kRed300,
      ProjectStatus.progress => kYellow300,
      ProjectStatus.archived => kNeutral300
    };
  }

  Color get backGroundColor {
    return switch (this) {
      ProjectStatus.completed => kGreen100.withValues(alpha: 0.15),
      ProjectStatus.expired => kRed100.withValues(alpha: 0.15),
      ProjectStatus.progress => kYellow100.withValues(alpha: 0.15),
      ProjectStatus.archived => kNeutral100.withValues(alpha: 0.15)
    };
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16),
      child: InkWell(
        onTap: () => context.router.push(ProjectDetailsRoute(project: project)),
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 15),
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              project.imageCover == null
                  ? ClipRRect(
                      borderRadius:
                          const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                      child: Container(
                        height: 100,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("assets/images/project-placeholder.png"),
                          fit: BoxFit.cover,
                        )),
                      ),
                    )
                  : ClipRRect(
                      borderRadius:
                          const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                      child: SizedBox(
                        height: 100,
                        width: MediaQuery.sizeOf(context).width,
                        child: FancyShimmerImage(
                          imageUrl: project.imageCover!,
                          errorWidget: Image.asset("assets/images/project-placeholder.png", fit: BoxFit.cover),
                          boxFit: BoxFit.cover,
                        ),
                      ),
                    ),
              Container(
                decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(project.name.capitalize(),
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).colorScheme.onSurface)),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                                DateFormat('MMM dd, yyyy', TranslationProvider.of(context).flutterLocale.languageCode)
                                    .format(project.endDate),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: Theme.of(context).colorScheme.onSecondary))
                          ],
                        ),
                        Chip(
                            side: BorderSide(
                              color: project.status.foregroundColor,
                            ),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            labelPadding: EdgeInsets.zero,
                            labelStyle:
                                Theme.of(context).textTheme.labelSmall?.copyWith(color: project.status.foregroundColor),
                            backgroundColor: project.status.backGroundColor,
                            label: Text(project.status.label)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                              project.description == null || project.description!.isEmpty
                                  ? t.general.no_description
                                  : project.description!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: Theme.of(context).colorScheme.onSecondary)),
                        ),
                        Text("${project.tasks?.length != null ? project.tasks!.length.toString() : "0"} tasks",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).primaryColor))
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
