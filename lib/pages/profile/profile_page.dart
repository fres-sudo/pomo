import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pomo/components/widgets/destruction_bottomsheet.dart';
import 'package:pomo/components/widgets/profile_picture.dart';
import 'package:pomo/components/widgets/title_page.dart';
import 'package:pomo/cubits/theme/theme_cubit.dart';
import 'package:pomo/extension/sized_box_extension.dart';
import 'package:pomo/pages/profile/widget/language_bottom_sheet.dart';
import 'package:pomo/pages/profile/widget/set_timer_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/text.dart';
import '../../cubits/auth/auth_cubit.dart';
import '../../i18n/strings.g.dart';
import '../../routes/app_router.gr.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) =>
          state.whenOrNull(notAuthenticated: () => context.router.replaceAll([const RootRoute()])),
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(t.profile.title, style: kSerzif(context)),
                      Text(t.profile.subtitle,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Theme.of(context).colorScheme.onSecondary)),
                      Gap.MD,
                      InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () => context.router.push(const EditProfileRoute()),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 10),
                            ],
                          ),
                          child: Row(children: [
                            const ProfilePicture(height: 56, width: 56),
                            const SizedBox(
                              width: 12,
                            ),
                            BlocBuilder<AuthCubit, AuthState>(
                              builder: (context, state) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        state.maybeWhen(
                                            authenticated: (user) => "@${user.username}", orElse: () => "??"),
                                        style: Theme.of(context).textTheme.titleMedium),
                                    Text(
                                        state.maybeWhen(
                                            authenticated: (user) =>
                                                "Since: ${DateFormat("EEEE, dd MMMM yyyy").format(user.createdAt)}",
                                            orElse: () => "??"),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(color: Theme.of(context).colorScheme.onSecondary)),
                                  ],
                                );
                              },
                            )
                          ]),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Divider(),
                      ),
                      Text(t.profile.settings.general.title,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(color: Theme.of(context).colorScheme.onSecondary)),
                      Gap.SM,
                      InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context, useRootNavigator: true, builder: (context) => const SetTimer());
                          },
                          borderRadius: BorderRadius.circular(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                t.profile.settings.general.timer_options,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const Icon(Icons.chevron_right_rounded)
                            ],
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            t.profile.settings.general.dark_mode,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
                            return Transform.scale(
                              scale: 0.8,
                              child: Switch.adaptive(
                                activeColor: Theme.of(context).primaryColor,
                                value: state.mode == ThemeMode.dark,
                                onChanged: (bool value) {
                                  context.read<ThemeCubit>().changeMode(value ? ThemeMode.dark : ThemeMode.light);
                                },
                              ),
                            );
                          })
                        ],
                      ),
                      InkWell(
                          onTap: () {
                            if (Platform.isAndroid) {
                              const intent = AndroidIntent(
                                action: 'android.settings.APP_NOTIFICATION_SETTINGS',
                                arguments: <String, dynamic>{
                                  'android.provider.extra.APP_PACKAGE': 'com.yourpackage.appname',
                                },
                              );
                              intent.launch();
                            } else if (Platform.isIOS) {
                              openAppSettings();
                            }
                          },
                          borderRadius: BorderRadius.circular(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                t.profile.settings.general.notifications,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const Icon(
                                Icons.chevron_right_rounded,
                              )
                            ],
                          )),
                      Gap.SM,
                      InkWell(
                          onTap: () => showModalBottomSheet(
                              context: context,
                              useRootNavigator: true,
                              builder: (context) => const LanguageBottomSheet()),
                          borderRadius: BorderRadius.circular(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                t.profile.settings.general.languages.title,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const Icon(Icons.chevron_right_rounded)
                            ],
                          )),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Divider(),
                      ),
                      Text(t.profile.settings.about_us.title,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(color: Theme.of(context).colorScheme.onSecondary)),
                      Gap.SM,
                      InkWell(
                          onTap: () async {
                            const url = 'https://pomo.fres.space/privacy';
                            if (await canLaunchUrl(Uri.parse(url))) {
                              await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          borderRadius: BorderRadius.circular(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                t.profile.settings.about_us.privacy_policy,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const Icon(Icons.chevron_right_rounded)
                            ],
                          )),
                      Gap.SM,
                      InkWell(
                          onTap: () async {
                            const url = 'https://pomo.fres.space/terms';
                            if (await canLaunchUrl(Uri.parse(url))) {
                              await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          borderRadius: BorderRadius.circular(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                t.profile.settings.about_us.terms_and_conditions,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const Icon(Icons.chevron_right_rounded)
                            ],
                          )),
                      Gap.SM,
                      InkWell(
                          onTap: () async {
                            const url = 'https://pomo.fres.space/about';
                            if (await canLaunchUrl(Uri.parse(url))) {
                              await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          borderRadius: BorderRadius.circular(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                t.profile.settings.about_us.find_out_more,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const Icon(Icons.chevron_right_rounded)
                            ],
                          )),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Divider(),
                      ),
                      InkWell(
                          onTap: () => showModalBottomSheet(
                              context: context,
                              useRootNavigator: true,
                              builder: (BuildContext context) {
                                return DestructionBottomSheet(
                                  title: t.profile.account,
                                  buttonText: t.profile.settings.logout.title,
                                  description: t.profile.settings.logout.description,
                                  onPress: () {
                                    context.read<AuthCubit>().signOut();
                                    Navigator.of(context).pop();
                                    context.router.replaceAll([const RootRoute()]);
                                  },
                                );
                              },
                              isDismissible: true),
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            child: Text(t.profile.settings.logout.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(color: Theme.of(context).colorScheme.error)),
                          )),
                    ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
