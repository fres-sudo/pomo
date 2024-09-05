import 'package:flutter/cupertino.dart';

import '../i18n/strings.g.dart';
import 'generic_error.dart';
import 'localized.dart';

abstract class UserError extends LocalizedError {
  static LocalizedError fromMessage(String? message) {
    return GenericError();
  }
}

class UpdatingUserError extends UserError {
  @override
  String localizedString(BuildContext context) {
    return context.t.errors.users.updating_user;
  }
}

class DeletingUserError extends UserError {
  @override
  String localizedString(BuildContext context) {
    return context.t.errors.users.deleting_user;
  }
}

class UpdatingUserImageError extends UserError {
  @override
  String localizedString(BuildContext context) {
    return context.t.errors.users.updating_user_photo;
  }
}