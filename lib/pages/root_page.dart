import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pomo/blocs/project/project_bloc.dart';
import 'package:pomo/blocs/task/task_bloc.dart';
import 'package:pomo/components/widgets/profile_picture.dart';
import 'package:pomo/cubits/auth/auth_cubit.dart';
import 'package:pomo/cubits/schedule/schedule_cubit.dart';

import '../constants/enum.dart';
import '../i18n/strings.g.dart';
import '../routes/app_router.gr.dart';

@RoutePage()
class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.whenOrNull( notAuthenticated: () {
          context.router.replace(RootRoute());
        });
      },
      child: AutoTabsRouter(
        routes: const [
          ScheduleRoute(),
          ProjectNavigation(),
          QuickSessionRoute(),
          StatsRoute(),
          ProfileRoute()
        ],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            body: child,
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.black12, spreadRadius: 10, blurRadius: 50),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                child: BottomNavigationBar(
                  currentIndex: tabsRouter.activeIndex,
                  onTap: (value) => tabsRouter.setActiveIndex(value),
                  items: [
                    BottomNavigationBarItem(
                        activeIcon: const Icon(Icons.edit_calendar_rounded),
                        icon: Icon(
                          Icons.edit_calendar_rounded,
                          color: Theme
                              .of(context)
                              .bottomNavigationBarTheme
                              .unselectedIconTheme
                              ?.color ?? Colors.white,
                        ), label: t.general.schedule),
                    BottomNavigationBarItem(
                        activeIcon: SvgPicture.asset(
                          'assets/icons/nav-bar/Light/Document.svg',
                          colorFilter:
                          ColorFilter.mode(Theme
                              .of(context)
                              .bottomNavigationBarTheme
                              .selectedIconTheme
                              ?.color ?? Colors.white, BlendMode.srcIn),
                        ),
                        icon: SvgPicture.asset(
                          'assets/icons/nav-bar/Light/Document.svg',
                          colorFilter:
                          ColorFilter.mode(Theme
                              .of(context)
                              .bottomNavigationBarTheme
                              .unselectedIconTheme
                              ?.color ?? Colors.white, BlendMode.srcIn),
                        ),
                        label: t.projects.title
                    ),
                    BottomNavigationBarItem(
                        activeIcon: SvgPicture.asset('assets/icons/nav-bar/Light/Play.svg', colorFilter:
                        ColorFilter.mode(Theme
                            .of(context)
                            .bottomNavigationBarTheme
                            .selectedIconTheme
                            ?.color ?? Colors.white, BlendMode.srcIn),
                        ),
                        icon: SvgPicture.asset(
                          'assets/icons/nav-bar/Light/Play.svg',
                          colorFilter:
                          ColorFilter.mode(Theme
                              .of(context)
                              .bottomNavigationBarTheme
                              .unselectedIconTheme
                              ?.color ?? Colors.white, BlendMode.srcIn),
                        ), label: "Pomodoro"),
                    BottomNavigationBarItem(
                        activeIcon: SvgPicture.asset(
                          'assets/icons/nav-bar/Light/Graph.svg',
                          colorFilter:
                          ColorFilter.mode(Theme
                              .of(context)
                              .bottomNavigationBarTheme
                              .selectedIconTheme
                              ?.color ?? Colors.white, BlendMode.srcIn),
                        ),
                        icon: SvgPicture.asset(
                          'assets/icons/nav-bar/Light/Graph.svg',
                          colorFilter:
                          ColorFilter.mode(Theme
                              .of(context)
                              .bottomNavigationBarTheme
                              .unselectedIconTheme
                              ?.color ?? Colors.white, BlendMode.srcIn),
                        ), label: t.stats.title),
                    BottomNavigationBarItem(
                        icon: const ProfilePicture(
                          width: 24,
                          height: 24,
                        ), label: t.profile.title),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
