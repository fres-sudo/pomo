import 'package:flutter/cupertino.dart';
import 'package:pomo/constants/constants.dart';

import '../i18n/strings.g.dart';
import 'generic_error.dart';
import 'localized.dart';

abstract class AuthError extends LocalizedError {
  static LocalizedError fromMessage(String? message) {
    logger.i(message);
    return switch (message) {
      "email-already-in-use" => EmailAlreadyInUserError(),
      "username-already-in-use" => UsernameAlreadyInUseError(),
      "invalid-email" => UserNotExistError(),
      "wrong-password" => WrongPassword(),
      "error-login" => GeneralSignInError(),
      "error-signup" => GeneralSignUpError(),
      "email-not-verified" => EmailNotVerifiedError(),
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

class EmailNotVerifiedError extends AuthError {
  @override
  String localizedString(BuildContext context) {
    return context.t.errors.login.email_not_verified;
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

class ForgotPasswordError extends AuthError {

  final String message;

  ForgotPasswordError(this.message);

  @override
  String localizedString(BuildContext context){
   return switch(message){
     "email-error" => t.errors.forgot_password.forgot_password_email_error,
     _ => t.errors.error_processing
   };
  }
}

class VerifyTokenError extends AuthError {
  final String message;

  VerifyTokenError(this.message);

  @override
  String localizedString(BuildContext context) {
    return switch(message){
        "invalid-or-expired-token" => t.errors.forgot_password.verify_token_invalid_error,
        _ => t.errors.forgot_password.verify_token_error
    };
  }
}

class ResetPasswordError extends AuthError{

  final String message;

  ResetPasswordError(this.message);

  @override
  String localizedString(BuildContext context) {
    return switch(message){
      "password-donot-match" => t.errors.forgot_password.reset_password_not_match_error,
      _ => t.errors.forgot_password.reset_password_error
    };
  }
}
