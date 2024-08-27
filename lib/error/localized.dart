import 'package:flutter/material.dart';

/// Genetic error class able to localize and translate messages to the users.
abstract class LocalizedError extends Error implements Localized {}

abstract class Localized {
  String localizedString(BuildContext context);
}


