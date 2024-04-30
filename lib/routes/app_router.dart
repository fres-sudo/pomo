import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';
import 'guard/auth_guard.dart';
import 'guard/onBoarding_guard.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
        page: RootRoute.page,
        guards: [ OnBoardingGuard(), AuthGuard() ],
        initial: true,
        fullscreenDialog: true,
        children: [
          AutoRoute(page: ProjectNavigation.page, fullscreenDialog: true,children: [
            CustomRoute(page: ProjectRoute.page, transitionsBuilder: TransitionsBuilders.fadeIn, initial: true, fullscreenDialog: true),
            AutoRoute(page: ProjectDetailsRoute.page),
          ]),
          AutoRoute(page: StatsRoute.page),
          AutoRoute(page: QuickSessionRoute.page),
          AutoRoute(page: ProfileNavigation.page, fullscreenDialog: true,children: [
            CustomRoute(transitionsBuilder: TransitionsBuilders.fadeIn, page: ProfileRoute.page),
            AutoRoute(page: EditProfileRoute.page),
          ]),
        ]),
    CustomRoute(transitionsBuilder: TransitionsBuilders.fadeIn, page: LoginRoute.page, fullscreenDialog: true, ),
    CustomRoute(transitionsBuilder: TransitionsBuilders.fadeIn, page: SignUpRoute.page, fullscreenDialog: true),
    CustomRoute(transitionsBuilder: TransitionsBuilders.fadeIn, page: ForgotPasswordOTPRoute.page,),
    CustomRoute(transitionsBuilder: TransitionsBuilders.fadeIn, page: ForgotPasswordRoute.page,),
    CustomRoute(transitionsBuilder: TransitionsBuilders.fadeIn, page: ForgotPasswordRecoverRoute.page,),
    CustomRoute(transitionsBuilder: TransitionsBuilders.fadeIn, page: OnBoardingRoute.page,  ),
    AutoRoute(page: WorkSessionRoute.page),
    AutoRoute(page: CreateProjectRoute.page,),
    CustomRoute(transitionsBuilder: TransitionsBuilders.fadeIn, page: SessionCompleteRoute.page),
    CustomRoute(transitionsBuilder: TransitionsBuilders.fadeIn, page: PrivacyPolicyRoute.page),

  ];
}