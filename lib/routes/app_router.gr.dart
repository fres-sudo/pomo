// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i24;
import 'package:flutter/material.dart' as _i25;
import 'package:image_picker/image_picker.dart' as _i27;
import 'package:pomo/models/project/project.dart' as _i28;
import 'package:pomo/models/user/user.dart' as _i26;
import 'package:pomo/pages/authentication/auth_root_page.dart' as _i1;
import 'package:pomo/pages/authentication/email_login/email_login_page.dart'
    as _i5;
import 'package:pomo/pages/authentication/forgot_password/forgotpassword_otp_page.dart'
    as _i6;
import 'package:pomo/pages/authentication/forgot_password/forgotpassword_page.dart'
    as _i7;
import 'package:pomo/pages/authentication/forgot_password/forgotpassword_recover_page.dart'
    as _i8;
import 'package:pomo/pages/authentication/otp_verification/otp_verification_page.dart'
    as _i11;
import 'package:pomo/pages/authentication/sign_up/choose_username.dart' as _i2;
import 'package:pomo/pages/authentication/sign_up/signup_page.dart' as _i22;
import 'package:pomo/pages/home_page.dart' as _i9;
import 'package:pomo/pages/pomodoro_session/pomodoro_session_page.dart' as _i18;
import 'package:pomo/pages/profile/edit_profile_page.dart' as _i4;
import 'package:pomo/pages/profile/profile_navigation.dart' as _i13;
import 'package:pomo/pages/profile/profile_page.dart' as _i14;
import 'package:pomo/pages/profile/widget/privacy_policy_page.dart' as _i12;
import 'package:pomo/pages/projects/create_project_page.dart' as _i3;
import 'package:pomo/pages/projects/project_details_page.dart' as _i15;
import 'package:pomo/pages/projects/project_navigation.dart' as _i16;
import 'package:pomo/pages/projects/project_page.dart' as _i17;
import 'package:pomo/pages/projects/widget/session_complete.dart' as _i21;
import 'package:pomo/pages/root_page.dart' as _i19;
import 'package:pomo/pages/schedule/schedule_page.dart' as _i20;
import 'package:pomo/pages/splash/onBoarding_page.dart' as _i10;
import 'package:pomo/pages/stats/stats_page.dart' as _i23;

/// generated route for
/// [_i1.AuthRootPage]
class AuthRootRoute extends _i24.PageRouteInfo<void> {
  const AuthRootRoute({List<_i24.PageRouteInfo>? children})
      : super(AuthRootRoute.name, initialChildren: children);

  static const String name = 'AuthRootRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthRootPage();
    },
  );
}

/// generated route for
/// [_i2.ChooseUsernamePage]
class ChooseUsernameRoute extends _i24.PageRouteInfo<ChooseUsernameRouteArgs> {
  ChooseUsernameRoute({
    _i25.Key? key,
    required _i26.User user,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          ChooseUsernameRoute.name,
          args: ChooseUsernameRouteArgs(key: key, user: user),
          initialChildren: children,
        );

  static const String name = 'ChooseUsernameRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChooseUsernameRouteArgs>();
      return _i2.ChooseUsernamePage(key: args.key, user: args.user);
    },
  );
}

class ChooseUsernameRouteArgs {
  const ChooseUsernameRouteArgs({this.key, required this.user});

  final _i25.Key? key;

  final _i26.User user;

  @override
  String toString() {
    return 'ChooseUsernameRouteArgs{key: $key, user: $user}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ChooseUsernameRouteArgs) return false;
    return key == other.key && user == other.user;
  }

  @override
  int get hashCode => key.hashCode ^ user.hashCode;
}

/// generated route for
/// [_i3.CreateProjectPage]
class CreateProjectRoute extends _i24.PageRouteInfo<CreateProjectRouteArgs> {
  CreateProjectRoute({
    _i25.Key? key,
    DateTime? startDate,
    DateTime? endDate,
    String? name,
    String? description,
    _i27.XFile? image,
    List<_i24.PageRouteInfo>? children,
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

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateProjectRouteArgs>(
        orElse: () => const CreateProjectRouteArgs(),
      );
      return _i3.CreateProjectPage(
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

  final _i25.Key? key;

  final DateTime? startDate;

  final DateTime? endDate;

  final String? name;

  final String? description;

  final _i27.XFile? image;

  @override
  String toString() {
    return 'CreateProjectRouteArgs{key: $key, startDate: $startDate, endDate: $endDate, name: $name, description: $description, image: $image}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CreateProjectRouteArgs) return false;
    return key == other.key &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        name == other.name &&
        description == other.description &&
        image == other.image;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      startDate.hashCode ^
      endDate.hashCode ^
      name.hashCode ^
      description.hashCode ^
      image.hashCode;
}

/// generated route for
/// [_i4.EditProfilePage]
class EditProfileRoute extends _i24.PageRouteInfo<void> {
  const EditProfileRoute({List<_i24.PageRouteInfo>? children})
      : super(EditProfileRoute.name, initialChildren: children);

  static const String name = 'EditProfileRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i4.EditProfilePage();
    },
  );
}

/// generated route for
/// [_i5.EmailLoginPage]
class EmailLoginRoute extends _i24.PageRouteInfo<void> {
  const EmailLoginRoute({List<_i24.PageRouteInfo>? children})
      : super(EmailLoginRoute.name, initialChildren: children);

  static const String name = 'EmailLoginRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i5.EmailLoginPage();
    },
  );
}

