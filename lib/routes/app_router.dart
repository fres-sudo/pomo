import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';
import 'guard/auth_guard.dart';
import 'guard/onBoarding_guard.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
        initial: true,
        page: RootRoute.page,
        guards: [ OnBoardingGuard(), AuthGuard() ],
        children: [
          AutoRoute(page: ProjectNavigation.page, fullscreenDialog: true,children: [
            CustomRoute(page: ProjectRoute.page, transitionsBuilder: TransitionsBuilders.fadeIn, initial: true, fullscreenDialog: true),
            CustomRoute(transitionsBuilder: TransitionsBuilders.fadeIn, page: ProjectDetailsRoute.page),
          ]),
          CustomRoute(transitionsBuilder: TransitionsBuilders.fadeIn,page: StatsRoute.page),
          CustomRoute(transitionsBuilder: TransitionsBuilders.fadeIn,page: QuickSessionRoute.page),
          CustomRoute(transitionsBuilder: TransitionsBuilders.fadeIn,page: ScheduleRoute.page),
          CustomRoute(transitionsBuilder: TransitionsBuilders.fadeIn,page: ProfileRoute.page),
        ]),
    CustomRoute(transitionsBuilder: TransitionsBuilders.fadeIn, page: LoginRoute.page, fullscreenDialog: true, ),
    CustomRoute(transitionsBuilder: TransitionsBuilders.fadeIn, page: SignUpRoute.page, fullscreenDialog: true),
    CustomRoute(transitionsBuilder: TransitionsBuilders.fadeIn, page: ForgotPasswordOTPRoute.page,),
    CustomRoute(transitionsBuilder: TransitionsBuilders.fadeIn, page: ForgotPasswordRoute.page,),
    CustomRoute(transitionsBuilder: TransitionsBuilders.fadeIn, page: ForgotPasswordRecoverRoute.page,),
    CustomRoute(transitionsBuilder: TransitionsBuilders.fadeIn, page: OnBoardingRoute.page,  ),
    AutoRoute(page: WorkSessionRoute.page),
    AutoRoute(page: CreateProjectRoute.page,),
    AutoRoute(page: EditProfileRoute.page),
    AutoRoute(page: ChooseUsernameRoute.page),
    CustomRoute(transitionsBuilder: TransitionsBuilders.fadeIn, page: SessionCompleteRoute.page),
    CustomRoute(transitionsBuilder: TransitionsBuilders.fadeIn, page: PrivacyPolicyRoute.page),

  ];
}