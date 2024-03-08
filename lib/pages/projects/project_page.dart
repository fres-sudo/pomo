import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo/components/cards/project_card.dart';
import 'package:pomo/components/widgets/rounded_button.dart';
import 'package:pomo/constants/colors.dart';
import 'package:pomo/constants/text.dart';
import 'package:pomo/models/project/project.dart';
import 'package:pomo/models/user/user.dart';
import 'package:pomo/pages/projects/widget/no_proj_view.dart';
import 'package:pomo/pages/projects/widget/no_task_view.dart';
import 'package:pomo/pages/projects/widget/project_view.dart';
import 'package:pomo/routes/app_router.gr.dart';

import '../../blocs/project/project_bloc.dart';
import '../../components/utils/utils.dart';

@RoutePage()
class ProjectPage extends StatefulWidget implements AutoRouteWrapper {
  const ProjectPage({super.key});

  //get id async => await getUserId();

  @override
  State<ProjectPage> createState() => _ProjectPageState();

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider<ProjectBloc>(
        create: (context) => ProjectBloc(
          projectRepository: context.read(),
        )..getProjectsByUser(id: "65e31000c48a3a97e1a5147a"),
      ),
    ],
    child: this,
  );
}

class _ProjectPageState extends State<ProjectPage> {

  final TextEditingController searchController = TextEditingController();

  List<Project> projects = [];

  @override
  Widget build(BuildContext context) {
        return Scaffold(
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
                        decoration: const InputDecoration(
                            hintText: "Search", prefixIcon: Icon(Icons.search)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<ProjectBloc, ProjectState>(builder: (context, state) {
                    state.whenOrNull(
                      none: () => const NoProjectView(),
                      fetching: () => const CircularProgressIndicator(),
                      fetched: (List<Project> projects) => this.projects = projects,
                      errorFetching: () => _onErrorFetching(context)
                    );
                    return Column(
                      children: [
                        if(state is NoneProjectState)
                          const NoProjectView(),
                      ],
                    );
                  }),
                ],
              ),
            ),
          )),
        );
  }
  _onErrorFetching(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          content: Text('Something went wrong while creating project, please try again')),
    );
  }

  _updateProjectList(List<Project> projects){
    WidgetsBinding.instance.addPostFrameCallback((_)  {
    setState(() {
        this.projects = projects;
      });
    });
  }
}
