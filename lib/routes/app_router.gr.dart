// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:flutter/material.dart' as _i18;
import 'package:pomo/models/project/project.dart' as _i19;
import 'package:pomo/models/task/task.dart' as _i20;
import 'package:pomo/pages/authentication/forgot_password/forgotpassword_otp_page.dart'
    as _i2;
import 'package:pomo/pages/authentication/forgot_password/forgotpassword_page.dart'
    as _i3;
import 'package:pomo/pages/authentication/forgot_password/forgotpassword_recover_page.dart'
    as _i4;
import 'package:pomo/pages/authentication/login_in/login_page.dart' as _i5;
import 'package:pomo/pages/authentication/sign_up/signup_page.dart' as _i14;
import 'package:pomo/pages/profile/profile_page.dart' as _i7;
import 'package:pomo/pages/projects/create_project_page.dart' as _i1;
import 'package:pomo/pages/projects/project_details_page.dart' as _i8;
import 'package:pomo/pages/projects/project_navigation.dart' as _i9;
import 'package:pomo/pages/projects/project_page.dart' as _i10;
import 'package:pomo/pages/projects/widget/session_complete.dart' as _i13;
import 'package:pomo/pages/projects/work_session_page.dart' as _i16;
import 'package:pomo/pages/quick_session/quick_session_page.dart' as _i11;
import 'package:pomo/pages/root_page.dart' as _i12;
import 'package:pomo/pages/splash/onBoarding_page.dart' as _i6;
import 'package:pomo/pages/stats/stats_page.dart' as _i15;

