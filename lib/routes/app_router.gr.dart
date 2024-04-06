// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:flutter/material.dart' as _i20;
import 'package:pomo/models/project/project.dart' as _i21;
import 'package:pomo/models/task/task.dart' as _i22;
import 'package:pomo/pages/authentication/forgot_password/forgotpassword_otp_page.dart'
    as _i3;
import 'package:pomo/pages/authentication/forgot_password/forgotpassword_page.dart'
    as _i4;
import 'package:pomo/pages/authentication/forgot_password/forgotpassword_recover_page.dart'
    as _i5;
import 'package:pomo/pages/authentication/login_in/login_page.dart' as _i6;
import 'package:pomo/pages/authentication/sign_up/signup_page.dart' as _i16;
import 'package:pomo/pages/profile/edit_profile_page.dart' as _i2;
import 'package:pomo/pages/profile/profile_navigation.dart' as _i8;
import 'package:pomo/pages/profile/profile_page.dart' as _i9;
import 'package:pomo/pages/projects/create_project_page.dart' as _i1;
import 'package:pomo/pages/projects/project_details_page.dart' as _i10;
import 'package:pomo/pages/projects/project_navigation.dart' as _i11;
import 'package:pomo/pages/projects/project_page.dart' as _i12;
import 'package:pomo/pages/projects/widget/session_complete.dart' as _i15;
import 'package:pomo/pages/projects/work_session_page.dart' as _i18;
import 'package:pomo/pages/quick_session/quick_session_page.dart' as _i13;
import 'package:pomo/pages/root_page.dart' as _i14;
import 'package:pomo/pages/splash/onBoarding_page.dart' as _i7;
import 'package:pomo/pages/stats/stats_page.dart' as _i17;

