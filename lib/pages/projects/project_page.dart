import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo/components/cards/project_card.dart';
import 'package:pomo/components/fields/general_text_field.dart';
import 'package:pomo/components/widgets/rounded_button.dart';
import 'package:pomo/constants/colors.dart';
import 'package:pomo/constants/text.dart';
import 'package:pomo/models/project/project.dart';
import 'package:pomo/models/user/user.dart';
import 'package:pomo/routes/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
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
                  GeneralField(
                    controller: searchController,
                    prefixIconColor: kNeutral900,
                    hintText: "Search",
                    prefixIcon: const Icon(Icons.search),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/no-proj-image.png",
                    scale: 0.85,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "You still don't have \n any project",
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RoundedButton(
                    borderColor: Colors.transparent,
                    color: kPrimary500,
                    width: MediaQuery.sizeOf(context).width / 2.5,
                    onPressed: () {
                      AutoRouter.of(context).push(CreateProjectRoute());
                    },
                    child: Text(
                      "New Project",
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: kNeutral50),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      AutoRouter.of(context).push(ProjectDetailsRoute(
                        project: Project(
                          id: "id",
                          name: "Freelance Project",
                          description:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                          dueDate: DateTime.now(),
                          owner: const User(
                              id: "id", username: "username", email: "email", token: ''),
                        ),
                      ));
                    },
                    child: ProjectCard(
                      project: Project(
                        id: "id",
                        name: "Freelance Project",
                        description:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed pharetra nisi.  Vivamus",
                        dueDate: DateTime.now(),
                        owner: const User(
                            id: "id", username: "username", email: "email", token: ''),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
