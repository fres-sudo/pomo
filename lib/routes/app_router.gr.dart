// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i22;
import 'package:flutter/material.dart' as _i23;
import 'package:image_picker/image_picker.dart' as _i25;
import 'package:pomo/models/project/project.dart' as _i26;
import 'package:pomo/models/task/task.dart' as _i27;
import 'package:pomo/models/user/user.dart' as _i24;
import 'package:pomo/pages/authentication/forgot_password/forgotpassword_otp_page.dart'
    as _i4;
import 'package:pomo/pages/authentication/forgot_password/forgotpassword_page.dart'
    as _i5;
import 'package:pomo/pages/authentication/forgot_password/forgotpassword_recover_page.dart'
    as _i6;
import 'package:pomo/pages/authentication/login_in/login_page.dart' as _i7;
import 'package:pomo/pages/authentication/sign_up/choose_username.dart' as _i1;
import 'package:pomo/pages/authentication/sign_up/signup_page.dart' as _i19;
import 'package:pomo/pages/profile/edit_profile_page.dart' as _i3;
import 'package:pomo/pages/profile/profile_navigation.dart' as _i10;
import 'package:pomo/pages/profile/profile_page.dart' as _i11;
import 'package:pomo/pages/profile/widget/privacy_policy_page.dart' as _i9;
import 'package:pomo/pages/projects/create_project_page.dart' as _i2;
import 'package:pomo/pages/projects/project_details_page.dart' as _i12;
import 'package:pomo/pages/projects/project_navigation.dart' as _i13;
import 'package:pomo/pages/projects/project_page.dart' as _i14;
import 'package:pomo/pages/projects/widget/session_complete.dart' as _i18;
import 'package:pomo/pages/projects/work_session_page.dart' as _i21;
import 'package:pomo/pages/quick_session/quick_session_page.dart' as _i15;
import 'package:pomo/pages/root_page.dart' as _i16;
import 'package:pomo/pages/schedule/schedule_page.dart' as _i17;
import 'package:pomo/pages/splash/onBoarding_page.dart' as _i8;
import 'package:pomo/pages/stats/stats_page.dart' as _i20;

/// generated route for
/// [_i1.ChooseUsernamePage]
class ChooseUsernameRoute extends _i22.PageRouteInfo<ChooseUsernameRouteArgs> {
  ChooseUsernameRoute({
    _i23.Key? key,
    required _i24.User user,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          ChooseUsernameRoute.name,
          args: ChooseUsernameRouteArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'ChooseUsernameRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChooseUsernameRouteArgs>();
      return _i1.ChooseUsernamePage(
        key: args.key,
        user: args.user,
      );
    },
  );
}

class ChooseUsernameRouteArgs {
  const ChooseUsernameRouteArgs({
    this.key,
    required this.user,
  });

  final _i23.Key? key;

  final _i24.User user;

