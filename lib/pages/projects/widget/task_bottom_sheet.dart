import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:pomo/models/task/task.dart';
import '../../../blocs/task/task_bloc.dart';
import '../../../constants/colors.dart';
import '../../../models/project/project.dart';

class TaskBottomSheet extends StatefulWidget {
  const TaskBottomSheet({super.key, this.project, this.task});

  final Project? project;
  final Task? task;

  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();

  final _nameTextEditingController = TextEditingController();
  final _descriptionTextEditingController = TextEditingController();
  int _currentPomodoroValue = 1;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
    widget.task != null ? _nameTextEditingController.text = widget.task!.name : "";
    widget.task != null && widget.task?.description != null? _descriptionTextEditingController.text = widget.task!.description!: "";
    widget.task != null ? _currentPomodoroValue = widget.task!.pomodoro: "";
    super.initState();
  }

  @override
  void dispose() {
    _nameTextEditingController.dispose();
    _descriptionTextEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 3.2,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        boxShadow: const [
          BoxShadow(color: Colors.black12, spreadRadius: 1000, blurRadius: 100),
        ],
        color: Theme.of(context).bottomSheetTheme.backgroundColor,
      ),
      padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 4,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).bottomSheetTheme.backgroundColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 36,
                    ),
                    Text(widget.task == null ? 'New Task' : 'Edit Task',
                        style: Theme.of(context).textTheme.titleMedium),
                    InkWell(
                      onTap: () async {
                        if (_nameTextEditingController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 1),
                              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                              content: Text('Please enter valid information'),
                            ),
                          );
                        } else{
                          widget.task == null ?
                          context.read<TaskBloc>().createTask(
                              task: Task(
                                  name: _nameTextEditingController.text,
                                  description: _descriptionTextEditingController.text,
                                  pomodoro: _currentPomodoroValue,
                                  pomodoroCompleted: 0,
                                  completed: false,
                                  referenceProject: widget.project!.id,
                                  user: "65e31000c48a3a97e1a5147a",
                                  createdAt: DateTime.now(),
                              )
                          ) : context.read<TaskBloc>().updateTaskById(
                              id: widget.task!.id!,
                              task: Task(
                                  id:widget.task!.id!,
                                  name: _nameTextEditingController.text,
                                  pomodoro: _currentPomodoroValue,
                                  pomodoroCompleted: widget.task?.pomodoroCompleted,
                                  completed: widget.task!.completed,
                                  referenceProject: widget.task?.referenceProject,
                                  user: "65e31000c48a3a97e1a5147a",
                                  createdAt: widget.task!.createdAt,
                                  completedAt: widget.task?.completedAt
                              ));
                          context.router.pop();
                        }
                      },
                      child: Text(
                        widget.task == null ? 'Create' : 'Edit',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: _formKey.currentState?.validate() != null
                              ? (_formKey.currentState!.validate()
                                  ? kPrimary500
                                  : Theme.of(context).dividerColor)
                              : Theme.of(context).dividerColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(),
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _nameTextEditingController,
                          focusNode: _focusNode,
                          cursorColor: kPrimary500,
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.titleSmall?.color,
                          ),
                          decoration: InputDecoration(
                            hintText: "I'm working on...",
                            hintStyle: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer),
                            border: InputBorder.none,
                            errorBorder: InputBorder.none,
                          ),
                        ),
                        TextFormField(
                          controller: _descriptionTextEditingController,
                          cursorColor: kPrimary500,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color:
                                Theme.of(context).textTheme.titleSmall?.color,
                          ),
                          decoration: InputDecoration(
                              hintText: "Write a description of your task...",
                              hintStyle: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer),
                              errorBorder: InputBorder.none,
                              border: InputBorder.none),
                        ),
                        Row(
                          children: [
                            Text(
                              "Pomodoros | ",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer),
                            ),
                            NumberPicker(
                              value: _currentPomodoroValue,
                              minValue: 1,
                              maxValue: 30,
                              step: 1,
                              itemHeight: 25,
                              itemWidth: 37,
                              haptics: true,
                              selectedTextStyle:
                                  Theme.of(context).textTheme.titleSmall,
                              textStyle: Theme.of(context).textTheme.titleSmall,
                              axis: Axis.horizontal,
                              onChanged: (value) =>
                                  setState(() => _currentPomodoroValue = value),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.transparent,
                                //backgroundBlendMode: BlendMode.screen,
                                border: Border.all(color: Colors.black26),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
