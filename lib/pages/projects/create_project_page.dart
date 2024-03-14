import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pine/utils/mapper.dart';
import 'package:pomo/constants/colors.dart';
import 'package:pomo/constants/text.dart';
import 'package:pomo/models/project/project.dart';
import 'package:pomo/models/user/user.dart';
import 'package:pomo/routes/app_router.gr.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../blocs/project/project_bloc.dart';
import '../../components/utils/utils.dart';
import '../../cubits/auth/auth_cubit.dart';

@RoutePage()
class CreateProjectPage extends StatefulWidget {
  const CreateProjectPage({super.key});

  @override
  State<CreateProjectPage> createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> {
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _descriptionTextController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  XFile? image; //this is the state variable

  DateTime _selectedDate = DateTime.now();

  String userId = "";

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is DateTime) {
        _selectedDate = args.value;
      }
    });
  }

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
    return BlocConsumer<ProjectBloc, ProjectState>(
        listener: (context, state) {
          state.whenOrNull(
            created: (project) => context.router.push(ProjectDetailsRoute(project: project)),
            errorCreating: () => _onErrorCreating(context),
          );
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            InkWell(
                              onTap: () {
                                AutoRouter.of(context).pop();
                              },
                              child: SvgPicture.asset(
                                'assets/icons/arrow-left.svg',
                                colorFilter: ColorFilter.mode(
                                    Theme.of(context).iconTheme.color ??
                                        Colors.white,
                                    BlendMode.srcIn),
                              ),
                            ),
                            Text(
                              "New Project",
                              style: kSerzif(context),
                            ),
                          ]),
                          TextButton(
                              onPressed: () {
                                String id = context.read<AuthCubit>().state.maybeWhen(authenticated: (user) => user.id, orElse: () => "");
                                context.read<ProjectBloc>().createProject(
                                        project: Project(
                                      name: _nameTextController.text,
                                      description: _descriptionTextController.text,
                                      dueDate: _selectedDate,
                                      owner: id,
                                    ));
                              },
                              child: Text(
                                "Create",
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    color: _formKey.currentState?.validate() != null ? _formKey.currentState!.validate() ? kPrimary500 : kNeutral400 : kPrimary500),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
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
                                source: ImageSource.gallery);
                            setState(() {
                              image = img;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30)),
                            height: MediaQuery.sizeOf(context).height / 7,
                            child: image == null
                                ? Text("Add Cover",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                            fontSize: 14,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondaryContainer))
                                : Image.file(
                                    File(
                                      image!.path,
                                    ),
                                    fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Name*",
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              const SizedBox(
                                height: 6,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.name,
                                controller: _nameTextController,
                                cursorColor: kPrimary600,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: const InputDecoration(
                                  hintText: "Name",
                                ),
                                style: Theme.of(context).textTheme.titleMedium,
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value.length < 3) {
                                    return 'Please enter a valid project name';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 28,
                              ),
                              Text("Description",
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              const SizedBox(
                                height: 6,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.name,
                                controller: _descriptionTextController,
                                cursorColor: kPrimary600,
                                maxLines: 5,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: const InputDecoration(
                                  hintText: "Write your description here...",
                                ),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 28,
                      ),
                      Text("Collaborator",
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(
                        height: 6,
                      ),
                      GestureDetector(
                        onTap: () {
                          print("open bottom sheet");
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 17, horizontal: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Theme.of(context)
                                  .inputDecorationTheme
                                  .fillColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Invite a collaborator",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(color: kNeutral600)),
                              SvgPicture.asset("assets/icons/arrow-down.svg",
                                  colorFilter: ColorFilter.mode(
                                      Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer,
                                      BlendMode.srcIn))
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      Text("Due date*",
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(
                        height: 6,
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: Theme.of(context)
                                .bottomSheetTheme
                                .backgroundColor,
                            useSafeArea: true,
                            context: context,
                            builder: (_) => ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: SfDateRangePicker(
                                backgroundColor: Theme.of(context)
                                    .bottomSheetTheme
                                    .backgroundColor,
                                todayHighlightColor: kPrimary400,
                                selectionColor: kPrimary400,
                                selectionTextStyle:
                                    Theme.of(context).textTheme.titleMedium,
                                onSelectionChanged: _onSelectionChanged,
                                selectionMode:
                                    DateRangePickerSelectionMode.single,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 17, horizontal: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Theme.of(context)
                                  .inputDecorationTheme
                                  .fillColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(_selectedDate != DateTime.now() ?DateFormat('MMM dd, yyyy').format(_selectedDate) : "Select date",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(color: kNeutral600)),
                              SvgPicture.asset(
                                "assets/icons/calendar.svg",
                                colorFilter: ColorFilter.mode(
                                    Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer,
                                    BlendMode.srcIn),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
  _onErrorCreating(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          content: Text('Something went wrong while creating project, please try again')),
    );
  }
}