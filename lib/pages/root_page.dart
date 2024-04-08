import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pomo/cubits/auth/auth_cubit.dart';
import '../routes/app_router.gr.dart';

@RoutePage()
class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        ProjectNavigation(),
        StatsRoute(),
        QuickSessionRoute(),
        ProfileRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, spreadRadius: 10, blurRadius: 50),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
              child: BottomNavigationBar(
                currentIndex: tabsRouter.activeIndex,
                onTap: (value) {
                  tabsRouter.setActiveIndex(value);
                },
                items: [
                  BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      'assets/icons/nav-bar/Bold/Document.svg',
                    ),
                    icon: SvgPicture.asset(
                      'assets/icons/nav-bar/Light/Document.svg',
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme?.color ?? Colors.white,
                          BlendMode.srcIn),
                    ),
                    label: "Project",
                  ),
                  BottomNavigationBarItem(
                      activeIcon: SvgPicture.asset(
                          'assets/icons/nav-bar/Bold/Graph.svg'),
                      icon: SvgPicture.asset(
                        'assets/icons/nav-bar/Light/Graph.svg',
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme?.color ?? Colors.white,
                            BlendMode.srcIn),
                      ),
                      label: "Stats"),
                  BottomNavigationBarItem(
                      activeIcon: SvgPicture.asset(
                          'assets/icons/nav-bar/Bold/Play.svg'),
                      icon: SvgPicture.asset(
                        'assets/icons/nav-bar/Light/Play.svg',
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme?.color ?? Colors.white,
                            BlendMode.srcIn),
                      ),
                      label: "QuickSession"),
                   BottomNavigationBarItem(
                      icon: CircleAvatar(
                        radius: 13,
                          backgroundImage: context.read<AuthCubit>().state.maybeWhen(
                            authenticated: (user) {
                              if (user.photo == null) {
                                return const AssetImage("assets/images/propic-placeholder.jpg");
                              } else {
                                //return NetworkImage(user.photo!);
                                return FileImage(File(user.photo!));
                              }
                            },
                            orElse: () => const AssetImage("assets/images/propic-placeholder.jpg"),)
                      ),
                      label: "Profile"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