abstract class $AppRouter extends _i19.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i19.PageFactory> pagesMap = {
    CreateProjectRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CreateProjectPage(),
      );
    },
    EditProfileRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.EditProfilePage(),
      );
    },
    ForgotPasswordOTPRoute.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordOTPRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ForgotPasswordOTPPage(
          email: args.email,
          key: args.key,
          otp: args.otp,
        ),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ForgotPasswordPage(),
      );
    },
    ForgotPasswordRecoverRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ForgotPasswordRecoverPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.LoginPage(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.OnBoardingPage(),
      );
    },
    ProfileNavigation.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ProfileNavigation(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ProfilePage(),
      );
    },
    ProjectDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ProjectDetailsRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.ProjectDetailsPage(
          key: args.key,
          project: args.project,
          isCreatedProject: args.isCreatedProject,
        ),
      );
    },
    ProjectNavigation.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ProjectNavigation(),
      );
    },
    ProjectRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.ProjectPage(),
      );
    },
    QuickSessionRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.QuickSessionPage(),
      );
    },
    RootRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.RootPage(),
      );
    },
    SessionCompleteRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.SessionCompletePage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.SignUpPage(),
      );
    },
    StatsRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.StatsPage(),
      );
    },
    WorkSessionRoute.name: (routeData) {
      final args = routeData.argsAs<WorkSessionRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.WorkSessionPage(
          key: args.key,
          task: args.task,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.CreateProjectPage]
class CreateProjectRoute extends _i19.PageRouteInfo<void> {
  const CreateProjectRoute({List<_i19.PageRouteInfo>? children})
      : super(
          CreateProjectRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateProjectRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i2.EditProfilePage]
class EditProfileRoute extends _i19.PageRouteInfo<void> {
  const EditProfileRoute({List<_i19.PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ForgotPasswordOTPPage]
class ForgotPasswordOTPRoute
    extends _i19.PageRouteInfo<ForgotPasswordOTPRouteArgs> {
  ForgotPasswordOTPRoute({
    required String email,
    _i20.Key? key,
    required String otp,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          ForgotPasswordOTPRoute.name,
          args: ForgotPasswordOTPRouteArgs(
            email: email,
            key: key,
            otp: otp,
          ),
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordOTPRoute';

  static const _i19.PageInfo<ForgotPasswordOTPRouteArgs> page =
      _i19.PageInfo<ForgotPasswordOTPRouteArgs>(name);
}

class ForgotPasswordOTPRouteArgs {
  const ForgotPasswordOTPRouteArgs({
    required this.email,
    this.key,
    required this.otp,
  });

  final String email;

  final _i20.Key? key;

  final String otp;

  @override
  String toString() {
    return 'ForgotPasswordOTPRouteArgs{email: $email, key: $key, otp: $otp}';
  }
}

/// generated route for
/// [_i4.ForgotPasswordPage]
class ForgotPasswordRoute extends _i19.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ForgotPasswordRecoverPage]
class ForgotPasswordRecoverRoute extends _i19.PageRouteInfo<void> {
  const ForgotPasswordRecoverRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ForgotPasswordRecoverRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRecoverRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i6.LoginPage]
class LoginRoute extends _i19.PageRouteInfo<void> {
  const LoginRoute({List<_i19.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i7.OnBoardingPage]
class OnBoardingRoute extends _i19.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i19.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ProfileNavigation]
class ProfileNavigation extends _i19.PageRouteInfo<void> {
  const ProfileNavigation({List<_i19.PageRouteInfo>? children})
      : super(
          ProfileNavigation.name,
          initialChildren: children,
        );

  static const String name = 'ProfileNavigation';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ProfilePage]
class ProfileRoute extends _i19.PageRouteInfo<void> {
  const ProfileRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ProjectDetailsPage]
class ProjectDetailsRoute extends _i19.PageRouteInfo<ProjectDetailsRouteArgs> {
  ProjectDetailsRoute({
    _i20.Key? key,
    required _i21.Project project,
    bool isCreatedProject = false,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          ProjectDetailsRoute.name,
          args: ProjectDetailsRouteArgs(
            key: key,
            project: project,
            isCreatedProject: isCreatedProject,
          ),
          initialChildren: children,
        );

  static const String name = 'ProjectDetailsRoute';

  static const _i19.PageInfo<ProjectDetailsRouteArgs> page =
      _i19.PageInfo<ProjectDetailsRouteArgs>(name);
}

class ProjectDetailsRouteArgs {
  const ProjectDetailsRouteArgs({
    this.key,
    required this.project,
    this.isCreatedProject = false,
  });

  final _i20.Key? key;

  final _i21.Project project;

  final bool isCreatedProject;

  @override
  String toString() {
    return 'ProjectDetailsRouteArgs{key: $key, project: $project, isCreatedProject: $isCreatedProject}';
  }
}

/// generated route for
/// [_i11.ProjectNavigation]
class ProjectNavigation extends _i19.PageRouteInfo<void> {
  const ProjectNavigation({List<_i19.PageRouteInfo>? children})
      : super(
          ProjectNavigation.name,
          initialChildren: children,
        );

  static const String name = 'ProjectNavigation';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i12.ProjectPage]
class ProjectRoute extends _i19.PageRouteInfo<void> {
  const ProjectRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ProjectRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProjectRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i13.QuickSessionPage]
class QuickSessionRoute extends _i19.PageRouteInfo<void> {
  const QuickSessionRoute({List<_i19.PageRouteInfo>? children})
      : super(
          QuickSessionRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuickSessionRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i14.RootPage]
class RootRoute extends _i19.PageRouteInfo<void> {
  const RootRoute({List<_i19.PageRouteInfo>? children})
      : super(
          RootRoute.name,
          initialChildren: children,
        );

  static const String name = 'RootRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i15.SessionCompletePage]
class SessionCompleteRoute extends _i19.PageRouteInfo<void> {
  const SessionCompleteRoute({List<_i19.PageRouteInfo>? children})
      : super(
          SessionCompleteRoute.name,
          initialChildren: children,
        );

  static const String name = 'SessionCompleteRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i16.SignUpPage]
class SignUpRoute extends _i19.PageRouteInfo<void> {
  const SignUpRoute({List<_i19.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i17.StatsPage]
class StatsRoute extends _i19.PageRouteInfo<void> {
  const StatsRoute({List<_i19.PageRouteInfo>? children})
      : super(
          StatsRoute.name,
          initialChildren: children,
        );

  static const String name = 'StatsRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i18.WorkSessionPage]
class WorkSessionRoute extends _i19.PageRouteInfo<WorkSessionRouteArgs> {
  WorkSessionRoute({
    _i20.Key? key,
    required _i22.Task task,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          WorkSessionRoute.name,
          args: WorkSessionRouteArgs(
            key: key,
            task: task,
          ),
          initialChildren: children,
        );

  static const String name = 'WorkSessionRoute';

  static const _i19.PageInfo<WorkSessionRouteArgs> page =
      _i19.PageInfo<WorkSessionRouteArgs>(name);
}

class WorkSessionRouteArgs {
  const WorkSessionRouteArgs({
    this.key,
    required this.task,
  });

  final _i20.Key? key;

  final _i22.Task task;

  @override
  String toString() {
    return 'WorkSessionRouteArgs{key: $key, task: $task}';
  }
}
