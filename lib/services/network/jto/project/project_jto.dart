import 'package:pine/pine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../task/task_jto.dart';
import '../user/user_jto.dart';

part 'project_jto.g.dart';

part 'project_jto.freezed.dart';

@freezed
class ProjectJTO extends DTO with _$ProjectJTO {
  const factory ProjectJTO({
    String? id,
    required String name,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    required DateTime startDate,
    required DateTime endDate,
    DateTime? completedAt,
    required String userId,
    String? imageCover,
    List<TaskJTO>? tasks,
    List<UserJTO>? contributors,
}) = _ProjectJTO;

  factory ProjectJTO.fromJson(Map<String, dynamic> json) =>
    _$ProjectJTOFromJson(json);
}
