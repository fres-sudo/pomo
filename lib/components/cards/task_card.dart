import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo/components/utils/utils.dart';
import 'package:pomo/constants/colors.dart';
import 'package:pomo/routes/app_router.gr.dart';

import '../../blocs/task/task_bloc.dart';
import '../../models/task/task.dart';
import '../../pages/projects/widget/info_task_bottom_sheet.dart';
import '../../pages/projects/widget/task_bottom_sheet.dart';
import '../widgets/destruction_bottomsheet.dart';

class TaskCard extends StatefulWidget {
   TaskCard({super.key, required this.task});


  Task task;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  late bool checkBox;

  @override
  void initState() {
    checkBox = widget.task.completed;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return TaskBottomSheet(task: widget.task);
                    });
              },
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              backgroundColor: kYellow600,
              foregroundColor: Colors.white,
              icon: Icons.edit_note_rounded,
            ),
            SlidableAction(
              onPressed: (context) {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return DestructionBottomSheet(
                        title: widget.task.name,
                        buttonText: 'Delete',
                        description:
                            'Are you sure you want to delete this task?',
                        function: () {
                          context
                              .read<TaskBloc>()
                              .deleteTaskById(id: widget.task.id!);
                          context.router.pop();
                        },
                      );
                    },
                    isDismissible: true);
              },
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              backgroundColor: kRed500,
              foregroundColor: Colors.white,
              icon: Icons.delete_forever,
            ),
          ],
        ),
        child: InkWell(
          onTap: ( ){
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return InfoTaskBottomSheet(task: widget.task);
                });
          },
          child: Container(
            padding:
                const EdgeInsets.only(top: 16, right: 5, bottom: 16, left: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Theme.of(context).cardColor),
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
                          return null;
                        }),
                        value: checkBox,
                        onChanged: (value) {
                          setState(() {
                            checkBox = value!;
                          });
                          context.read<TaskBloc>().updateTaskById(
                              id: widget.task.id ?? "",
                              task: Task(
                                id: widget.task.id ?? "",
                                  name: widget.task.name,
                                  description: widget.task.description,
                                  pomodoro: widget.task.pomodoro,
                                  pomodoroCompleted: value! ? widget.task.pomodoro : 0,
                                  referenceProject: widget.task.referenceProject,
                                  completed: value,
                                  user: widget.task.user,
                                  createdAt: widget.task.createdAt,
                                  completedAt: value ? DateTime.now() : null
                              ));
                        }),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.task.name.capitalize(),
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(fontSize: 14),
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
                !widget.task.completed ?
                IconButton(
                  onPressed: () {
                    AutoRouter.of(context)
                        .push(WorkSessionRoute(task: widget.task));
                  },
                  icon: SvgPicture.asset(
                    "assets/icons/play-bold.svg",
                    colorFilter:
                        const ColorFilter.mode(kPrimary500, BlendMode.srcIn),
                  ),
                ) : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
