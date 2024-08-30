import 'package:pine/pine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../user/user_jto.dart';


part 'task_jto.g.dart';

part 'task_jto.freezed.dart';

@freezed
class TaskJTO extends DTO with _$TaskJTO {
  const factory TaskJTO({
    String? id,
    required String name,
    String? description,
    required int pomodoro,
    int? pomodoroCompleted,
    required String userId,
    required DateTime dueDate,
    required DateTime createdAt,
    DateTime? completedAt,
}) = _TaskJTO;

  factory TaskJTO.fromJson(Map<String, dynamic> json) =>
    _$TaskJTOFromJson(json);
}
