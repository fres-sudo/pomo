import 'package:pine/pine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../project/project_jto.dart';
import '../user/user_jto.dart';

part 'task_jto.g.dart';

part 'task_jto.freezed.dart';

@freezed
class TaskJTO extends DTO with _$TaskJTO {
  const factory TaskJTO({
    required String id,
    required String name,
    required int pomodoro,
    required bool completed,
    required UserJTO user,
    ProjectJTO? referenceProject,
}) = _TaskJTO;

  factory TaskJTO.fromJson(Map<String, dynamic> json) =>
    _$TaskJTOFromJson(json);
}
