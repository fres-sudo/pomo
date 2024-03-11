// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i18;
import 'package:flutter/material.dart' as _i19;
import 'package:pomo/models/project/project.dart' as _i20;
import 'package:pomo/models/task/task.dart' as _i21;
import 'package:pomo/pages/authentication/forgot_password/forgotpassword_otp_page.dart'
    as _i3;
import 'package:pomo/pages/authentication/forgot_password/forgotpassword_page.dart'
    as _i4;
import 'package:pomo/pages/authentication/forgot_password/forgotpassword_recover_page.dart'
    as _i5;
import 'package:pomo/pages/authentication/login_in/login_page.dart' as _i6;
import 'package:pomo/pages/authentication/sign_up/signup_page.dart' as _i15;
import 'package:pomo/pages/error_page.dart' as _i2;
import 'package:pomo/pages/profile/profile_page.dart' as _i8;
import 'package:pomo/pages/projects/create_project_page.dart' as _i1;
import 'package:pomo/pages/projects/project_details_page.dart' as _i9;
import 'package:pomo/pages/projects/project_navigation.dart' as _i10;
import 'package:pomo/pages/projects/project_page.dart' as _i11;
import 'package:pomo/pages/projects/widget/session_complete.dart' as _i14;
import 'package:pomo/pages/projects/work_session_page.dart' as _i17;
import 'package:pomo/pages/quick_session/quick_session_page.dart' as _i12;
import 'package:pomo/pages/root_page.dart' as _i13;
import 'package:pomo/pages/splash/onBoarding_page.dart' as _i7;
import 'package:pomo/pages/stats/stats_page.dart' as _i16;

