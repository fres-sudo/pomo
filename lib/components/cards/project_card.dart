import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pomo/components/utils/utils.dart';
import 'package:pomo/constants/colors.dart';
import 'package:pomo/constants/text.dart';
import 'package:pomo/models/project/project.dart';

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
      child: Container(
        //height: height * 1 / 2.8,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: context.isDarkMode ? kNeutral900 : Colors.white,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Container(
                height: height * 1 / 2.8 * 1 / 2.5,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12, spreadRadius: 0, blurRadius: 15),
                  ],
                  image: DecorationImage(
                    image: NetworkImage('https://picsum.photos/250?image=11'),
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
                color: context.isDarkMode ? kNeutral900 : Colors.white,
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
                         style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: context.isDarkMode ? Colors.white: kNeutral900,
                          )
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
                    height: 12,
                  ),
                  Text(
                    project.description.capitalize(),
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
    );
  }
}
