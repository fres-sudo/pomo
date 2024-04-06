
import 'dart:convert';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pomo/blocs/user/user_bloc.dart';
import 'package:pomo/components/utils/my_progress_indicator.dart';
import 'package:pomo/components/utils/utils.dart';
import 'package:pomo/cubits/auth/auth_cubit.dart';
import 'package:pomo/models/user/user.dart';
import '../../components/widgets/snack_bars.dart';
import '../../constants/colors.dart';
import '../../constants/text.dart';
import '../../routes/app_router.gr.dart';

@RoutePage()
class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _surnameTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  XFile? image;

  late User user;

  Future<void> updateUserSecureStorage(
      {String? name, String? surname, String? photo}) async {
    const storage = FlutterSecureStorage();
    final String? userDataString = await storage.read(key: "user_data");

    if (userDataString != null) {
      Map<String, dynamic> userData = json.decode(userDataString);

      // Update specific fields
      if (name != null && name.isNotEmpty) {
        userData['name'] = name;
      }
      if (surname != null && surname.isNotEmpty) {
        userData['surname'] = surname;
      }
      if (photo != null && photo.isNotEmpty) {
        userData['photo'] = photo;
      }

      await storage.write(key: "user_data", value: json.encode(userData));

    }
  }

  @override
  void initState() {
    user = context.read<AuthCubit>().state.whenOrNull(
        authenticated: (user) => user,)!;
    _nameTextController.text = user.name ?? "";
    _surnameTextController.text = user.surname ?? "";
    super.initState();
  }

  @override
  void dispose() {
    _nameTextController.dispose();
    _surnameTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        state.whenOrNull(
            updated: (user) {
              this.user = user;
              if(_nameTextController.text.isNotEmpty && _surnameTextController.text.isNotEmpty) {
                updateUserSecureStorage(
                    name: user.name!.capitalize(), surname: user.surname!.capitalize());
                onSuccessState(context, "update your information");
              }
            },
            updatedPhoto: (user) {
              this.user = user;
              if(image != null) {
                updateUserSecureStorage(photo: user.photo);
                onSuccessState(context, "update your information");
              }
            },
            errorUpdating: () => onErrorState(context, "updating user"));
      },
      builder: (context, state) =>
          state.maybeWhen(
            updatingPhoto: () => const MyProgressIndicator(),
            orElse: () =>  Scaffold(
            body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                InkWell(
                                  onTap: () {
                                    context.router.replace(const ProfileRoute());
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
                                  "My Profile",
                                  style: kSerzif(context),
                                ),
                              ]),
                              TextButton(
                                  onPressed: () async {
                                    if(_nameTextController.text == "" && _nameTextController.text.length < 4 &&
                                        _surnameTextController.text == "" && _surnameTextController.text.length < 4) {
                                      onInvalidInput(context);
                                    } else{
                                      print(
                                        user.copyWith(
                                          name: _nameTextController.text,
                                          surname: _surnameTextController.text,
                                        ),
                                      );
                                      _nameTextController.text != user.name || _surnameTextController.text != user.surname ?
                                      context.read<UserBloc>().updateUser(
                                        user: user.copyWith(
                                          name: _nameTextController.text,
                                          surname: _surnameTextController.text,
                                        ),
                                        id: user.id,) : null;
                                      image != null ?
                                      context.read<UserBloc>().updateUserPhoto(id: user.id, photo: File(image!.path)): null;
                                    }
                                  },
                                  child: Text(
                                      "Update",
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                          color:  (_nameTextController.text == "" && _nameTextController.text.length < 4 &&
                                              _surnameTextController.text == "" && _surnameTextController.text.length < 4) ?
                                          kPrimary500
                                              : kNeutral400))
                              ),
                            ],
                          ),
                          Center(
                            child: Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children: [
                                CircleAvatar(
                                  backgroundImage: image != null ? FileImage(File(image!.path)) : (
                                      context.read<AuthCubit>().state.maybeWhen(
                                        authenticated: (user) {
                                          if (user.photo == null) {
                                            return const AssetImage("assets/images/propic-placeholder.jpg");
                                          } else {
                                            return NetworkImage(user.photo!);
                                          }
                                        },
                                        orElse: () => const AssetImage("assets/images/propic-placeholder.jpg"),)
                                  ),
                                  radius: 40,
                                ),
                                GestureDetector(
                                  onTap: () async{
                                    final ImagePicker picker = ImagePicker();
                                    final img = await picker.pickImage(
                                      source: ImageSource.gallery,
                                      maxHeight: 500,
                                      maxWidth: 500,
                                      imageQuality: 50,
                                    );
                                    if(img == null) return;
                                    setState(() {
                                      image = img;
                                    });
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).cardColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.edit,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Name",
                                    style: Theme.of(context).textTheme.titleMedium),
                                const SizedBox(
                                  height: 6,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.name,
                                  controller: _nameTextController,
                                  cursorColor: kPrimary600,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  decoration: const InputDecoration(
                                    hintText: "Username",
                                  ),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.deny(RegExp('[ ]')),
                                  ],
                                  style: Theme.of(context).textTheme.titleMedium,
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        value.length < 3) {
                                      return 'Please enter a valid name';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                Text("Surname",
                                    style: Theme.of(context).textTheme.titleMedium),
                                const SizedBox(
                                  height: 6,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _surnameTextController,
                                  cursorColor: kPrimary600,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  decoration: const InputDecoration(
                                    hintText: "Surname",
                                  ),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.deny(RegExp('[ ]')),
                                  ],
                                  style: Theme.of(context).textTheme.titleMedium,
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        value.length < 3) {
                                      return 'Please enter a valid surname';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                Text("Email",
                                    style: Theme.of(context).textTheme.titleMedium),
                                const SizedBox(
                                  height: 6,
                                ),
                                TextFormField(
                                  initialValue: user.email,
                                  readOnly: true,
                                  cursorColor: kPrimary600,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  decoration: InputDecoration(
                                      suffixIcon: const Icon(
                                          Icons.lock,
                                          size: 20,
                                          color: kNeutral500
                                      ),
                                      hintText: user.email),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(color: kNeutral500),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(),
                          const SizedBox()
                        ],
                      ),
                    ],
                  ),
                )),
          ), )

    );
  }
}
