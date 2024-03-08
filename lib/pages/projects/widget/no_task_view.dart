import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/widgets/rounded_button.dart';
import '../../../constants/colors.dart';
import 'create_task_bottom_sheet.dart';

class NoTaskView extends StatelessWidget {
  const NoTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/no-task-image.png",
          width: MediaQuery.sizeOf(context).width/2,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          "You still don't have \n any task",
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
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return CreateTaskBottomSheet();
                });
          },
          child: Text(
            "New Task",
            style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: kNeutral50),
          ),
        ),
        /* InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            AutoRouter.of(context).push(ProjectDetailsRoute(
              project: Project(
                  id: "id",
                  name: "Freelance Project",
                  description:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                  dueDate: DateTime.now(),
                  owner: ""
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
                owner:""
            ),
          ),
        ),*/
      ],
    );
  }
}
