import 'package:pine/pine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pomo/services/network/jto/task/task_jto.dart';
import 'package:pomo/services/network/jto/user/user_jto.dart';

import '../../../../models/task/task.dart';
import '../../../../models/user/user.dart';

part 'project_request.g.dart';

part 'project_request.freezed.dart';

@freezed
class ProjectRequest extends DTO with _$ProjectRequest {
  const factory ProjectRequest({
    required String id,
    required String name,
    required String description,
    required DateTime dueDate,
    required UserJTO owner,
    String? imageCover,
    List<TaskJTO>? tasks,
    List<UserJTO>? contributors,
}) = _ProjectRequest;

  factory ProjectRequest.fromJson(Map<String, dynamic> json) =>
    _$ProjectRequestFromJson(json);
}
