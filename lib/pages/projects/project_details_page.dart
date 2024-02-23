import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo/components/cards/task_card.dart';
import 'package:pomo/components/utils/utils.dart';
import 'package:pomo/models/task/task.dart';
import 'package:pomo/models/user/user.dart';
import 'package:pomo/pages/projects/widget/project_bottom_sheet.dart';

import '../../constants/colors.dart';
import '../../constants/text.dart';
import '../../models/project/project.dart';

@RoutePage()
class ProjectDetailsPage extends StatefulWidget {
  const ProjectDetailsPage({super.key, required this.project});

  final Project project;

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
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
                          AutoRouter.of(context).pop();
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
                      Text(widget.project.name, style: kSerzif(context)),
                    ],
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      Scaffold.of(context).showBottomSheet(
                        (BuildContext context) {
                          return const ProjectBottomSheet();
                        },
                      );
                    },
                    child: SvgPicture.asset(
                      "assets/icons/kebab.svg",
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).iconTheme.color!,
                          BlendMode.srcIn),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                widget.project.description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: kNeutral600)
              ),
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
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "In Progress",
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 16)
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {},
                    child: SvgPicture.asset(
                      "assets/icons/plus.svg",
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).iconTheme.color!,
                          BlendMode.srcIn),
                    ),
                  )
                ],
              ),
              const TaskCard(
                task: Task(
                  id: "id",
                  name: "name",
                  pomodoro: 2,
                  completed: false,
                  user: User(id: "id", username: "username", email: "email", token: ''),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                "Already Done",
                style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 16)
              ),
              const TaskCard(
                task: Task(
                  id: "id",
                  name: "name",
                  pomodoro: 2,
                  completed: false,
                  user: User(id: "id", username: "username", email: "email", token: ''),
                ),
              ),
              const TaskCard(
                task: Task(
                  id: "id",
                  name: "name",
                  pomodoro: 2,
                  completed: false,
                  user: User(id: "id", username: "username", email: "email", token: ''),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
