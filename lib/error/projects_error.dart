import 'package:flutter/cupertino.dart';

import '../i18n/strings.g.dart';
import 'generic_error.dart';
import 'localized.dart';

abstract class ProjectsError extends LocalizedError {
  static LocalizedError fromMessage(String? message) {
    return GenericError();
  }
}

class FetchingProjectsError extends ProjectsError {
  @override
  String localizedString(BuildContext context) {
    return context.t.errors.projects.fetching_project;
  }
}

class CreatingProjectsError extends ProjectsError {
  @override
  String localizedString(BuildContext context) {
    return context.t.errors.projects.creating_project;
  }
}

class UpdatingProjectsError extends ProjectsError {
  @override
  String localizedString(BuildContext context) {
    return context.t.errors.projects.updating_project;
  }
}

class DeletingProjectsError extends ProjectsError {
  @override
  String localizedString(BuildContext context) {
    return context.t.errors.projects.deleting_project;
  }
}
