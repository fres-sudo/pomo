import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pomo/components/utils/utils.dart';
import 'package:pomo/constants/colors.dart';
import 'package:pomo/routes/app_router.gr.dart';

import '../../blocs/task/task_bloc.dart';
import '../../i18n/strings.g.dart';
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
    checkBox = widget.task.pomodoro == widget.task.pomodoroCompleted;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                showModalBottomSheet(
                    useRootNavigator: true,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return TaskBottomSheet(task: widget.task);
                    });
              },
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
              backgroundColor: kYellow500,
              foregroundColor: Colors.white,
              icon: Icons.edit_note_rounded,
            ),
            SlidableAction(
              onPressed: (context) {
                showModalBottomSheet(
                    useRootNavigator: true,
                    context: context,
                    builder: (BuildContext context) {
                      return DestructionBottomSheet(
                        title: t.tasks.delete.title,
                        buttonText: t.general.delete,
                        description: t.tasks.delete.description,
                        function: () {
                          context.read<TaskBloc>().delete(id: widget.task.id!);
                          context.router.maybePop();
                        },
                      );
                    },
                    isDismissible: true);
              },
              borderRadius: const BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
              backgroundColor: kRed500,
              foregroundColor: Colors.white,
              icon: Icons.delete_forever,
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
                useRootNavigator: true,
                context: context,
                builder: (context) {
                  return InfoTaskBottomSheet(task: widget.task);
                });
          },
          child: Container(
            padding: const EdgeInsets.only(top: 16, right: 5, bottom: 16, left: 5),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Theme.of(context).cardColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                        fillColor: WidgetStateProperty.resolveWith((states) {
                          if (states.contains(WidgetState.selected)) {
                            return kGreen500;
                          }
                          return null;
                        }),
                        value: checkBox,
                        onChanged: (value) {
                          setState(() {
                            checkBox = value!;
                          });
                          context.read<TaskBloc>().update(
                              id: widget.task.id ?? "",
                              task: Task(
                                id: widget.task.id ?? "",
                                name: widget.task.name,
                                description: widget.task.description,
                                pomodoro: widget.task.pomodoro,
                                pomodoroCompleted: value! ? widget.task.pomodoro : 0,
                                userId: widget.task.userId,
                                highPriority: widget.task.highPriority,
                                createdAt: widget.task.createdAt,
                                projectId: widget.task.projectId,
                                completedAt: value ? DateTime.now() : null,
                                dueDate: widget.task.dueDate,
                              ));
                        }),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text(
                            widget.task.name.capitalize(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: widget.task.pomodoro > 1
                                      ? "${durationToString(widget.task.pomodoro * 30)} hours "
                                      : "${widget.task.pomodoro * 30} mins",
                                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: kNeutral500)),
                              TextSpan(
                                  text: " • ${widget.task.pomodoro} pomodoro",
                                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).colorScheme.onSecondary)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                if (widget.task.pomodoro != widget.task.pomodoroCompleted)
                  IconButton(
                      onPressed: () {
                        AutoRouter.of(context).push(WorkSessionRoute(task: widget.task));
                      },
                      icon: Icon(
                        Icons.play_arrow_rounded,
                        size: 32,
                        color: Theme.of(context).primaryColor,
                      ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
