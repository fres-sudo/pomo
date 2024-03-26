import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pomo/components/utils/utils.dart';
import 'package:pomo/constants/colors.dart';
import 'package:pomo/models/project/project.dart';
import 'package:pomo/routes/app_router.gr.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  Widget build(BuildContext context) {
    String? taskLength =
        project.tasks?.length != null ? project.tasks?.length.toString() : "0";

    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: (){
          context.router.push(ProjectDetailsRoute(project: project));
        },
        borderRadius: BorderRadius.circular(20),
        child: Container(
          //height: height * 1 / 2.8,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                child: Container(
                  height: height * 1 / 2.8 * 1 / 2.5,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12, spreadRadius: 0, blurRadius: 15),
                    ],
                    image: DecorationImage(
                      image: /* project.imageCover != null ? NetworkImage(project.imageCover!) : */ Image.asset("assets/images/project-placeholder.png").image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12, spreadRadius: 0, blurRadius: 15),
                  ],
                  color: Theme.of(context).cardColor
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          project.name.capitalize(),
                            overflow: TextOverflow.ellipsis,
                           style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 16)
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "$taskLength tasks",
                          style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: kPrimary500
                          ),
                        ),
                      ],
                    ),
                    Text(
                      DateFormat('MMM dd, yyyy').format(project.dueDate),
                      style: Theme.of(context).textTheme.bodySmall
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      project.description ?? "No description",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