/// generated route for
/// [_i6.ForgotPasswordOTPPage]
class ForgotPasswordOTPRoute
    extends _i24.PageRouteInfo<ForgotPasswordOTPRouteArgs> {
  ForgotPasswordOTPRoute({
    required String email,
    _i25.Key? key,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          ForgotPasswordOTPRoute.name,
          args: ForgotPasswordOTPRouteArgs(email: email, key: key),
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordOTPRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ForgotPasswordOTPRouteArgs>();
      return _i6.ForgotPasswordOTPPage(email: args.email, key: args.key);
    },
  );
}

class ForgotPasswordOTPRouteArgs {
  const ForgotPasswordOTPRouteArgs({required this.email, this.key});

  final String email;

  final _i25.Key? key;

  @override
  String toString() {
    return 'ForgotPasswordOTPRouteArgs{email: $email, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ForgotPasswordOTPRouteArgs) return false;
    return email == other.email && key == other.key;
  }

  @override
  int get hashCode => email.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i7.ForgotPasswordPage]
class ForgotPasswordRoute extends _i24.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i24.PageRouteInfo>? children})
      : super(ForgotPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgotPasswordRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i7.ForgotPasswordPage();
    },
  );
}

/// generated route for
/// [_i8.ForgotPasswordRecoverPage]
class ForgotPasswordRecoverRoute
    extends _i24.PageRouteInfo<ForgotPasswordRecoverRouteArgs> {
  ForgotPasswordRecoverRoute({
    _i25.Key? key,
    required String email,
    required String token,
    List<_i24.PageRouteInfo>? children,
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

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ForgotPasswordRecoverRouteArgs>();
      return _i8.ForgotPasswordRecoverPage(
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

  final _i25.Key? key;

  final String email;

  final String token;

  @override
  String toString() {
    return 'ForgotPasswordRecoverRouteArgs{key: $key, email: $email, token: $token}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ForgotPasswordRecoverRouteArgs) return false;
    return key == other.key && email == other.email && token == other.token;
  }

  @override
  int get hashCode => key.hashCode ^ email.hashCode ^ token.hashCode;
}

/// generated route for
/// [_i9.HomePage]
class HomeRoute extends _i24.PageRouteInfo<void> {
  const HomeRoute({List<_i24.PageRouteInfo>? children})
      : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i9.HomePage();
    },
  );
}

/// generated route for
/// [_i10.OnBoardingPage]
class OnBoardingRoute extends _i24.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i24.PageRouteInfo>? children})
      : super(OnBoardingRoute.name, initialChildren: children);

  static const String name = 'OnBoardingRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i10.OnBoardingPage();
    },
  );
}

/// generated route for
/// [_i11.OtpVerificationPage]
class OtpVerificationRoute
    extends _i24.PageRouteInfo<OtpVerificationRouteArgs> {
  OtpVerificationRoute({
    required String email,
    _i25.Key? key,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          OtpVerificationRoute.name,
          args: OtpVerificationRouteArgs(email: email, key: key),
          initialChildren: children,
        );

  static const String name = 'OtpVerificationRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpVerificationRouteArgs>();
      return _i11.OtpVerificationPage(email: args.email, key: args.key);
    },
  );
}

class OtpVerificationRouteArgs {
  const OtpVerificationRouteArgs({required this.email, this.key});

  final String email;

  final _i25.Key? key;

  @override
  String toString() {
    return 'OtpVerificationRouteArgs{email: $email, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OtpVerificationRouteArgs) return false;
    return email == other.email && key == other.key;
  }

  @override
  int get hashCode => email.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i12.PrivacyPolicyPage]
