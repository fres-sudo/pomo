import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pomo/components/utils/utils.dart';
import 'package:pomo/constants/colors.dart';
import 'package:pomo/cubits/auth/auth_cubit.dart';
import 'package:pomo/cubits/work_session_cubit.dart';
import 'package:pomo/routes/app_router.gr.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../blocs/task/task_bloc.dart';
import '../../i18n/strings.g.dart';
import '../../models/task/task.dart';
import '../../pages/projects/widget/info_task_bottom_sheet.dart';
import '../../pages/projects/widget/task_bottom_sheet.dart';
import '../widgets/destruction_bottomsheet.dart';

enum TaskCardSize { small, large }

class TaskCard extends StatefulWidget {
  const TaskCard({super.key, required this.task, this.size = TaskCardSize.large});

  final Task task;
  final TaskCardSize size;

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
  void didChangeDependencies() {
    checkBox = widget.task.pomodoro == widget.task.pomodoroCompleted;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: widget.size == TaskCardSize.small ? 4.0 : 8.0),
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
                        onPress: () {
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
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            showModalBottomSheet(
                useRootNavigator: true,
                context: context,
                builder: (context) {
                  return InfoTaskBottomSheet(task: widget.task);
                });
          },
          child: Container(
            padding: widget.size == TaskCardSize.small
                ? const EdgeInsets.symmetric(vertical: 8, horizontal: 5)
                : const EdgeInsets.symmetric(vertical: 16, horizontal: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Theme.of(context).cardColor,
                border: Border(
                    left: widget.task.highPriority
                        ? BorderSide(color: Theme.of(context).colorScheme.error, width: 3)
                        : BorderSide.none)),
            child: Row(
              children: [
                Checkbox(
                    fillColor: WidgetStateProperty.resolveWith((states) {
                      if (states.contains(WidgetState.selected)) {
                        return kGreen500;
                      }
                      return null;
                    }),
                    value: widget.task.pomodoro == widget.task.pomodoroCompleted,
                    onChanged: (value) {
                      context.read<TaskBloc>().update(
                          id: widget.task.id ?? "",
                          task: widget.task.copyWith(
                            pomodoroCompleted: value! ? widget.task.pomodoro : 0,
                            completedAt: value ? DateTime.now() : null,
                          ));
                    }),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.task.name.capitalize(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: widget.size == TaskCardSize.small
                          ? Theme.of(context).textTheme.bodyMedium
                          : Theme.of(context).textTheme.titleMedium,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: widget.task.pomodoro > 1
                                  ? "${durationToString(widget.task.pomodoro * 30)} hours "
                                  : "${widget.task.pomodoro * 30} mins",
                              style: widget.size == TaskCardSize.small
                                  ? Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(color: Theme.of(context).colorScheme.onSecondary)
                                  : Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(color: Theme.of(context).colorScheme.onSecondary)),
                          TextSpan(
                              text: " • ${widget.task.pomodoro} pomodoro",
                              style: widget.size == TaskCardSize.small
                                  ? Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(color: Theme.of(context).colorScheme.onSecondary)
                                  : Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(color: Theme.of(context).colorScheme.onSecondary)),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                if (widget.task.pomodoro != widget.task.pomodoroCompleted)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                        onTap: () {
                          context.read<WorkSessionCubit>().set(widget.task);
                          widget.size == TaskCardSize.small
                              ? AutoTabsRouter.of(context).setActiveIndex(2)
                              : context.router.replace(QuickSessionRoute());
                        },
                        child: Icon(
                          Icons.play_arrow_rounded,
                          size: widget.size == TaskCardSize.small ? 28 : 32,
                          color: Theme.of(context).primaryColor,
                        )),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