  @override
  String toString() {
    return 'ChooseUsernameRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i2.CreateProjectPage]
class CreateProjectRoute extends _i22.PageRouteInfo<CreateProjectRouteArgs> {
  CreateProjectRoute({
    _i23.Key? key,
    DateTime? startDate,
    DateTime? endDate,
    String? name,
    String? description,
    _i25.XFile? image,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          CreateProjectRoute.name,
          args: CreateProjectRouteArgs(
            key: key,
            startDate: startDate,
            endDate: endDate,
            name: name,
            description: description,
            image: image,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateProjectRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateProjectRouteArgs>(
          orElse: () => const CreateProjectRouteArgs());
      return _i2.CreateProjectPage(
        key: args.key,
        startDate: args.startDate,
        endDate: args.endDate,
        name: args.name,
        description: args.description,
        image: args.image,
      );
    },
  );
}

class CreateProjectRouteArgs {
  const CreateProjectRouteArgs({
    this.key,
    this.startDate,
    this.endDate,
    this.name,
    this.description,
    this.image,
  });

  final _i23.Key? key;

  final DateTime? startDate;

  final DateTime? endDate;

  final String? name;

  final String? description;

  final _i25.XFile? image;

  @override
  String toString() {
    return 'CreateProjectRouteArgs{key: $key, startDate: $startDate, endDate: $endDate, name: $name, description: $description, image: $image}';
  }
}

/// generated route for
/// [_i3.EditProfilePage]
class EditProfileRoute extends _i22.PageRouteInfo<void> {
  const EditProfileRoute({List<_i22.PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      return const _i3.EditProfilePage();
    },
  );
}

/// generated route for
/// [_i4.ForgotPasswordOTPPage]
class ForgotPasswordOTPRoute
    extends _i22.PageRouteInfo<ForgotPasswordOTPRouteArgs> {
  ForgotPasswordOTPRoute({
    required String email,
    _i23.Key? key,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          ForgotPasswordOTPRoute.name,
          args: ForgotPasswordOTPRouteArgs(
            email: email,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordOTPRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ForgotPasswordOTPRouteArgs>();
      return _i4.ForgotPasswordOTPPage(
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

  final _i23.Key? key;

  @override
  String toString() {
    return 'ForgotPasswordOTPRouteArgs{email: $email, key: $key}';
  }
}

/// generated route for
/// [_i5.ForgotPasswordPage]
class ForgotPasswordRoute extends _i22.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i22.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      return const _i5.ForgotPasswordPage();
    },
  );
}

/// generated route for
/// [_i6.ForgotPasswordRecoverPage]
class ForgotPasswordRecoverRoute
    extends _i22.PageRouteInfo<ForgotPasswordRecoverRouteArgs> {
  ForgotPasswordRecoverRoute({
    _i23.Key? key,
    required String email,
    required String token,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          ForgotPasswordRecoverRoute.name,
          args: ForgotPasswordRecoverRouteArgs(
            key: key,
            email: email,
            token: token,
          ),
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRecoverRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ForgotPasswordRecoverRouteArgs>();
      return _i6.ForgotPasswordRecoverPage(
        key: args.key,
        email: args.email,
        token: args.token,
      );
    },
  );
}

class ForgotPasswordRecoverRouteArgs {
  const ForgotPasswordRecoverRouteArgs({
    this.key,
    required this.email,
    required this.token,
  });

  final _i23.Key? key;

  final String email;

  final String token;

  @override
  String toString() {
    return 'ForgotPasswordRecoverRouteArgs{key: $key, email: $email, token: $token}';
  }
}

/// generated route for
/// [_i7.LoginPage]
class LoginRoute extends _i22.PageRouteInfo<void> {
  const LoginRoute({List<_i22.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      return const _i7.LoginPage();
    },
  );
}

/// generated route for
/// [_i8.OnBoardingPage]
class OnBoardingRoute extends _i22.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i22.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      return const _i8.OnBoardingPage();
    },
  );
}

/// generated route for
/// [_i9.PrivacyPolicyPage]
class PrivacyPolicyRoute extends _i22.PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<_i22.PageRouteInfo>? children})
      : super(
          PrivacyPolicyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyPolicyRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      return const _i9.PrivacyPolicyPage();
    },
  );
}

/// generated route for
/// [_i10.ProfileNavigation]
class ProfileNavigation extends _i22.PageRouteInfo<void> {
  const ProfileNavigation({List<_i22.PageRouteInfo>? children})
      : super(
          ProfileNavigation.name,
          initialChildren: children,
        );

  static const String name = 'ProfileNavigation';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      return const _i10.ProfileNavigation();
    },
  );
}

/// generated route for
/// [_i11.ProfilePage]
class ProfileRoute extends _i22.PageRouteInfo<void> {
  const ProfileRoute({List<_i22.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      return const _i11.ProfilePage();
    },
  );
}

/// generated route for
/// [_i12.ProjectDetailsPage]
class ProjectDetailsRoute extends _i22.PageRouteInfo<ProjectDetailsRouteArgs> {
  ProjectDetailsRoute({
    _i23.Key? key,
    required _i26.Project project,
    bool isCreatedProject = false,
    List<_i22.PageRouteInfo>? children,
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

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProjectDetailsRouteArgs>();
      return _i22.WrappedRoute(
          child: _i12.ProjectDetailsPage(
        key: args.key,
        project: args.project,
        isCreatedProject: args.isCreatedProject,
      ));
    },
  );
}

