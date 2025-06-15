import 'package:freezed_annotation/freezed_annotation.dart';

import '../../components/cards/project_card.dart';
import '../task/task.dart';
import '../user/user.dart';

part 'project.freezed.dart';

@freezed
sealed class Project with _$Project {
  const Project._() : super();

  const factory Project({
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
    List<Task>? tasks,
    List<User>? contributors,
    required ProjectStatus status,
  }) = _Project;

  static Project fake() => Project(
      name: "name",
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      userId: "",
      status: ProjectStatus.progress);
}
