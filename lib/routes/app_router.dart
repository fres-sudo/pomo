import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
        page: RootRoute.page,
        //guards: [ OnBoardingGuard(), AuthGuard()],
        initial: true,
        fullscreenDialog: true,
        children: [
          AutoRoute(page: ProjectNavigation.page, fullscreenDialog: true,children: [
            AutoRoute(page: ProjectRoute.page, initial: true, fullscreenDialog: true),
            AutoRoute(page: ProjectDetailsRoute.page),
            AutoRoute(page: CreateProjectRoute.page, maintainState: false),
            AutoRoute(page: WorkSessionRoute.page),
          ]),
          AutoRoute(page: StatsRoute.page),
          AutoRoute(page: QuickSessionRoute.page),
          AutoRoute(page: ProfileRoute.page),
    ]),
    AutoRoute(page: LoginRoute.page, fullscreenDialog: true),
    AutoRoute(page: SignUpRoute.page, fullscreenDialog: true),
    AutoRoute(page: ForgotPasswordOTPRoute.page,),
    AutoRoute(page: ForgotPasswordRoute.page,),
    AutoRoute(page: ForgotPasswordRecoverRoute.page,),
    AutoRoute(page: OnBoardingRoute.page,  ),
    AutoRoute(page: ErrorRoute.page),
    //prova
    //AutoRoute(page: LaunchApp.page)
  ];
}