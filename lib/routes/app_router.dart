import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';
import 'guard/auth_guard.dart';
import 'guard/onBoarding_guard.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(initial: true, page: RootRoute.page, guards: [
          OnBoardingGuard(),
          AuthGuard()
        ], children: [
          AutoRoute(
              page: ProjectNavigation.page,
              fullscreenDialog: true,
              children: [
                AutoRoute(
                    page: ProjectRoute.page,
                    initial: true,
                    fullscreenDialog: true),
              ]),
          AutoRoute(page: StatsRoute.page),
          AutoRoute(page: QuickSessionRoute.page),
          AutoRoute(page: ScheduleRoute.page),
          AutoRoute(page: ProfileRoute.page),
        ]),
        AutoRoute(
          page: LoginRoute.page,
          fullscreenDialog: true,
        ),
        AutoRoute(page: SignUpRoute.page, fullscreenDialog: true),
        AutoRoute(
          page: ForgotPasswordOTPRoute.page,
        ),
        AutoRoute(
          page: ForgotPasswordRoute.page,
        ),
        AutoRoute(
          page: ForgotPasswordRecoverRoute.page,
        ),
        AutoRoute(
          page: OnBoardingRoute.page,
        ),
        AutoRoute(
          page: CreateProjectRoute.page,
        ),
        AutoRoute(page: EditProfileRoute.page),
        AutoRoute(page: ChooseUsernameRoute.page),
        AutoRoute(page: SessionCompleteRoute.page),
        AutoRoute(page: PrivacyPolicyRoute.page),
        AutoRoute(page: ProjectDetailsRoute.page)
      ];
}
