import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:pomo/components/fields/date_field.dart';
import 'package:pomo/components/fields/project_drop_down.dart';
import 'package:pomo/components/widgets/snack_bars.dart';
import 'package:pomo/components/widgets/top_bottom_sheet_widget.dart';
import 'package:pomo/models/task/task.dart';
import 'package:pomo/models/user/user.dart';

import '../../../blocs/project/project_bloc.dart';
import '../../../blocs/task/task_bloc.dart';
import '../../../constants/colors.dart';
import '../../../cubits/auth/auth_cubit.dart';
import '../../../extension/sized_box_extension.dart';
import '../../../i18n/strings.g.dart';
import '../../../models/project/project.dart';

class TaskBottomSheet extends StatefulWidget {
  const TaskBottomSheet({super.key, this.project, this.task, this.dueDate});

  final Project? project;
  final Task? task;
  final DateTime? dueDate;

  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();

  final _nameTextEditingController = TextEditingController();
  final _descriptionTextEditingController = TextEditingController();
  int _currentPomodoroValue = 1;
  DateTime? _selectedDate;
  bool highPriority = false;
  Project? _selectedProject;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
    if(widget.dueDate != null){
      _selectedDate = widget.dueDate;
      context.read<ProjectBloc>().getProjectsByUser(userId: context.read<AuthCubit>().state.maybeWhen(
          authenticated: (user) => user.id,
          orElse: () => ""));
    }
    if(widget.task != null) {
      _nameTextEditingController.text = widget.task!.name;
      _descriptionTextEditingController.text = widget.task!.description ?? '';
      _currentPomodoroValue = widget.task!.pomodoro;
      _selectedDate = widget.task!.dueDate;
      highPriority = widget.task!.highPriority;
    }
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
      height: MediaQuery.sizeOf(context).height - 90,
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
      padding: EdgeInsets.only(left: 16, right: 16, bottom: MediaQuery.of(context).viewInsets.bottom + 16),
      child: SingleChildScrollView(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TopBottomSheetWidget(),
                Gap.MD,
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Gap.LG_H,
                      Align(
                          alignment: Alignment.center,
                          child: Text(widget.task == null ? t.tasks.create.title : t.tasks.update.edit, style: Theme.of(context).textTheme.titleMedium)),
                      const Spacer(),
                      InkWell(
                        onTap: () async {
                          final User user =
                              context.read<AuthCubit>().state.maybeWhen(authenticated: (user) => user, orElse: () => User.generateFakeData());
                          if (_nameTextEditingController.text.isEmpty || _currentPomodoroValue == 0 || _selectedDate == null) {
                            onInvalidInput(context, isAlert: true);
                          } else {
                            widget.task == null
                                ? context.read<TaskBloc>().create(
                                        task: Task(
                                      name: _nameTextEditingController.text,
                                      description: _descriptionTextEditingController.text,
                                      pomodoro: _currentPomodoroValue,
                                      pomodoroCompleted: 0,
                                      highPriority: highPriority,
                                      userId: user.id,
                                      projectId: widget.project?.id,
                                      createdAt: DateTime.now(),
                                      dueDate: _selectedDate ?? DateTime.now(),
                                    ))
                                : context.read<TaskBloc>().update(
                                    id: widget.task!.id!,
                                    task: Task(
                                        id: widget.task!.id!,
                                        name: _nameTextEditingController.text,
                                        pomodoro: _currentPomodoroValue,
                                        pomodoroCompleted: widget.task?.pomodoroCompleted,
                                        userId: user.id,
                                        projectId: widget.project?.id,
                                        highPriority: highPriority,
                                        dueDate: _selectedDate ?? widget.task!.dueDate,
                                        createdAt: widget.task!.createdAt,
                                        completedAt: widget.task?.completedAt));
                            context.router.maybePop();
                          }
                        },
                        child: Text(
                          widget.task == null ? t.general.create : t.general.edit,
                          style: Theme.of(context).textTheme.titleMedium
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(),
                  ),
                  TextFormField(
                    controller: _nameTextEditingController,
                    focusNode: _focusNode,
                    cursorColor: kPrimary500,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                      hintText: t.tasks.create.working_on,
                      hintStyle: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.onSecondary),
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                    ),
                  ),
                  TextFormField(
                    controller: _descriptionTextEditingController,
                    cursorColor: kPrimary500,
                    style: Theme.of(context).textTheme.titleSmall,
                    decoration: InputDecoration(
                        hintText: t.tasks.create.description,
                        hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
                        errorBorder: InputBorder.none,
                        border: InputBorder.none),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(t.tasks.create.high_priority,
                                style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).colorScheme.onSecondary)),
                            Transform.scale(
                              scale: 0.8,
                              child: Switch.adaptive(
                                activeColor: Theme.of(context).primaryColor,
                                value: highPriority, //state.mode == ThemeMode.dark,
                                onChanged: (bool value) => setState(() {
                                  highPriority = value;
                                }),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "${t.tasks.create.pomodoros} | ",
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
                            ),
                            NumberPicker(
                              value: _currentPomodoroValue,
                              minValue: 0,
                              maxValue: 30,
                              step: 1,
                              itemHeight: 35,
                              itemWidth: 37,
                              haptics: true,
                              selectedTextStyle: Theme.of(context).textTheme.titleSmall,
                              textStyle: Theme.of(context).textTheme.titleSmall,
                              axis: Axis.horizontal,
                              onChanged: (value) => setState(() => _currentPomodoroValue = value),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.transparent,
                                //backgroundBlendMode: BlendMode.screen,
                                border: Border.all(color: Colors.black26),
                              ),
                            ),
                          ],
                        ),
                        Gap.SM,
                        Text(t.tasks.create.due_date, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary),),
                        Gap.XS,
                        DateField(
                            firstDate: DateTime.now(),
                            lastDate: widget.project?.endDate,
                            borderRadius: 12,
                            borderColor: Theme.of(context).dividerColor,
                            hintText: t.tasks.create.end_in,
                            selectedDate: _selectedDate,
                            onPress: (date) => setState(() {
                              _selectedDate = date;
                            }),
                            onDelete: () => setState(() {
                              _selectedDate = null;
                            })),
                        Gap.SM,
                        Text(t.tasks.create.due_date, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary),),
                        Gap.XS,
                        ProjectDropDown(
                            selectedProject: _selectedProject,
                            visible: widget.dueDate != null,
                            onChanged: (proj) => setState(() {
                              _selectedProject = proj;
                            }),
                            onDelete: () => setState(() {
                              _selectedProject = null;
                            }))
                      ],
                    ),
                  )
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
