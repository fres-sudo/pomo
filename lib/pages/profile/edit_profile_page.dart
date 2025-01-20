import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pomo/blocs/user/user_bloc.dart';
import 'package:pomo/components/utils/custom_circular_progress_indicator.dart';
import 'package:pomo/components/widgets/back_icon_button.dart';
import 'package:pomo/components/widgets/destruction_bottomsheet.dart';
import 'package:pomo/cubits/auth/auth_cubit.dart';
import 'package:pomo/models/user/user.dart';

import '../../components/fancy_shimmer/fancy_shimmer_image.dart';
import '../../components/fields/debounced_user_search.dart';
import '../../components/widgets/snack_bars.dart';
import '../../constants/colors.dart';
import '../../constants/text.dart';
import '../../extension/sized_box_extension.dart';
import '../../i18n/strings.g.dart';
import '../../routes/app_router.gr.dart';
import '../../services/storage/storage_service.dart';

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

  @override
  void initState() {
    _usernameTextController.text =
        context.read<AuthCubit>().state.maybeWhen(authenticated: (user) => user.username, orElse: () => "");
    super.initState();
  }

  User? get user => context.read<AuthCubit>().state.whenOrNull(
        authenticated: (user) => user,
      );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state.error != null) {
          onErrorState(context, state.error!.localizedString(context));
        }
        if (state.operation == UserOperation.deleted) {
          context.read<AuthCubit>().signOut();
          context.router.replaceAll([const RootRoute()]);
        }
        if (state.operation == UserOperation.updated || state.operation == UserOperation.updatedImage) {
          context
              .read<StorageService>()
              .updateUserSecureStorage(username: state.user!.username, photo: state.user!.avatar);
          onSuccessState(
              context,
              state.operation == UserOperation.updatedImage
                  ? t.profile.settings.update.updated_photo
                  : t.profile.settings.update.updated_info);
          context.read<AuthCubit>().authenticated(state.user!);
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
                      t.profile.my_profile,
                      style: kSerzif(context),
                    ),
                  ]),
                  TextButton(
                      onPressed: () async {
                        if (_usernameTextController.text == "" && _usernameTextController.text.length < 4) {
                          onInvalidInput(context);
                        } else {
                          final user = context.read<AuthCubit>().state.whenOrNull(authenticated: (user) => user);
                          if (image != null && user != null) {
                            context.read<UserBloc>().updateUserPhoto(id: user.id, photo: File(image!.path));
                          } else {
                            if (user != null) {
                              context
                                  .read<UserBloc>()
                                  .updateUser(id: user.id, user: user.copyWith(username: _usernameTextController.text));
                            }
                          }
                        }
                      },
                      child: state.isLoading
                          ? CustomCircularProgressIndicator(color: Theme.of(context).primaryColor)
                          : Text(t.general.update,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: (_usernameTextController.text != "" && _usernameTextController.text.length > 4)
                                      ? Theme.of(context).primaryColor
                                      : kNeutral400))),
                ],
              ),
              Gap.XL,
              Center(
                child: Stack(
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
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
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
                    ),
                    if (user?.avatar != null)
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: GestureDetector(
                          onTap: () {
                            context.read<UserBloc>().deleteUserPhoto(
                                  userId: user!.id,
                                );
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.error,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.delete_forever_outlined,
                              size: 20,
                              color: Theme.of(context).colorScheme.onError,
                            ),
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
                    Gap.XS,
                    DebouncedUserSearch(
                      controller: _usernameTextController,
                    ),
                    Gap.MD,
                    Text("Email", style: Theme.of(context).textTheme.titleMedium),
                    Gap.XS,
                    TextFormField(
                      initialValue: context
                          .watch<AuthCubit>()
                          .state
                          .maybeWhen(authenticated: (user) => user.email, orElse: () => "email@pomo.como"),
                      readOnly: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.lock, size: 20, color: kNeutral500),
                        hintText: context
                            .watch<AuthCubit>()
                            .state
                            .maybeWhen(authenticated: (user) => user.email, orElse: () => "email@pomo.com"),
                        hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.red),
                      ),
                    ),
                    Gap.MD,
                    const Divider(),
                    Gap.MD,
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: kRed500.withValues(alpha: 0.15),
                      ),
                      onPressed: () => showModalBottomSheet(
                          context: context,
                          isDismissible: true,
                          useRootNavigator: true,
                          builder: (BuildContext context) => DestructionBottomSheet(
                              title: t.profile.settings.delete_account.title,
                              buttonText: t.general.delete,
                              description: t.profile.settings.delete_account.description,
                              onPress: () {
                                context.read<UserBloc>().deleteUser(
                                    id: context
                                        .read<AuthCubit>()
                                        .state
                                        .maybeWhen(authenticated: (user) => user.id, orElse: () => ""));
                                context.router.maybePop();
                              })),
                      child: state.isLoading
                          ? CustomCircularProgressIndicator(
                              color: Theme.of(context).colorScheme.error,
                            )
                          : Center(
                              child: Text(
                                t.profile.settings.delete_account.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(color: Theme.of(context).colorScheme.error),
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