class PrivacyPolicyRoute extends _i24.PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<_i24.PageRouteInfo>? children})
      : super(PrivacyPolicyRoute.name, initialChildren: children);

  static const String name = 'PrivacyPolicyRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i12.PrivacyPolicyPage();
    },
  );
}

/// generated route for
/// [_i13.ProfileNavigation]
class ProfileNavigation extends _i24.PageRouteInfo<void> {
  const ProfileNavigation({List<_i24.PageRouteInfo>? children})
      : super(ProfileNavigation.name, initialChildren: children);

  static const String name = 'ProfileNavigation';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i13.ProfileNavigation();
    },
  );
}

/// generated route for
/// [_i14.ProfilePage]
class ProfileRoute extends _i24.PageRouteInfo<void> {
  const ProfileRoute({List<_i24.PageRouteInfo>? children})
      : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i14.ProfilePage();
    },
  );
}

/// generated route for
/// [_i15.ProjectDetailsPage]
class ProjectDetailsRoute extends _i24.PageRouteInfo<ProjectDetailsRouteArgs> {
  ProjectDetailsRoute({
    _i25.Key? key,
    required _i28.Project project,
    bool isCreatedProject = false,
    List<_i24.PageRouteInfo>? children,
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

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProjectDetailsRouteArgs>();
      return _i24.WrappedRoute(
        child: _i15.ProjectDetailsPage(
          key: args.key,
          project: args.project,
          isCreatedProject: args.isCreatedProject,
        ),
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

  final _i25.Key? key;

  final _i28.Project project;

  final bool isCreatedProject;

  @override
  String toString() {
    return 'ProjectDetailsRouteArgs{key: $key, project: $project, isCreatedProject: $isCreatedProject}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProjectDetailsRouteArgs) return false;
    return key == other.key &&
        project == other.project &&
        isCreatedProject == other.isCreatedProject;
  }

  @override
  int get hashCode =>
      key.hashCode ^ project.hashCode ^ isCreatedProject.hashCode;
}

/// generated route for
/// [_i16.ProjectNavigation]
class ProjectNavigation extends _i24.PageRouteInfo<void> {
  const ProjectNavigation({List<_i24.PageRouteInfo>? children})
      : super(ProjectNavigation.name, initialChildren: children);

  static const String name = 'ProjectNavigation';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i16.ProjectNavigation();
    },
  );
}

/// generated route for
/// [_i17.ProjectPage]
class ProjectRoute extends _i24.PageRouteInfo<void> {
  const ProjectRoute({List<_i24.PageRouteInfo>? children})
      : super(ProjectRoute.name, initialChildren: children);

  static const String name = 'ProjectRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i17.ProjectPage();
    },
  );
}

/// generated route for
/// [_i18.QuickSessionPage]
class QuickSessionRoute extends _i24.PageRouteInfo<void> {
  const QuickSessionRoute({List<_i24.PageRouteInfo>? children})
      : super(QuickSessionRoute.name, initialChildren: children);

  static const String name = 'QuickSessionRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i18.QuickSessionPage();
    },
  );
}

/// generated route for
/// [_i19.RootPage]
class RootRoute extends _i24.PageRouteInfo<void> {
  const RootRoute({List<_i24.PageRouteInfo>? children})
      : super(RootRoute.name, initialChildren: children);

  static const String name = 'RootRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i19.RootPage();
    },
  );
}

/// generated route for
/// [_i20.SchedulePage]
class ScheduleRoute extends _i24.PageRouteInfo<void> {
  const ScheduleRoute({List<_i24.PageRouteInfo>? children})
      : super(ScheduleRoute.name, initialChildren: children);

  static const String name = 'ScheduleRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i20.SchedulePage();
    },
  );
}

/// generated route for
/// [_i21.SessionCompletePage]
class SessionCompleteRoute extends _i24.PageRouteInfo<void> {
  const SessionCompleteRoute({List<_i24.PageRouteInfo>? children})
      : super(SessionCompleteRoute.name, initialChildren: children);

  static const String name = 'SessionCompleteRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i21.SessionCompletePage();
    },
  );
}

/// generated route for
/// [_i22.SignUpPage]
class SignUpRoute extends _i24.PageRouteInfo<void> {
  const SignUpRoute({List<_i24.PageRouteInfo>? children})
      : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i22.SignUpPage();
    },
  );
}

/// generated route for
/// [_i23.StatsPage]
class StatsRoute extends _i24.PageRouteInfo<void> {
  const StatsRoute({List<_i24.PageRouteInfo>? children})
      : super(StatsRoute.name, initialChildren: children);

  static const String name = 'StatsRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i23.StatsPage();
    },
  );
}
