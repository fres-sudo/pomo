// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i20;
import 'package:flutter/material.dart' as _i21;
import 'package:pomo/models/project/project.dart' as _i22;
import 'package:pomo/models/task/task.dart' as _i23;
import 'package:pomo/pages/authentication/forgot_password/forgotpassword_otp_page.dart'
    as _i3;
import 'package:pomo/pages/authentication/forgot_password/forgotpassword_page.dart'
    as _i4;
import 'package:pomo/pages/authentication/forgot_password/forgotpassword_recover_page.dart'
    as _i5;
import 'package:pomo/pages/authentication/login_in/login_page.dart' as _i6;
import 'package:pomo/pages/authentication/sign_up/signup_page.dart' as _i17;
import 'package:pomo/pages/profile/edit_profile_page.dart' as _i2;
import 'package:pomo/pages/profile/profile_navigation.dart' as _i9;
import 'package:pomo/pages/profile/profile_page.dart' as _i10;
import 'package:pomo/pages/profile/widget/privacy_policy_page.dart' as _i8;
import 'package:pomo/pages/projects/create_project_page.dart' as _i1;
import 'package:pomo/pages/projects/project_details_page.dart' as _i11;
import 'package:pomo/pages/projects/project_navigation.dart' as _i12;
import 'package:pomo/pages/projects/project_page.dart' as _i13;
import 'package:pomo/pages/projects/widget/session_complete.dart' as _i16;
import 'package:pomo/pages/projects/work_session_page.dart' as _i19;
import 'package:pomo/pages/quick_session/quick_session_page.dart' as _i14;
import 'package:pomo/pages/root_page.dart' as _i15;
import 'package:pomo/pages/splash/onBoarding_page.dart' as _i7;
import 'package:pomo/pages/stats/stats_page.dart' as _i18;

/// generated route for
/// [_i1.CreateProjectPage]
class CreateProjectRoute extends _i20.PageRouteInfo<void> {
  const CreateProjectRoute({List<_i20.PageRouteInfo>? children})
      : super(
          CreateProjectRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateProjectRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i1.CreateProjectPage();
    },
  );
}

/// generated route for
/// [_i2.EditProfilePage]
class EditProfileRoute extends _i20.PageRouteInfo<void> {
  const EditProfileRoute({List<_i20.PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i2.EditProfilePage();
    },
  );
}

/// generated route for
/// [_i3.ForgotPasswordOTPPage]
class ForgotPasswordOTPRoute
    extends _i20.PageRouteInfo<ForgotPasswordOTPRouteArgs> {
  ForgotPasswordOTPRoute({
    required String email,
    _i21.Key? key,
    List<_i20.PageRouteInfo>? children,
  }) : super(
          ForgotPasswordOTPRoute.name,
          args: ForgotPasswordOTPRouteArgs(
            email: email,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordOTPRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ForgotPasswordOTPRouteArgs>();
      return _i3.ForgotPasswordOTPPage(
        email: args.email,
        key: args.key,
      );
    },
  );
}

class ForgotPasswordOTPRouteArgs {
  const ForgotPasswordOTPRouteArgs({
    required this.email,
    this.key,
  });

  final String email;

  final _i21.Key? key;

  @override
  String toString() {
    return 'ForgotPasswordOTPRouteArgs{email: $email, key: $key}';
  }
}

/// generated route for
/// [_i4.ForgotPasswordPage]
class ForgotPasswordRoute extends _i20.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i20.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i4.ForgotPasswordPage();
    },
  );
}

/// generated route for
/// [_i5.ForgotPasswordRecoverPage]
class ForgotPasswordRecoverRoute extends _i20.PageRouteInfo<void> {
  const ForgotPasswordRecoverRoute({List<_i20.PageRouteInfo>? children})
      : super(
          ForgotPasswordRecoverRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRecoverRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i5.ForgotPasswordRecoverPage();
    },
  );
}

/// generated route for
/// [_i6.LoginPage]
class LoginRoute extends _i20.PageRouteInfo<void> {
  const LoginRoute({List<_i20.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i6.LoginPage();
    },
  );
}

/// generated route for
/// [_i7.OnBoardingPage]
class OnBoardingRoute extends _i20.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i20.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i7.OnBoardingPage();
    },
  );
}

/// generated route for
/// [_i8.PrivacyPolicyPage]
class PrivacyPolicyRoute extends _i20.PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<_i20.PageRouteInfo>? children})
      : super(
          PrivacyPolicyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyPolicyRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i8.PrivacyPolicyPage();
    },
  );
}

