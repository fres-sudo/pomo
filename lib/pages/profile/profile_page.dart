import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo/components/fancy_shimmer/fancy_shimmer_image.dart';
import 'package:pomo/components/widgets/destruction_bottomsheet.dart';
import 'package:pomo/cubits/theme/theme_cubit.dart';
import 'package:pomo/pages/profile/widget/set_timer_bottom_sheet.dart';
import 'package:pomo/pages/profile/widget/theme_mode_switcher.dart';
import '../../constants/colors.dart';
import '../../constants/text.dart';
import '../../cubits/auth/auth_cubit.dart';
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
      listener: (context, state) => state.whenOrNull(
          //signOut: () => context.router.replace(const RootRoute()),
          notAuthenticated: () => context.router.replace(const RootRoute())),
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
                    Text("Account", style: kSerzif(context)),
                    const SizedBox(
                      height: 16,
                    ),
                    InkWell(
                      onTap: () => context.router.push(const EditProfileRoute()),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 1,
                                blurRadius: 10),
                          ],
                        ),
                        child: Row(children: [
                          context.watch<AuthCubit>().state.maybeWhen(
                              authenticated: (user) {
                                if (user.avatar == null) {
                                  return const CircleAvatar(
                                    backgroundImage: AssetImage(
                                        "assets/images/propic-placeholder.jpg"),
                                  );
                                } else {
                                  return ClipOval(
                                      child: SizedBox(
                                          height: 56,
                                          width: 56,
                                          child: FancyShimmerImage(
                                            imageUrl: user.avatar!,
                                            boxFit: BoxFit.cover,
                                          )));
                                }
                              },
                              orElse: () => const CircleAvatar(
                                    backgroundImage: AssetImage(
                                        "assets/images/propic-placeholder.jpg"),
                                  )),
                          const SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  context.read<AuthCubit>().state.maybeWhen(
                                      authenticated: (user) => user.username,
                                      orElse: () => "??"),
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              Text(
                                context.read<AuthCubit>().state.maybeWhen(
                                    authenticated: (user) =>
                                        "@${user.username}",
                                    orElse: () => "??"),
                                style: GoogleFonts.inter(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: kNeutral600,
                                ),
                              ),
                            ],
                          )
                        ]),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Divider(),
                    ),
                    Text(
                      "General",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Theme.of(context).colorScheme.onSurface)
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    //InkWell(
                    //    onTap: () {},
                    //    borderRadius: BorderRadius.circular(20),
                    //    child: Row(
                    //      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //      children: [
                    //        Text(
                    //          "Notification & Sound",
                    //          style: Theme.of(context).textTheme.titleMedium,
                    //        ),
                    //        SvgPicture.asset(
                    //          "assets/icons/arrow-right.svg",
                    //          height: 18,
                    //        )
                    //      ],
                    //    )),
                    //const SizedBox(
                    //  height: 20,
                    //),
                    InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              useRootNavigator: true,
                              builder: (context) => const SetTimer());
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Timer Option",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SvgPicture.asset(
                              "assets/icons/arrow-right.svg",
                              height: 18,
                            )
                          ],
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            useRootNavigator: true,
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            builder: (BuildContext context) {
                              return const ThemeModeSwitcher();
                            },
                            context: context,
                          );
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Dark Mode",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            BlocBuilder<ThemeCubit, ThemeState>(
                                builder: (context, state) {
                              return Transform.scale(
                                scale: 0.8,
                                child: Switch.adaptive(
                                  activeColor: Theme.of(context).primaryColor,
                                  value: state.mode == ThemeMode.dark,
                                  onChanged: (bool value) {
                                    context.read<ThemeCubit>().changeMode(value
                                        ? ThemeMode.dark
                                        : ThemeMode.light);
                                  },
                                ),
                              );
                            })
                          ],
                        )),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Divider(),
                    ),
                    Text(
                      "About us",
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: kNeutral600,
                      ),
                    ),

                    const SizedBox(
                      height: 8,
                    ),
                    /*
                    InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Help Center",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SvgPicture.asset(
                              "assets/icons/arrow-right.svg",
                              height: 18,
                            )
                          ],
                        )),

                    const SizedBox(
                      height: 20,
                    ),
                    */
                    InkWell(
                        onTap: () =>
                            context.router.push(const PrivacyPolicyRoute()),
                        borderRadius: BorderRadius.circular(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Privacy Policy",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SvgPicture.asset(
                              "assets/icons/arrow-right.svg",
                              height: 18,
                            )
                          ],
                        )),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Divider(),
                    ),
                    InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              useRootNavigator: true,
                              builder: (BuildContext context) {
                                return DestructionBottomSheet(
                                  title: "Account",
                                  buttonText: 'Log Out',
                                  description:
                                      "Are you sure you want to log out this account?",
                                  function: () {
                                    context.read<AuthCubit>().signOut();
                                    Navigator.of(context).pop();
                                    context.router.replace(const RootRoute());
                                  },
                                );
                              },
                              isDismissible: true);
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          child: Text(
                            "Logout",
                            style: GoogleFonts.inter(
                              color: kRed600,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