abstract class $AppRouter extends _i17.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    CreateProjectRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CreateProjectPage(),
      );
    },
    ForgotPasswordOTPRoute.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordOTPRouteArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ForgotPasswordOTPPage(
          email: args.email,
          key: args.key,
        ),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ForgotPasswordPage(),
      );
    },
    ForgotPasswordRecoverRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ForgotPasswordRecoverPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LoginPage(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.OnBoardingPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ProfilePage(),
      );
    },
    ProjectDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ProjectDetailsRouteArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.ProjectDetailsPage(
          key: args.key,
          project: args.project,
        ),
      );
    },
    ProjectNavigation.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ProjectNavigation(),
      );
    },
    ProjectRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.ProjectPage(),
      );
    },
    QuickSessionRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.QuickSessionPage(),
      );
    },
    RootRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.RootPage(),
      );
    },
    SessionCompleteRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.SessionCompletePage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.SignUpPage(),
      );
    },
    StatsRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.StatsPage(),
      );
    },
    WorkSessionRoute.name: (routeData) {
      final args = routeData.argsAs<WorkSessionRouteArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.WorkSessionPage(
          key: args.key,
          task: args.task,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.CreateProjectPage]
class CreateProjectRoute extends _i17.PageRouteInfo<void> {
  const CreateProjectRoute({List<_i17.PageRouteInfo>? children})
      : super(
          CreateProjectRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateProjectRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ForgotPasswordOTPPage]
class ForgotPasswordOTPRoute
    extends _i17.PageRouteInfo<ForgotPasswordOTPRouteArgs> {
  ForgotPasswordOTPRoute({
    required String email,
    _i18.Key? key,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          ForgotPasswordOTPRoute.name,
          args: ForgotPasswordOTPRouteArgs(
            email: email,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordOTPRoute';

  static const _i17.PageInfo<ForgotPasswordOTPRouteArgs> page =
      _i17.PageInfo<ForgotPasswordOTPRouteArgs>(name);
}

class ForgotPasswordOTPRouteArgs {
  const ForgotPasswordOTPRouteArgs({
    required this.email,
    this.key,
  });

  final String email;

  final _i18.Key? key;

  @override
  String toString() {
    return 'ForgotPasswordOTPRouteArgs{email: $email, key: $key}';
  }
}

/// generated route for
/// [_i3.ForgotPasswordPage]
class ForgotPasswordRoute extends _i17.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i17.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ForgotPasswordRecoverPage]
class ForgotPasswordRecoverRoute extends _i17.PageRouteInfo<void> {
  const ForgotPasswordRecoverRoute({List<_i17.PageRouteInfo>? children})
      : super(
          ForgotPasswordRecoverRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRecoverRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoginPage]
class LoginRoute extends _i17.PageRouteInfo<void> {
  const LoginRoute({List<_i17.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i6.OnBoardingPage]
class OnBoardingRoute extends _i17.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i17.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ProfilePage]
class ProfileRoute extends _i17.PageRouteInfo<void> {
  const ProfileRoute({List<_i17.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ProjectDetailsPage]
class ProjectDetailsRoute extends _i17.PageRouteInfo<ProjectDetailsRouteArgs> {
  ProjectDetailsRoute({
    _i18.Key? key,
    required _i19.Project project,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          ProjectDetailsRoute.name,
          args: ProjectDetailsRouteArgs(
            key: key,
            project: project,
          ),
          initialChildren: children,
        );

  static const String name = 'ProjectDetailsRoute';

  static const _i17.PageInfo<ProjectDetailsRouteArgs> page =
      _i17.PageInfo<ProjectDetailsRouteArgs>(name);
}

class ProjectDetailsRouteArgs {
  const ProjectDetailsRouteArgs({
    this.key,
    required this.project,
  });

  final _i18.Key? key;

  final _i19.Project project;

  @override
  String toString() {
    return 'ProjectDetailsRouteArgs{key: $key, project: $project}';
  }
}

/// generated route for
/// [_i9.ProjectNavigation]
class ProjectNavigation extends _i17.PageRouteInfo<void> {
  const ProjectNavigation({List<_i17.PageRouteInfo>? children})
      : super(
          ProjectNavigation.name,
          initialChildren: children,
        );

  static const String name = 'ProjectNavigation';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ProjectPage]
class ProjectRoute extends _i17.PageRouteInfo<void> {
  const ProjectRoute({List<_i17.PageRouteInfo>? children})
      : super(
          ProjectRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProjectRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i11.QuickSessionPage]
class QuickSessionRoute extends _i17.PageRouteInfo<void> {
  const QuickSessionRoute({List<_i17.PageRouteInfo>? children})
      : super(
          QuickSessionRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuickSessionRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i12.RootPage]
class RootRoute extends _i17.PageRouteInfo<void> {
  const RootRoute({List<_i17.PageRouteInfo>? children})
      : super(
          RootRoute.name,
          initialChildren: children,
        );

  static const String name = 'RootRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i13.SessionCompletePage]
class SessionCompleteRoute extends _i17.PageRouteInfo<void> {
  const SessionCompleteRoute({List<_i17.PageRouteInfo>? children})
      : super(
          SessionCompleteRoute.name,
          initialChildren: children,
        );

  static const String name = 'SessionCompleteRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i14.SignUpPage]
class SignUpRoute extends _i17.PageRouteInfo<void> {
  const SignUpRoute({List<_i17.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i15.StatsPage]
class StatsRoute extends _i17.PageRouteInfo<void> {
  const StatsRoute({List<_i17.PageRouteInfo>? children})
      : super(
          StatsRoute.name,
          initialChildren: children,
        );

  static const String name = 'StatsRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i16.WorkSessionPage]
class WorkSessionRoute extends _i17.PageRouteInfo<WorkSessionRouteArgs> {
  WorkSessionRoute({
    _i18.Key? key,
    required _i20.Task task,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          WorkSessionRoute.name,
          args: WorkSessionRouteArgs(
            key: key,
            task: task,
          ),
          initialChildren: children,
        );

  static const String name = 'WorkSessionRoute';

  static const _i17.PageInfo<WorkSessionRouteArgs> page =
      _i17.PageInfo<WorkSessionRouteArgs>(name);
}

class WorkSessionRouteArgs {
  const WorkSessionRouteArgs({
    this.key,
    required this.task,
  });

  final _i18.Key? key;

  final _i20.Task task;

  @override
  String toString() {
    return 'WorkSessionRouteArgs{key: $key, task: $task}';
  }
}