/// generated route for
/// [_i9.ProfileNavigation]
class ProfileNavigation extends _i20.PageRouteInfo<void> {
  const ProfileNavigation({List<_i20.PageRouteInfo>? children})
      : super(
          ProfileNavigation.name,
          initialChildren: children,
        );

  static const String name = 'ProfileNavigation';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i9.ProfileNavigation();
    },
  );
}

/// generated route for
/// [_i10.ProfilePage]
class ProfileRoute extends _i20.PageRouteInfo<void> {
  const ProfileRoute({List<_i20.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i10.ProfilePage();
    },
  );
}

/// generated route for
/// [_i11.ProjectDetailsPage]
class ProjectDetailsRoute extends _i20.PageRouteInfo<ProjectDetailsRouteArgs> {
  ProjectDetailsRoute({
    _i21.Key? key,
    required _i22.Project project,
    bool isCreatedProject = false,
    List<_i20.PageRouteInfo>? children,
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

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProjectDetailsRouteArgs>();
      return _i11.ProjectDetailsPage(
        key: args.key,
        project: args.project,
        isCreatedProject: args.isCreatedProject,
      );
    },
  );
}

class ProjectDetailsRouteArgs {
  const ProjectDetailsRouteArgs({
    this.key,
    required this.project,
    this.isCreatedProject = false,
  });

  final _i21.Key? key;

  final _i22.Project project;

  final bool isCreatedProject;

  @override
  String toString() {
    return 'ProjectDetailsRouteArgs{key: $key, project: $project, isCreatedProject: $isCreatedProject}';
  }
}

/// generated route for
/// [_i12.ProjectNavigation]
class ProjectNavigation extends _i20.PageRouteInfo<void> {
  const ProjectNavigation({List<_i20.PageRouteInfo>? children})
      : super(
          ProjectNavigation.name,
          initialChildren: children,
        );

  static const String name = 'ProjectNavigation';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i12.ProjectNavigation();
    },
  );
}

/// generated route for
/// [_i13.ProjectPage]
class ProjectRoute extends _i20.PageRouteInfo<void> {
  const ProjectRoute({List<_i20.PageRouteInfo>? children})
      : super(
          ProjectRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProjectRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i13.ProjectPage();
    },
  );
}

/// generated route for
/// [_i14.QuickSessionPage]
class QuickSessionRoute extends _i20.PageRouteInfo<void> {
  const QuickSessionRoute({List<_i20.PageRouteInfo>? children})
      : super(
          QuickSessionRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuickSessionRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i14.QuickSessionPage();
    },
  );
}

/// generated route for
/// [_i15.RootPage]
class RootRoute extends _i20.PageRouteInfo<void> {
  const RootRoute({List<_i20.PageRouteInfo>? children})
      : super(
          RootRoute.name,
          initialChildren: children,
        );

  static const String name = 'RootRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i15.RootPage();
    },
  );
}

/// generated route for
/// [_i16.SessionCompletePage]
class SessionCompleteRoute extends _i20.PageRouteInfo<void> {
  const SessionCompleteRoute({List<_i20.PageRouteInfo>? children})
      : super(
          SessionCompleteRoute.name,
          initialChildren: children,
        );

  static const String name = 'SessionCompleteRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i16.SessionCompletePage();
    },
  );
}

/// generated route for
/// [_i17.SignUpPage]
class SignUpRoute extends _i20.PageRouteInfo<void> {
  const SignUpRoute({List<_i20.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i17.SignUpPage();
    },
  );
}

/// generated route for
/// [_i18.StatsPage]
class StatsRoute extends _i20.PageRouteInfo<void> {
  const StatsRoute({List<_i20.PageRouteInfo>? children})
      : super(
          StatsRoute.name,
          initialChildren: children,
        );

  static const String name = 'StatsRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i18.StatsPage();
    },
  );
}

/// generated route for
/// [_i19.WorkSessionPage]
class WorkSessionRoute extends _i20.PageRouteInfo<WorkSessionRouteArgs> {
  WorkSessionRoute({
    _i21.Key? key,
    required _i23.Task task,
    List<_i20.PageRouteInfo>? children,
  }) : super(
          WorkSessionRoute.name,
          args: WorkSessionRouteArgs(
            key: key,
            task: task,
          ),
          initialChildren: children,
        );

  static const String name = 'WorkSessionRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WorkSessionRouteArgs>();
      return _i19.WorkSessionPage(
        key: args.key,
        task: args.task,
      );
    },
  );
}

class WorkSessionRouteArgs {
  const WorkSessionRouteArgs({
    this.key,
    required this.task,
  });

  final _i21.Key? key;

  final _i23.Task task;

  @override
  String toString() {
    return 'WorkSessionRouteArgs{key: $key, task: $task}';
  }
}
