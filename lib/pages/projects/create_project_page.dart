import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pomo/components/fields/date_field.dart';
import 'package:pomo/components/utils/custom_circular_progress_indicator.dart';
import 'package:pomo/components/widgets/back_icon_button.dart';
import 'package:pomo/components/widgets/snack_bars.dart';
import 'package:pomo/constants/colors.dart';
import 'package:pomo/constants/text.dart';
import 'package:pomo/cubits/auth/auth_cubit.dart';
import 'package:pomo/extension/date_extension.dart';
import 'package:pomo/models/project/project.dart';
import 'package:pomo/models/user/user.dart';

import '../../blocs/project/project_bloc.dart';
import '../../extension/sized_box_extension.dart';
import '../../i18n/strings.g.dart';
import '../../routes/app_router.gr.dart';

@RoutePage()
class CreateProjectPage extends StatefulWidget {
  const CreateProjectPage({super.key, this.startDate, this.endDate, this.name, this.description, this.image});

  final DateTime? startDate;
  final DateTime? endDate;
  final String? name;
  final String? description;
  final XFile? image;

  @override
  State<CreateProjectPage> createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> {
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _descriptionTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  XFile? image;

  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    _nameTextController.text = widget.name ?? "";
    _descriptionTextController.text = widget.description ?? "";
    _startDate = widget.startDate;
    _endDate = widget.endDate;
    image = widget.image;
    super.initState();
  }

  @override
  void dispose() {
    _nameTextController.dispose();
    _descriptionTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProjectBloc, ProjectState>(listener: (context, state) {
      state.error != null ? onErrorState(context, state.error!.localizedString(context)) : null;
      if (state.operation == ProjectOperation.update) {
        final Project currProj = state.projects.firstWhere((proj) =>
            proj.name == _nameTextController.text && proj.createdAt?.day == DateTime.now().day && proj.createdAt?.month == DateTime.now().month);

        context.router.push(ProjectDetailsRoute(project: currProj, isCreatedProject: true));
      }
      if (state.operation == ProjectOperation.create) {
        final Project currProj = state.projects.firstWhere((proj) =>
            proj.name == _nameTextController.text && proj.createdAt?.day == DateTime.now().day && proj.createdAt?.month == DateTime.now().month);

        image != null
            ? context.read<ProjectBloc>().uploadProjectImageCover(id: currProj.id ?? '', imageCover: File(image!.path))
            : context.router.push(ProjectDetailsRoute(project: currProj, isCreatedProject: true));
      }
    }, builder: (context, state) {
      return Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    BackIconButton(onPress: context.router.maybePop),
                    Gap.XS_H,
                    Text(
                      t.projects.create.title,
                      style: kSerzif(context),
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: () {
                          final user =
                              context.read<AuthCubit>().state.maybeWhen(authenticated: (user) => user, orElse: () => User.generateFakeData());
                          if(_endDate == null){
                            onInvalidInput(context);
                            return;
                          }
                          if (_endDate != null && _endDate!.isBeforeDay(DateTime.now())) {
                            onInvalidInput(context, text: t.errors.due_date_before_today);
                            return;
                          }
                          _formKey.currentState!.validate()
                              ? context.read<ProjectBloc>().createProject(
                                      project: Project(
                                    name: _nameTextController.text,
                                    description: _descriptionTextController.text,
                                    startDate: _startDate ?? DateTime.now(),
                                    endDate: _endDate ?? DateTime.now(),
                                    userId: user.id,
                                  ))
                              : onInvalidInput(context);
                        },
                        child: state.isLoading
                            ? const CustomCircularProgressIndicator()
                            : Text(t.general.create,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: _nameTextController.text.length >= 3 && _endDate != null
                                        ? Theme.of(context).primaryColor
                                        : Theme.of(context).colorScheme.onSecondary)))
                  ],
                ),
                Gap.MD,
                /*Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _projectCodeTextController,
                        style: Theme.of(context).textTheme.bodyMedium,
                        cursorColor: Theme.of(context).primaryColor,
                        decoration: InputDecoration(
                          hintText: t.general.name,
                        ),
                      ),
                    ),
                    ElevatedButton(onPressed: (){}, child: )
                  ],
                ),
                Gap.MD,*/
                DottedBorder(
                  strokeWidth: 2,
                  color: Theme.of(context).dividerColor,
                  dashPattern: const [3, 10],
                  strokeCap: StrokeCap.round,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(30),
                  child: InkResponse(
                    splashColor: Colors.transparent,
                    onTap: () async {
                      final ImagePicker picker = ImagePicker();
                      final img = await picker.pickImage(
                        source: ImageSource.gallery,
                        imageQuality: 50,
                      );
                      setState(() {
                        image = img;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                      height: MediaQuery.sizeOf(context).height / 7,
                      child: image == null
                          ? Text(t.projects.create.add_cover,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontSize: 14, color: Theme.of(context).colorScheme.onSecondaryContainer))
                          : Stack(
                              children: [
                                Image.file(
                                    File(
                                      image!.path,
                                    ),
                                    fit: BoxFit.cover),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: kNeutral100,
                                      borderRadius: BorderRadius.circular(200),
                                    ),
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            image = null;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.delete_forever,
                                          color: Theme.of(context).colorScheme.error,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
                Gap.MD,
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${t.general.name}*", style: Theme.of(context).textTheme.titleMedium),
                        Gap.XS,
                        TextFormField(
                          controller: _nameTextController,
                          style: Theme.of(context).textTheme.bodyMedium,
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: InputDecoration(
                            hintText: t.general.name,
                          ),
                          onChanged: (_) => setState(() {}),
                          validator: (value) {
                            if (value == null || value.isEmpty || value.length < 3) {
                              return 'Please enter a valid project name';
                            }
                            return null;
                          },
                        ),
                        Gap.MD,
                        Text(t.general.description, style: Theme.of(context).textTheme.titleMedium),
                        Gap.XS,
                        TextFormField(
                          controller: _descriptionTextController,
                          style: Theme.of(context).textTheme.bodyMedium,
                          cursorColor: Theme.of(context).primaryColor,
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: t.general.description,
                          ),
                        ),
                      ],
                    )),
                Gap.MD,
                Text(t.general.collaborator, style: Theme.of(context).textTheme.titleMedium),
                Gap.XS,
                TextButton(
                  onPressed: () => onAvailableSoon(context),
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(t.projects.collaborator.invite_collaborator, style: Theme.of(context).inputDecorationTheme.hintStyle),
                        Icon(Icons.keyboard_arrow_down_rounded, color: Theme.of(context).colorScheme.onSecondary)
                      ],
                    ),
                  ),
                ),
                Gap.MD,
                Text(t.general.start_date, style: Theme.of(context).textTheme.titleMedium),
                Gap.XS,
                DateField(
                    selectedDate: _startDate,
                    onPress: (date) => setState(() {
                          _startDate = date;
                        }),
                    onDelete: () => setState(() {
                          _startDate = null;
                        })),
                Gap.MD,
                Text("${t.general.due_date}*", style: Theme.of(context).textTheme.titleMedium),
                Gap.XS,
                DateField(
                    firstDate: _startDate,
                    selectedDate: _endDate,
                    onPress: (date) => setState(() {
                          _endDate = date;
                        }),
                    onDelete: () => setState(() {
                          _endDate = null;
                        }))
              ],
            ),
          ),
        ),
      );
    });
  }
}
