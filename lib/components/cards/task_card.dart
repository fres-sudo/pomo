import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo/components/utils/utils.dart';
import 'package:pomo/constants/colors.dart';
import 'package:pomo/constants/text.dart';

import '../../models/task/task.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({super.key, required this.task});

  final Task task;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool checkBox = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        padding: const EdgeInsets.only(top: 16, right: 5, bottom: 16, left: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: context.isDarkMode ? kNeutral900 : kNeutral100,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                    fillColor: MaterialStateProperty.resolveWith((states) {
                      // If the button is pressed, return green, otherwise blue
                      if (states.contains(MaterialState.selected)) {
                        return kGreen500;
                      }
                    }),
                    value: checkBox,
                    onChanged: (value) {
                      setState(() {
                        checkBox = value!;
                      });
                    }),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.task.name.capitalize(),
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color:
                              context.isDarkMode ? kNeutral100 : kNeutral900),
                    ),
                    Text(
                      "${(widget.task.pomodoro * 30).toString()}mins • ${widget.task.pomodoro} pomodoro",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                          color:
                              context.isDarkMode ? kNeutral500 : kNeutral500),
                    )
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/icons/play-bold.svg",
                colorFilter:
                    const ColorFilter.mode(kPrimary500, BlendMode.srcIn),
              ),
            )
          ],
        ),
      ),
    );
  }
}
