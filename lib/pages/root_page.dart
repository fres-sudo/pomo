import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pomo/cubits/auth/auth_cubit.dart';
import '../components/fancy_shimmer/fancy_shimmer_image.dart';
import '../i18n/strings.g.dart';
import '../routes/app_router.gr.dart';

@RoutePage()
class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        ScheduleRoute(),
        ProjectNavigation(),
        StatsRoute(),
        QuickSessionRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, spreadRadius: 10, blurRadius: 50),
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
                      icon: Icon(Icons.edit_calendar_rounded, color: Theme.of(context)
                          .bottomNavigationBarTheme
                          .unselectedIconTheme
                          ?.color ??
                          Colors.white,),
                      label: "Schedule"),
                  BottomNavigationBarItem(
                    activeIcon: const Icon(Icons.assignment_outlined),
                    icon: SvgPicture.asset(
                      'assets/icons/nav-bar/Light/Document.svg',
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme?.color ?? Colors.white,
                          BlendMode.srcIn),
                    ),
                    label: t.projects.plural,
                  ),
                  BottomNavigationBarItem(
                      activeIcon: Icon(Icons.area_chart),
                      icon: SvgPicture.asset(
                        'assets/icons/nav-bar/Light/Graph.svg',
                        colorFilter: ColorFilter.mode(
                            Theme.of(context)
                                    .bottomNavigationBarTheme
                                    .unselectedIconTheme
                                    ?.color ??
                                Colors.white,
                            BlendMode.srcIn),
                      ),
                      label: t.stats.short_title),
                  BottomNavigationBarItem(
                      activeIcon: SvgPicture.asset(
                          'assets/icons/nav-bar/Bold/Play.svg'),
                      icon: SvgPicture.asset(
                        'assets/icons/nav-bar/Light/Play.svg',
                        colorFilter: ColorFilter.mode(
                            Theme.of(context)
                                    .bottomNavigationBarTheme
                                    .unselectedIconTheme
                                    ?.color ??
                                Colors.white,
                            BlendMode.srcIn),
                      ),
                      label: t.general.quick_session),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
