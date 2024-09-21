import 'package:flutter/material.dart';

import '../i18n/strings.g.dart';
import 'localized.dart';

class GenericError extends LocalizedError {
  @override
  String localizedString(BuildContext context) {
    return context.t.errors.general_error;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is GenericError && runtimeType == other.runtimeType;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ErrorProcessing extends LocalizedError {
  @override
  String localizedString(BuildContext context) {
    return context.t.errors.error_processing;
  }

}
