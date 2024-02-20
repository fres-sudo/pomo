import 'package:freezed_annotation/freezed_annotation.dart';

import '../project/project.dart';
import '../user/user.dart';

part 'task.freezed.dart';

@freezed
class Task with _$Task {
  const Task._();

  const factory Task({
    required String id,
    required String name,
    required int pomodoro,
    required bool completed,
    required User user,
    Project? referenceProject,

}) = _Task;
}