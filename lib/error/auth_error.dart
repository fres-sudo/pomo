import 'package:flutter/cupertino.dart';

import '../i18n/strings.g.dart';
import 'generic_error.dart';
import 'localized.dart';

abstract class AuthError extends LocalizedError {
  static LocalizedError fromMessage(String? message) {
    return switch (message) {
      "email-already-in-use" => EmailAlreadyInUserError(),
      "username-already-in-use" => UsernameAlreadyInUseError(),
      "invalid-email" => UserNotExistError(),
      "wrong-password" => WrongPassword(),
      "error-login" => GeneralSignInError(),
      "error-signup" => GeneralSignUpError(),
      _ => GenericError()
    };
  }
}

class UsernameAlreadyInUseError extends AuthError {
  @override
  String localizedString(BuildContext context) {
    return context.t.errors.register.username_already_in_use;
  }
}

class EmailAlreadyInUserError extends AuthError {
  @override
  String localizedString(BuildContext context) {
    return context.t.errors.register.email_already_associated;
  }
}

class WrongPassword extends AuthError {
  @override
  String localizedString(BuildContext context) {
    return context.t.errors.login.wrong_password;
  }
}

class UserNotExistError extends AuthError {
  @override
  String localizedString(BuildContext context) {
    return context.t.errors.login.user_not_existing;
  }
}

class GeneralSignInError extends AuthError {
  @override
  String localizedString(BuildContext context) {
    return context.t.errors.login.general_error;
  }
}

class GeneralSignUpError extends AuthError {
  @override
  String localizedString(BuildContext context) {
    return context.t.errors.register.general_error;
  }
}
