import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo/components/widgets/destruction_bottomsheet.dart';
import 'package:pomo/cubits/auth/auth_cubit.dart';
import 'package:pomo/pages/profile/widget/theme_mode_switcher.dart';

import '../../constants/colors.dart';
import '../../constants/text.dart';
import '../../routes/app_router.gr.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) => state.whenOrNull(
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
                      //borderRadius: BorderRadius.circular(16),
                      onTap: () => context.router.push(const EditProfileRoute()),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 17),
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
                          const CircleAvatar(),
                          const SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  state.maybeWhen(
                                      authenticated: (user) => user.username,
                                      orElse: () => "??"),
                                  style: Theme.of(context).textTheme.titleMedium),
                              Text(
                                state.maybeWhen(
                                    authenticated: (user) => "@${user.id}",
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
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: kNeutral600,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Notification",
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
                    InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Languages",
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
                    InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                            builder: (BuildContext context) {
                              return const ThemeModeSwitcher();
                            }, context: context,
                          );
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Theme Mode",
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
                    InkWell(
                        onTap: () {},
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
                              builder: (BuildContext context) {
                                return DestructionBottomSheet(
                                  title: "Account",
                                  buttonText: 'Log Out',
                                  description:
                                      "Are you sure you want to log out this account?",
                                  function: () {
                                    context.read<AuthCubit>().signOut();
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
