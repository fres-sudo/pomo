import 'package:flutter/cupertino.dart';

import '../i18n/strings.g.dart';
import 'generic_error.dart';
import 'localized.dart';

abstract class TasksError extends LocalizedError {
  static LocalizedError fromMessage(String? message) {
    return GenericError();
  }
}

class FetchingTasksByProjectError extends TasksError {
  @override
  String localizedString(BuildContext context) {
    return context.t.errors.tasks.fetching_task;
  }
}

class CreatingTasksError extends TasksError {
  @override
  String localizedString(BuildContext context) {
    return context.t.errors.tasks.creating_task;
  }
}

class UpdatingTasksError extends TasksError {
  @override
  String localizedString(BuildContext context) {
    return context.t.errors.tasks.updating_task;
  }
}

class DeletingTasksError extends TasksError {
  @override
  String localizedString(BuildContext context) {
    return context.t.errors.tasks.deleting_task;
  }
}
