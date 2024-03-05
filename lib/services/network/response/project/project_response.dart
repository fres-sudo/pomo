import 'package:pine/pine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../jto/task/task_jto.dart';
import '../../jto/user/user_jto.dart';

part 'project_response.g.dart';

part 'project_response.freezed.dart';

@freezed
class ProjectResponse extends DTO with _$ProjectResponse {
  const factory ProjectResponse({
    required String id,
    required String name,
    required String description,
    required DateTime dueDate,
    required UserJTO owner,
    String? imageCover,
    List<TaskJTO>? tasks,
    List<UserJTO>? contributors,
}) = _ProjectResponse;

  factory ProjectResponse.fromJson(Map<String, dynamic> json) =>
    _$ProjectResponseFromJson(json);
}