abstract class $AppRouter extends _i18.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i18.PageFactory> pagesMap = {
    CreateProjectRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CreateProjectPage(),
      );
    },
    ErrorRoute.name: (routeData) {
      final args = routeData.argsAs<ErrorRouteArgs>();
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ErrorPage(
          key: args.key,
          title: args.title,
          description: args.description,
          image: args.image,
        ),
      );
    },
    ForgotPasswordOTPRoute.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordOTPRouteArgs>();
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ForgotPasswordOTPPage(
          email: args.email,
          key: args.key,
        ),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ForgotPasswordPage(),
      );
    },
    ForgotPasswordRecoverRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ForgotPasswordRecoverPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.LoginPage(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.OnBoardingPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ProfilePage(),
      );
    },
    ProjectDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ProjectDetailsRouteArgs>();
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.WrappedRoute(
            child: _i9.ProjectDetailsPage(
          key: args.key,
          project: args.project,
        )),
      );
    },
    ProjectNavigation.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.ProjectNavigation(),
      );
    },
    ProjectRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.WrappedRoute(child: const _i11.ProjectPage()),
      );
    },
    QuickSessionRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.QuickSessionPage(),
      );
    },
    RootRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.RootPage(),
      );
    },
    SessionCompleteRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.SessionCompletePage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.SignUpPage(),
      );
    },
    StatsRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.StatsPage(),
      );
    },
    WorkSessionRoute.name: (routeData) {
      final args = routeData.argsAs<WorkSessionRouteArgs>();
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.WorkSessionPage(
          key: args.key,
          task: args.task,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.CreateProjectPage]
class CreateProjectRoute extends _i18.PageRouteInfo<void> {
  const CreateProjectRoute({List<_i18.PageRouteInfo>? children})
      : super(
          CreateProjectRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateProjectRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ErrorPage]
class ErrorRoute extends _i18.PageRouteInfo<ErrorRouteArgs> {
  ErrorRoute({
    _i19.Key? key,
    required String title,
    required String description,
    required String image,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          ErrorRoute.name,
          args: ErrorRouteArgs(
            key: key,
            title: title,
            description: description,
            image: image,
          ),
          initialChildren: children,
        );

  static const String name = 'ErrorRoute';

  static const _i18.PageInfo<ErrorRouteArgs> page =
      _i18.PageInfo<ErrorRouteArgs>(name);
}

class ErrorRouteArgs {
  const ErrorRouteArgs({
    this.key,
    required this.title,
    required this.description,
    required this.image,
  });

  final _i19.Key? key;

  final String title;

  final String description;

  final String image;

  @override
  String toString() {
    return 'ErrorRouteArgs{key: $key, title: $title, description: $description, image: $image}';
  }
}

/// generated route for
/// [_i3.ForgotPasswordOTPPage]
class ForgotPasswordOTPRoute
    extends _i18.PageRouteInfo<ForgotPasswordOTPRouteArgs> {
  ForgotPasswordOTPRoute({
    required String email,
    _i19.Key? key,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          ForgotPasswordOTPRoute.name,
          args: ForgotPasswordOTPRouteArgs(
            email: email,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordOTPRoute';

  static const _i18.PageInfo<ForgotPasswordOTPRouteArgs> page =
      _i18.PageInfo<ForgotPasswordOTPRouteArgs>(name);
}

class ForgotPasswordOTPRouteArgs {
  const ForgotPasswordOTPRouteArgs({
    required this.email,
    this.key,
  });

  final String email;

  final _i19.Key? key;

  @override
  String toString() {
    return 'ForgotPasswordOTPRouteArgs{email: $email, key: $key}';
  }
}

/// generated route for
/// [_i4.ForgotPasswordPage]
class ForgotPasswordRoute extends _i18.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i18.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ForgotPasswordRecoverPage]
class ForgotPasswordRecoverRoute extends _i18.PageRouteInfo<void> {
  const ForgotPasswordRecoverRoute({List<_i18.PageRouteInfo>? children})
      : super(
          ForgotPasswordRecoverRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRecoverRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i6.LoginPage]
class LoginRoute extends _i18.PageRouteInfo<void> {
  const LoginRoute({List<_i18.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i7.OnBoardingPage]
class OnBoardingRoute extends _i18.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i18.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ProfilePage]
class ProfileRoute extends _i18.PageRouteInfo<void> {
  const ProfileRoute({List<_i18.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ProjectDetailsPage]
class ProjectDetailsRoute extends _i18.PageRouteInfo<ProjectDetailsRouteArgs> {
  ProjectDetailsRoute({
    _i19.Key? key,
    required _i20.Project project,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          ProjectDetailsRoute.name,
          args: ProjectDetailsRouteArgs(
            key: key,
            project: project,
          ),
          initialChildren: children,
        );

  static const String name = 'ProjectDetailsRoute';

  static const _i18.PageInfo<ProjectDetailsRouteArgs> page =
      _i18.PageInfo<ProjectDetailsRouteArgs>(name);
}

class ProjectDetailsRouteArgs {
  const ProjectDetailsRouteArgs({
    this.key,
    required this.project,
  });

  final _i19.Key? key;

  final _i20.Project project;

  @override
  String toString() {
    return 'ProjectDetailsRouteArgs{key: $key, project: $project}';
  }
}

/// generated route for
/// [_i10.ProjectNavigation]
class ProjectNavigation extends _i18.PageRouteInfo<void> {
  const ProjectNavigation({List<_i18.PageRouteInfo>? children})
      : super(
          ProjectNavigation.name,
          initialChildren: children,
        );

  static const String name = 'ProjectNavigation';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ProjectPage]
class ProjectRoute extends _i18.PageRouteInfo<void> {
  const ProjectRoute({List<_i18.PageRouteInfo>? children})
      : super(
          ProjectRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProjectRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i12.QuickSessionPage]
class QuickSessionRoute extends _i18.PageRouteInfo<void> {
  const QuickSessionRoute({List<_i18.PageRouteInfo>? children})
      : super(
          QuickSessionRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuickSessionRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i13.RootPage]
class RootRoute extends _i18.PageRouteInfo<void> {
  const RootRoute({List<_i18.PageRouteInfo>? children})
      : super(
          RootRoute.name,
          initialChildren: children,
        );

  static const String name = 'RootRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i14.SessionCompletePage]
class SessionCompleteRoute extends _i18.PageRouteInfo<void> {
  const SessionCompleteRoute({List<_i18.PageRouteInfo>? children})
      : super(
          SessionCompleteRoute.name,
          initialChildren: children,
        );

  static const String name = 'SessionCompleteRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i15.SignUpPage]
class SignUpRoute extends _i18.PageRouteInfo<void> {
  const SignUpRoute({List<_i18.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i16.StatsPage]
class StatsRoute extends _i18.PageRouteInfo<void> {
  const StatsRoute({List<_i18.PageRouteInfo>? children})
      : super(
          StatsRoute.name,
          initialChildren: children,
        );

  static const String name = 'StatsRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i17.WorkSessionPage]
class WorkSessionRoute extends _i18.PageRouteInfo<WorkSessionRouteArgs> {
  WorkSessionRoute({
    _i19.Key? key,
    required _i21.Task task,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          WorkSessionRoute.name,
          args: WorkSessionRouteArgs(
            key: key,
            task: task,
          ),
          initialChildren: children,
        );

  static const String name = 'WorkSessionRoute';

  static const _i18.PageInfo<WorkSessionRouteArgs> page =
      _i18.PageInfo<WorkSessionRouteArgs>(name);
}

class WorkSessionRouteArgs {
  const WorkSessionRouteArgs({
    this.key,
    required this.task,
  });

  final _i19.Key? key;

  final _i21.Task task;

  @override
  String toString() {
    return 'WorkSessionRouteArgs{key: $key, task: $task}';
  }
}
