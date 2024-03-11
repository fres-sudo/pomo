import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pomo/components/cards/task_card.dart';
import 'package:pomo/pages/projects/widget/create_task_bottom_sheet.dart';
import 'package:pomo/pages/projects/widget/no_task_view.dart';
import 'package:pomo/pages/projects/widget/project_bottom_sheet.dart';
import 'package:pomo/pages/projects/widget/task_view.dart';
import 'package:pomo/pages/projects/widget/task_view.dart';
import 'package:pomo/pages/projects/widget/task_view.dart';
import '../../blocs/task/task_bloc.dart';
import '../../constants/colors.dart';
import '../../constants/text.dart';
import '../../models/project/project.dart';
import '../../models/task/task.dart';
import '../../routes/app_router.gr.dart';

@RoutePage()
class ProjectDetailsPage extends StatelessWidget implements AutoRouteWrapper {
  ProjectDetailsPage({super.key, required this.project});

  final Project project;
  List<Task>? tasks = [];

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider<TaskBloc>(
        create: (context) => TaskBloc(
          taskRepository: context.read(),
        )..getTasksByProject(projectId: project.id!),
      ),
    ],
    child: this,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          AutoRouter.of(context).replace(const ProjectRoute());
                          },
                        child: SvgPicture.asset(
                          'assets/icons/arrow-left.svg',
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).iconTheme.color!,
                              BlendMode.srcIn),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(project.name, style: kSerzif(context)),
                    ],
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isDismissible: true,
                        builder: (BuildContext context) {
                          return const ProjectBottomSheet();
                        },
                      );
                    },
                    child: SvgPicture.asset(
                      "assets/icons/kebab.svg",
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).iconTheme.color!, BlendMode.srcIn),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(project.description,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: kNeutral600)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Invite friend",
                        style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: kPrimary500),
                      ),
                    ),
                  ),
                  Text("Due date: ${DateFormat('MMM dd, yyyy').format(project.dueDate)}",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).dividerColor),
                  )
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<TaskBloc, TaskState>(builder: (context, state){
                state.whenOrNull(
                  fetching: () => const CircularProgressIndicator(),
                  fetched: (List<Task> tasks) => this.tasks = tasks,
                  errorFetching: () =>_onErrorFetching(context),
                );
                return TaskView(tasks: tasks!);
              }),
              project.tasks!.isEmpty ?
              const Center(child: NoTaskView())
              : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("In Progress",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(fontSize: 16)),
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return CreateTaskBottomSheet();
                              });
                        },
                        child: SvgPicture.asset(
                          "assets/icons/plus.svg",
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).iconTheme.color!, BlendMode.srcIn),
                        ),
                      )
                    ],
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: project.tasks?.length,
                      itemBuilder: (context, index) {
                        if (project.tasks?[index] != null &&
                            !project.tasks![index].completed) {
                          return TaskCard(task: project.tasks![index]);
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 32,
                  ),
                  Text("Already Done",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontSize: 16)),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: project.tasks?.length,
                      itemBuilder: (context, index) {
                        if (project.tasks?[index] != null &&
                            project.tasks![index].completed) {
                          return TaskCard(task: project.tasks![index]);
                        }
                        return null;
                      }),
                ],
              ),

            ],
          ),
        ),
      )),
    );
  }
  _onErrorFetching(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            content: Text(
                'Something went wrong while loading tasks, please try again')),
      );
    });
  }
}
