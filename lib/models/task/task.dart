import 'package:freezed_annotation/freezed_annotation.dart';

import '../project/project.dart';
import '../user/user.dart';

part 'task.freezed.dart';

@freezed
class Task with _$Task {
  const Task._();

  const factory Task({
    String? id,
    required String name,
    String? description,
    required int pomodoro,
    int? pomodoroCompleted,
    required bool completed,
    required String user,
    String? referenceProject,
    required DateTime createdAt,
    DateTime? completedAt,
}) = _Task;
}