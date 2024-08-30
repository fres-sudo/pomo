import 'dart:io' show Platform;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/extension/sized_box_extension.dart';
import 'package:pomo/components/widgets/profile_picture.dart';
import 'package:pomo/constants/text.dart';
import 'package:pomo/cubits/auth/auth_cubit.dart';
import 'package:pomo/models/project/project.dart';
import 'package:pomo/pages/profile/widget/create_project_floating_button.dart';
import 'package:pomo/pages/projects/views/no_proj_view.dart';
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

  List<Project> searchedProjects = [];

  void filterSearchResults(String query, List<Project> projects) {
    setState(() {
      searchedProjects = projects.where((item) => item.name.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }


  @override
  void initState() {
    final String userId = context.read<AuthCubit>().state.maybeWhen(authenticated: (user) => user.id, orElse: () => "");
    if (context.read<ProjectBloc>().state.projects.isEmpty) context.read<ProjectBloc>().getProjectsByUser(userId: userId);
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProjectBloc, ProjectState>(listener: (BuildContext context, ProjectState state) {
      state.error != null ? onErrorState(context, state.error!.localizedString(context)) : null;
    }, builder: (context, state) {
      return Scaffold(
        floatingActionButton: const CreateProjectFloatingButton(),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(t.projects.header_project_page, style: kSerzif(context)),
                        const ProfilePicture(),
                      ],
                    ),
                    Gap.MD,
                    TextFormField(
                      controller: searchController,
                      style: Theme.of(context).textTheme.bodyMedium,
                      onChanged: (query) => filterSearchResults(query, state.projects),
                      decoration: const InputDecoration(hintText: "Search", prefixIcon: Icon(Icons.search)),
                    ),
                  ],
                ),
                Gap.MD,
                Skeletonizer(
                    enabled: state.isLoading,
                    child: searchController.text.isEmpty ? _buildProjectsListView(state.projects) : _buildProjectsListView(searchedProjects))
              ],
            ),
          ),
        )),
      );
    });
  }

  Widget _buildProjectsListView(List<Project> projects) {
    if (projects.isEmpty) {
      return const NoProjectView();
    }
    return SizedBox(
      height: Platform.isAndroid ? MediaQuery.of(context).size.height - 210 : MediaQuery.of(context).size.height - 300,
      child: ListView.builder(
        shrinkWrap: false,
        itemCount: projects.length,
        itemBuilder: (context, index) => ProjectCard(project: projects[index]),
      ),
    );
  }
}