class ProjectDetailsRouteArgs {
  const ProjectDetailsRouteArgs({
    this.key,
    required this.project,
    this.isCreatedProject = false,
  });

  final _i23.Key? key;

  final _i26.Project project;

  final bool isCreatedProject;

  @override
  String toString() {
    return 'ProjectDetailsRouteArgs{key: $key, project: $project, isCreatedProject: $isCreatedProject}';
  }
}

/// generated route for
/// [_i13.ProjectNavigation]
class ProjectNavigation extends _i22.PageRouteInfo<void> {
  const ProjectNavigation({List<_i22.PageRouteInfo>? children})
      : super(
          ProjectNavigation.name,
          initialChildren: children,
        );

  static const String name = 'ProjectNavigation';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      return const _i13.ProjectNavigation();
    },
  );
}

/// generated route for
/// [_i14.ProjectPage]
class ProjectRoute extends _i22.PageRouteInfo<void> {
  const ProjectRoute({List<_i22.PageRouteInfo>? children})
      : super(
          ProjectRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProjectRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      return const _i14.ProjectPage();
    },
  );
}

/// generated route for
/// [_i15.QuickSessionPage]
class QuickSessionRoute extends _i22.PageRouteInfo<void> {
  const QuickSessionRoute({List<_i22.PageRouteInfo>? children})
      : super(
          QuickSessionRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuickSessionRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      return const _i15.QuickSessionPage();
    },
  );
}

/// generated route for
/// [_i16.RootPage]
class RootRoute extends _i22.PageRouteInfo<void> {
  const RootRoute({List<_i22.PageRouteInfo>? children})
      : super(
          RootRoute.name,
          initialChildren: children,
        );

  static const String name = 'RootRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      return const _i16.RootPage();
    },
  );
}

/// generated route for
/// [_i17.SchedulePage]
class ScheduleRoute extends _i22.PageRouteInfo<void> {
  const ScheduleRoute({List<_i22.PageRouteInfo>? children})
      : super(
          ScheduleRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScheduleRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      return const _i17.SchedulePage();
    },
  );
}

/// generated route for
/// [_i18.SessionCompletePage]
class SessionCompleteRoute extends _i22.PageRouteInfo<void> {
  const SessionCompleteRoute({List<_i22.PageRouteInfo>? children})
      : super(
          SessionCompleteRoute.name,
          initialChildren: children,
        );

  static const String name = 'SessionCompleteRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      return const _i18.SessionCompletePage();
    },
  );
}

/// generated route for
/// [_i19.SignUpPage]
class SignUpRoute extends _i22.PageRouteInfo<void> {
  const SignUpRoute({List<_i22.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      return const _i19.SignUpPage();
    },
  );
}

/// generated route for
/// [_i20.StatsPage]
class StatsRoute extends _i22.PageRouteInfo<void> {
  const StatsRoute({List<_i22.PageRouteInfo>? children})
      : super(
          StatsRoute.name,
          initialChildren: children,
        );

  static const String name = 'StatsRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      return const _i20.StatsPage();
    },
  );
}

/// generated route for
/// [_i21.WorkSessionPage]
class WorkSessionRoute extends _i22.PageRouteInfo<WorkSessionRouteArgs> {
  WorkSessionRoute({
    _i23.Key? key,
    required _i27.Task task,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          WorkSessionRoute.name,
          args: WorkSessionRouteArgs(
            key: key,
            task: task,
          ),
          initialChildren: children,
        );

  static const String name = 'WorkSessionRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WorkSessionRouteArgs>();
      return _i21.WorkSessionPage(
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

  final _i23.Key? key;

  final _i27.Task task;

  @override
  String toString() {
    return 'WorkSessionRouteArgs{key: $key, task: $task}';
  }
}
