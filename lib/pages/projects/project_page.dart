import 'dart:io' show Platform;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/components/utils/responsive.dart';
import 'package:pomo/components/widgets/custom_floating_button.dart';
import 'package:pomo/components/widgets/title_page.dart';
import 'package:pomo/constants/text.dart';
import 'package:pomo/cubits/auth/auth_cubit.dart';
import 'package:pomo/extension/sized_box_extension.dart';
import 'package:pomo/models/project/project.dart';
import 'package:pomo/pages/projects/views/no_proj_view.dart';
import 'package:pomo/routes/app_router.gr.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../blocs/project/project_bloc.dart';
import '../../components/cards/project_card.dart';
import '../../components/widgets/snack_bars.dart';
import '../../cubits/filter_project/filter_project_cubit.dart';
import '../../i18n/strings.g.dart';
import 'widget/filter_project_widget.dart';

@RoutePage()
class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  final TextEditingController searchController = TextEditingController();

  @override
  initState(){
    final userId = context.read<AuthCubit>().state.maybeWhen(authenticated: (user) => user.id, orElse: () => "");
    context.read<ProjectBloc>().getProjectsByUser(userId: userId);
    super.initState();
  }

  List<Project> _getFilteredProjects(List<Project> projects, String searchQuery, FilterProjectState filterState) {
    List<Project> filteredProjects = projects.where((project) => project.name.toLowerCase().contains(searchQuery.toLowerCase())).toList();

    filteredProjects.sort((a, b) {
      int comparison = _computeComparison(filterState.sortOption, a, b);
      return filterState.isAscending ? comparison : -comparison;
    });

    return filteredProjects;
  }

  int _computeComparison(SortOption selectedSortOption, Project a, Project b) {
    return switch (selectedSortOption) {
      SortOption.endDate => a.endDate.compareTo(b.endDate),
      SortOption.startDate => a.startDate.compareTo(b.startDate),
      SortOption.name => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
      SortOption.completedTasks => (a.tasks?.where((task) => task.pomodoro == task.pomodoroCompleted).length ?? 0)
          .compareTo(b.tasks?.where((task) => task.pomodoro == task.pomodoroCompleted).length ?? 0),
    };
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilterProjectCubit(),
      child: BlocConsumer<ProjectBloc, ProjectState>(
        listener: (BuildContext context, ProjectState state) {
          state.error != null ? onErrorState(context, state.error!.localizedString(context)) : null;
        },
        builder: (context, projectState) {
          return BlocBuilder<FilterProjectCubit, FilterProjectState>(
            builder: (context, filterState) {
              List<Project> filteredProjects = _getFilteredProjects(
                projectState.projects,
                searchController.text,
                filterState,
              );

              return Scaffold(
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
                        TitlePage(title: t.projects.plural, subtitle: t.projects.subtitle),
                        Gap.MD,
                        Row(
                          children: [
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
                            if(false)...[
                              Gap.XS_H,
                              IconButton(
                                style: IconButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    side: BorderSide(color: Theme.of(context).dividerColor),
                                  ),
                                  padding: const EdgeInsets.all(12),
                                ),
                                icon: const Icon(Icons.filter_list),
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    useRootNavigator: true,
                                    builder: (context) => FilterProjectWidget(
                                      onApplyFilter: (_, __) => setState(() {}),
                                    ),
                                  );
                                },
                              ),
                            ]

                          ],
                        ),
                        Gap.MD,
                        Skeletonizer(
                          enabled: projectState.isLoading,
                          child: projectState.projects.isEmpty
                              ? Center(child: const NoProjectView())
                              : SizedBox(
                                  height: Platform.isAndroid ? MediaQuery.of(context).size.height - 210 : MediaQuery.of(context).size.height - 300,
                                  child: RefreshIndicator.adaptive(
                                    onRefresh: _onRefresh,
                                    child: Responsive.isMobile(context)
                                        ? ListView.builder(
                                            itemCount: filteredProjects.length,
                                            itemBuilder: (context, index) => ProjectCard(project: filteredProjects[index]),
                                          )
                                        : GridView.builder(
                                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 20,
                                            ),
                                            shrinkWrap: false,
                                            itemCount: filteredProjects.length,
                                            itemBuilder: (context, index) => ProjectCard(project: filteredProjects[index]),
                                          ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _onRefresh() async {
    final String userId = context.read<AuthCubit>().state.maybeWhen(
          authenticated: (user) => user.id,
          orElse: () => "",
        );
    context.read<ProjectBloc>().getProjectsByUser(userId: userId);
  }
}
