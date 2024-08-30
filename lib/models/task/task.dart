import 'package:freezed_annotation/freezed_annotation.dart';

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
    required String userId,
    required DateTime dueDate,
    required DateTime createdAt,
    DateTime? completedAt,
}) = _Task;
}