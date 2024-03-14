import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pomo/constants/colors.dart';
import 'package:pomo/constants/text.dart';
import 'package:pomo/cubits/auth/auth_cubit.dart';
import 'package:pomo/models/project/project.dart';
import 'package:pomo/pages/error_page.dart';
import 'package:pomo/pages/projects/views/no_proj_view.dart';
import 'package:pomo/routes/app_router.gr.dart';

import '../../blocs/project/project_bloc.dart';
import '../../components/cards/project_card.dart';
import '../../components/utils/my_progress_indicator.dart';
import '../../components/utils/utils.dart';
import '../../models/user/user.dart';

@RoutePage()
class ProjectPage extends StatefulWidget{
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}


class _ProjectPageState extends State<ProjectPage> {
  final TextEditingController searchController = TextEditingController();

  List<Project> projects = [];
  List<Project> searchedProjects = [];


  void filterSearchResults(String query) {
    setState(() {
      projects = searchedProjects.where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Future<void> getProj()async {
    String id = context.read<AuthCubit>().state.maybeWhen(authenticated: (user) => user.id, orElse: () => "");
    print("ID: $id");
    if(id == ""){
      const storage = FlutterSecureStorage();
      var value = await storage.read(key: "user_data");
      print("ID2: ${value}" );
      context.read<ProjectBloc>().getProjectsByUser(id: value![0]);
    } else {
      context.read<ProjectBloc>().getProjectsByUser(id: id);
    }
  }

  @override
  void initState() {
    context.read<ProjectBloc>().getProjectsByUser(id: "65e31000c48a3a97e1a5147a");
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProjectBloc, ProjectState>(
        listener: (BuildContext context, ProjectState state) {
      state.whenOrNull(
        fetched: (List<Project> projects) => {this.projects = projects, this.projects = searchedProjects},
        errorFetching: () => onErrorState(context, "loading projects"),
      );
    }, builder: (context, state) {
      return Scaffold(
        floatingActionButton: IconButton(
            onPressed: () {
              context.router.push(const CreateProjectRoute());
            },
            icon: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: kPrimary500),
              child: const Icon(
                Icons.add_rounded,
                color: kNeutralWhite,
              ),
            )),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
          child: SingleChildScrollView(
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
                        Text("Let's work", style: kSerzif(context)),
                        const CircleAvatar()
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: searchController,
                      style: Theme.of(context).textTheme.titleMedium,
                      cursorColor: kPrimary600,
                      onChanged: (query) => filterSearchResults(query),
                      decoration: const InputDecoration(
                          hintText: "Search", prefixIcon: Icon(Icons.search)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                state.maybeWhen(
                    none: () => const NoProjectView(),
                    fetching: () => const MyProgressIndicator(),
                    errorFetching: () => const ErrorPage(text: "fetch projects",),
                    fetched: (List<Project> projects) =>
                       SizedBox(
                         height: MediaQuery.sizeOf(context).height / 1.6,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: projects.length,
                            itemBuilder: (context, index) =>
                                ProjectCard(project: projects[index])),
                      ),
                    orElse: () => const SizedBox.shrink()),
              ],
            ),
          ),
        )),
      );
    });
  }
}
