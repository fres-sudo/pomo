import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/blocs/project/project_bloc.dart';
import 'package:pomo/constants/colors.dart';
import 'package:pomo/pages/projects/views/edit_project_view.dart';
import 'package:pomo/routes/app_router.gr.dart';

import '../../../components/cards/project_card.dart';
import '../../../components/widgets/destruction_bottomsheet.dart';
import '../../../components/widgets/top_bottom_sheet_widget.dart';
import '../../../extension/sized_box_extension.dart';
import '../../../i18n/strings.g.dart';
import '../../../models/project/project.dart';

class ProjectBottomSheet extends StatelessWidget {
  const ProjectBottomSheet({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectBloc, ProjectState>(
      listener: (context, state) => switch (state) {
        UpdatedProjectState() => context.router.maybePop(),
        DeletedProjectState() => context.router.maybePop(),
        _ => null,
      },
      child: Container(
        height: 320,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          boxShadow: const [
            BoxShadow(color: Colors.black12, spreadRadius: 1000, blurRadius: 100),
          ],
          color: Theme.of(context).bottomSheetTheme.backgroundColor,
        ),
        padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TopBottomSheetWidget(),
            Gap.MD,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t.general.actions, style: Theme.of(context).textTheme.titleMedium),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => EditProjectView(project: project)),
                      child: Container(
                          decoration: BoxDecoration(
                            color: kGreen500.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.edit_note_rounded,
                                color: kGreen500,
                              ),
                              Gap.SM_H,
                              Text(
                                t.general.edit,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(color: kGreen500),
                              ),
                            ],
                          )),
                    ),
                    Gap.SM,
                    InkWell(
                      onTap: () {
                        context.router.maybePop().then((value) => showModalBottomSheet(
                            context: context,
                            useRootNavigator: true,
                            builder: (BuildContext context) {
                              final bool isArchived = project.status == ProjectStatus.archived;
                              return DestructionBottomSheet(
                                title: isArchived
                                    ? t.projects.unarchive.title
                                    : t.projects.archive.title,
                                buttonText: isArchived
                                    ? t.projects.unarchive.action
                                    : t.projects.archive.action,
                                description: isArchived
                                    ? t.projects.unarchive.description
                                    : t.projects.archive.description,
                                onPress: () {
                                  context.read<ProjectBloc>().updateProjectById(
                                      id: project.id!,
                                      project: project.copyWith(
                                          status: !isArchived
                                              ? ProjectStatus.archived
                                              : ProjectStatus
                                                  .progress //No need to compute the status client side because the server will handle it.
                                          ));
                                  context.router.replaceAll([const ProjectRoute()]);
                                },
                              );
                            },
                            isDismissible: true));
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            color: kYellow500.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Icon(
                                project.status == ProjectStatus.archived
                                    ? Icons.unarchive_outlined
                                    : Icons.archive_outlined,
                                color: kYellow500,
                              ),
                              Gap.SM_H,
                              Text(
                                project.status == ProjectStatus.archived
                                    ? t.projects.unarchive.action
                                    : t.general.archive,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(color: kYellow500),
                              )
                            ],
                          )),
                    ),
                    Gap.SM,
                    InkWell(
                      onTap: () {
                        context.router.maybePop().then((value) => showModalBottomSheet(
                            context: context,
                            useRootNavigator: true,
                            builder: (BuildContext context) {
                              return DestructionBottomSheet(
                                title: t.projects.delete.title,
                                buttonText: t.general.delete,
                                description: t.projects.delete.description,
                                onPress: () {
                                  context.read<ProjectBloc>().deleteProjectById(id: project.id!);
                                  context.router.maybePop();
                                  context.router.replaceAll([const ProjectRoute()]);
                                },
                              );
                            },
                            isDismissible: true));
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            color: kRed500.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.delete_forever,
                                color: kRed500,
                              ),
                              Gap.SM_H,
                              Text(
                                t.general.delete,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(color: kRed500),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
