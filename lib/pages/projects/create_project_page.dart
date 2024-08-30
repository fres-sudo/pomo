import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pomo/components/fields/date_field.dart';
import 'package:pomo/components/utils/custom_circular_progress_indicator.dart';
import 'package:pomo/components/widgets/snack_bars.dart';
import 'package:pomo/constants/colors.dart';
import 'package:pomo/constants/text.dart';
import 'package:pomo/cubits/auth/auth_cubit.dart';
import 'package:pomo/models/project/project.dart';
import 'package:pomo/models/user/user.dart';

import '../../blocs/project/project_bloc.dart';
import '../../components/utils/utils.dart';
import '../../extension/sized_box_extension.dart';
import '../../i18n/strings.g.dart';
import '../../routes/app_router.gr.dart';

@RoutePage()
class CreateProjectPage extends StatefulWidget {
  const CreateProjectPage({super.key});

  @override
  State<CreateProjectPage> createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> {
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _descriptionTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  XFile? image;

  DateTime _selectedDate = DateTime.now();

  String userId = "";

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      userId = await getUserId();
    });
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
      if (state.operation == ProjectOperation.create) {
        image != null
            ? context.read<ProjectBloc>().uploadProjectImageCover(id: state.projects.firstWhere((proj) => proj.name == _nameTextController.text).id ?? "", imageCover: File(image!.path))
            : context.router.push(
                ProjectDetailsRoute(project: state.projects.firstWhere((proj) => proj.name == _nameTextController.text), isCreatedProject: true));
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
                  IconButton(onPressed: context.router.maybePop, icon: const Icon(Icons.chevron_left_rounded)),
                  Text(
                    t.projects.create.title,
                    style: kSerzif(context),
                  ),
                    const Spacer(),
                    TextButton(
                        onPressed: () {
                          final user =
                              context.read<AuthCubit>().state.maybeWhen(authenticated: (user) => user, orElse: () => User.generateFakeData());
                          _formKey.currentState!.validate()
                              ? context.read<ProjectBloc>().createProject(
                                      project: Project(
                                    name: _nameTextController.text,
                                    description: _descriptionTextController.text,
                                    startDate: _selectedDate,
                                    endDate: _selectedDate,
                                    owner: user,
                                  ))
                              : onInvalidInput(context);
                        },
                        child: state.isLoading
                            ? const CustomCircularProgressIndicator()
                            : Text(
                                t.general.create,
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    color: _formKey.currentState?.validate() != null
                                        ? _formKey.currentState!.validate()
                                            ? kPrimary500
                                            : kNeutral400
                                        : kNeutral400),
                              ))
                  ],
                ),
                Gap.MD,
                DottedBorder(
                  strokeWidth: 2,
                  color: kNeutral300,
                  dashPattern: const [30, 1],
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
                                        icon: const Icon(
                                          Icons.delete_forever,
                                          color: kRed500,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
                Gap.LG,
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${t.general.name}*", style: Theme.of(context).textTheme.titleMedium),
                        Gap.XS,
                        TextFormField(
                          controller: _nameTextController,
                          decoration: InputDecoration(
                            hintText: t.general.name,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty || value.length < 3) {
                              return 'Please enter a valid project name';
                            }
                            return null;
                          },
                        ),
                        Gap.LG,
                        Text(t.general.description, style: Theme.of(context).textTheme.titleMedium),
                        Gap.XS,
                        TextFormField(
                          controller: _descriptionTextController,
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: t.general.description,
                          ),
                        ),
                      ],
                    )),
                Gap.LG,
                Text(t.general.collaborator, style: Theme.of(context).textTheme.titleMedium),
                Gap.XS,
                GestureDetector(
                  onTap: () => onAvailableSoon(context),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Theme.of(context).inputDecorationTheme.fillColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(t.projects.invite_friends, style: Theme.of(context).textTheme.titleMedium?.copyWith(color:  Theme.of(context).colorScheme.onSecondary)),
                        Icon(Icons.keyboard_arrow_down_rounded,color: Theme.of(context).colorScheme.onSecondary)
                      ],
                    ),
                  ),
                ),
                Gap.LG,
                Text("${t.general.due_date}*", style: Theme.of(context).textTheme.titleMedium),
                Gap.XS,
                DateField(
                    selectedDate: _selectedDate,
                    onPress: (date) => setState(() {
                          _selectedDate = date;
                        }),
                    onDelete: () => setState(() {
                          _selectedDate = DateTime.now();
                        }))
              ],
            ),
          ),
        ),
      );
    });
  }
}
