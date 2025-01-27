import 'dart:io' show Platform;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/components/utils/responsive.dart';
import 'package:pomo/components/widgets/custom_floating_button.dart';
import 'package:pomo/components/widgets/title_page.dart';
import 'package:pomo/cubits/auth/auth_cubit.dart';
import 'package:pomo/extension/sized_box_extension.dart';
import 'package:pomo/models/project/project.dart';
import 'package:pomo/pages/projects/views/no_proj_view.dart';
import 'package:pomo/routes/app_router.gr.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../blocs/project/project_bloc.dart';
import '../../components/cards/project_card.dart';
import '../../components/widgets/snack_bars.dart';
import '../../i18n/strings.g.dart';

@RoutePage()
class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  final TextEditingController searchController = TextEditingController();
  bool showArchivedProjects = false;

  @override
  initState() {
    final userId = context.read<AuthCubit>().state.maybeWhen(authenticated: (user) => user.id, orElse: () => "");
    context.read<ProjectBloc>().fetch(userId: userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProjectBloc, ProjectState>(
        listener: (BuildContext context, ProjectState state) => state.whenOrNull(
              created: (_) => context.read<ProjectBloc>().fetch(
                  userId:
                      context.read<AuthCubit>().state.maybeWhen(authenticated: (user) => user.id, orElse: () => "")),
              updated: (_) => context.read<ProjectBloc>().fetch(
                  userId:
                      context.read<AuthCubit>().state.maybeWhen(authenticated: (user) => user.id, orElse: () => "")),
              deleted: () => context.read<ProjectBloc>().fetch(
                  userId:
                      context.read<AuthCubit>().state.maybeWhen(authenticated: (user) => user.id, orElse: () => "")),
              errorFetching: (error) => onErrorState(context, error.localizedString(context)),
            ),
        builder: (context, projectState) => Scaffold(
              floatingActionButton: CustomFloatingActionButton(
                herTag: "fab-project",
                onPressed: () => context.router.push(CreateProjectRoute()),
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitlePage(
                          title: showArchivedProjects ? t.projects.archive.projects : t.projects.plural,
                          subtitle: t.projects.subtitle),
                      Gap.MD,
                      Row(children: [
                        Expanded(
                          child: TextFormField(
                            controller: searchController,
                            style: Theme.of(context).textTheme.titleMedium,
                            onChanged: (_) => setState(() {}),
                            decoration: InputDecoration(
                              hintText: t.general.search,
                              prefixIcon: const Icon(Icons.search),
                            ),
                          ),
                        ),
                        Gap.XS_H,
                        IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: showArchivedProjects
                                  ? Theme.of(context).colorScheme.onSurface
                                  : Theme.of(context).colorScheme.onPrimary,
                              foregroundColor: showArchivedProjects
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Theme.of(context).colorScheme.onSurface,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                                side: BorderSide(color: Theme.of(context).dividerColor),
                              ),
                              padding: const EdgeInsets.all(12),
                            ),
                            icon: Icon(
                              showArchivedProjects ? Icons.unarchive_outlined : Icons.archive_outlined,
                              size: 20,
                            ),
                            onPressed: () => setState(() => showArchivedProjects = !showArchivedProjects))
                      ]),
                      Gap.MD,
                      projectState.maybeWhen(
                        fetching: () => const LoadingProjects(),
                        creating: () => const LoadingProjects(),
                        fetched: (projects) {
                          List<Project> filteredProjects = projects
                              .where((project) =>
                                  (!showArchivedProjects ? project.status != ProjectStatus.archived : true) &&
                                  project.name.toLowerCase().contains(searchController.text.toLowerCase()))
                              .toList();
                          List<Project> archivedProjects = projects
                              .where((project) =>
                                  (showArchivedProjects ? project.status == ProjectStatus.archived : true) &&
                                  project.name.toLowerCase().contains(searchController.text.toLowerCase()))
                              .toList();

                          return projects.isEmpty
                              ? Center(child: const NoProjectView())
                              : filteredProjects.isEmpty || (showArchivedProjects && archivedProjects.isEmpty)
                                  ? EmptySearchProjectView(
                                      text: showArchivedProjects ? t.projects.archive.no_project : null)
                                  : SizedBox(
                                      height: Platform.isAndroid
                                          ? MediaQuery.of(context).size.height - 210
                                          : MediaQuery.of(context).size.height - 300,
                                      child: RefreshIndicator.adaptive(
                                        onRefresh: _onRefresh,
                                        child: Responsive.isMobile(context)
                                            ? ListView.builder(
                                                itemCount: showArchivedProjects
                                                    ? archivedProjects.length
                                                    : filteredProjects.length,
                                                itemBuilder: (context, index) => ProjectCard(
                                                    project: showArchivedProjects
                                                        ? archivedProjects[index]
                                                        : filteredProjects[index]),
                                              )
                                            : GridView.builder(
                                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 20,
                                                ),
                                                shrinkWrap: false,
                                                itemCount: showArchivedProjects
                                                    ? archivedProjects.length
                                                    : filteredProjects.length,
                                                itemBuilder: (context, index) => ProjectCard(
                                                    project: showArchivedProjects
                                                        ? archivedProjects[index]
                                                        : filteredProjects[index]),
                                              ),
                                      ),
                                    );
                        },
                        orElse: () => const SizedBox.shrink(),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  Future<void> _onRefresh() async {
    final String userId = context.read<AuthCubit>().state.maybeWhen(
          authenticated: (user) => user.id,
          orElse: () => "",
        );
    context.read<ProjectBloc>().fetch(userId: userId);
  }
}

class LoadingProjects extends StatelessWidget {
  const LoadingProjects({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        enabled: true,
        child: Column(
            children: [Project.fake(), Project.fake(), Project.fake()]
                .map((p) => ProjectCard(project: p))
                .toList(growable: false)));
  }
}
