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
import 'package:pomo/components/utils/custom_circular_progress_indicator.dart';
import 'package:pomo/components/widgets/back_icon_button.dart';
import 'package:pomo/components/widgets/destruction_bottomsheet.dart';
import 'package:pomo/cubits/auth/auth_cubit.dart';

import '../../components/fancy_shimmer/fancy_shimmer_image.dart';
import '../../components/widgets/snack_bars.dart';
import '../../constants/colors.dart';
import '../../constants/text.dart';
import '../../extension/sized_box_extension.dart';
import '../../i18n/strings.g.dart';
import '../../routes/app_router.gr.dart';

@RoutePage()
class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _usernameTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  XFile? image;

  Future<void> updateUserSecureStorage({String? name, String? surname, String? photo}) async {
    const storage = FlutterSecureStorage();
    final String? userDataString = await storage.read(key: "user_data");

    if (userDataString != null) {
      Map<String, dynamic> userData = json.decode(userDataString);

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
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        state.error != null ? onErrorState(context, state.error!.localizedString(context)) : null;
        switch (state.operation) {
          case UserOperation.deleted:
            () => {context.read<AuthCubit>().signOut(), context.router.replace(const RootRoute())};
          case UserOperation.updatedImage || UserOperation.updatedImage:
            () {
              updateUserSecureStorage(photo: state.user!.avatar);
              onSuccessState(context, state.operation == UserOperation.updatedImage ? t.profile.settings.update.updated_photo : t.profile.settings.update.updated_info);
              context.read<AuthCubit>().authenticated(state.user!);
            };
          default:
            return;
        }
      },
      builder: (context, state) => Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                   BackIconButton(onPress: () => context.router.maybePop()),
                    Gap.XS_H,
                    Text(
                      "My Profile",
                      style: kSerzif(context),
                    ),
                  ]),
                  TextButton(
                      onPressed: () async {
                        if (_usernameTextController.text == "" && _usernameTextController.text.length < 4) {
                          onInvalidInput(context);
                        } else {
                          image != null ? context.read<UserBloc>().updateUserPhoto(id: state.user?.id ?? "", photo: File(image!.path)) : null;
                        }
                      },
                      child: Text("Update",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: (_usernameTextController.text != "" && _usernameTextController.text.length > 4)
                                  ? Theme.of(context).primaryColor
                                  : kNeutral400))),
                ],
              ),
              Gap.XL,
              Center(
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    context.read<AuthCubit>().state.maybeWhen(
                        authenticated: (user) {
                          if (image == null) {
                            if (user.avatar == null) {
                              return const CircleAvatar(
                                maxRadius: 75,
                                backgroundImage: AssetImage("assets/images/propic-placeholder.jpg"),
                              );
                            } else {
                              return ClipOval(
                                  child: SizedBox(
                                      height: 150,
                                      width: 150,
                                      child: FancyShimmerImage(
                                        imageUrl: user.avatar!,
                                        boxFit: BoxFit.cover,
                                      )));
                            }
                          } else {
                            return CircleAvatar(radius: 75, backgroundImage: FileImage(File(image!.path)));
                          }
                        },
                        orElse: () => const CircleAvatar(
                              radius: 75,
                              backgroundImage: AssetImage("assets/images/propic-placeholder.jpg"),
                            )),
                    GestureDetector(
                      onTap: () async {
                        final ImagePicker picker = ImagePicker();
                        final img = await picker.pickImage(
                          source: ImageSource.gallery,
                          maxHeight: 500,
                          maxWidth: 500,
                          imageQuality: 50,
                        );
                        if (img == null) return;
                        setState(() {
                          image = img;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 40,
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
              Gap.XL,
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name", style: Theme.of(context).textTheme.titleMedium),
                    Gap.XS,
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _usernameTextController,
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
                        if (value == null || value.isEmpty || value.length < 3) {
                          return 'Please enter a valid name';
                        }
                        return null;
                      },
                    ),
                    Gap.MD,
                    Text("Email", style: Theme.of(context).textTheme.titleMedium),
                    Gap.XS,
                    TextFormField(
                      initialValue: context.watch<AuthCubit>().state.maybeWhen(authenticated: (user) => user.email, orElse: () => "ciao"),
                      readOnly: true,
                      cursorColor: kPrimary600,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.lock, size: 20, color: kNeutral500),
                        hintText: context.watch<AuthCubit>().state.maybeWhen(authenticated: (user) => user.email, orElse: () => "ciao"),
                        hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.red),
                      ),
                    ),
                    Gap.MD,
                    const Divider(),
                    Gap.MD,
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: kRed500.withOpacity(0.15),
                      ),
                      onPressed: () => showModalBottomSheet(
                          context: context,
                          isDismissible: true,
                          useRootNavigator: true,
                          builder: (BuildContext context) => DestructionBottomSheet(
                                title:  t.profile.settings.delete_account.title,
                                buttonText: t.general.delete,
                                description: t.profile.settings.delete_account.description,
                                function: () => context.read<UserBloc>().deleteUser(id: state.user?.id ?? ""),
                              )),
                      child: state.isLoading ? CustomCircularProgressIndicator(color: Theme.of(context).colorScheme.error,) :Center(
                        child: Text(
                          t.profile.settings.delete_account.title,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.error),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
