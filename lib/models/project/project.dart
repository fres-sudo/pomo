import 'package:freezed_annotation/freezed_annotation.dart';

import '../task/task.dart';
import '../user/user.dart';

part 'project.freezed.dart';

@freezed
class Project with _$Project {
  const Project._();

  const factory Project({
    required String id,
    required String name,
    required String description,
    required DateTime dueDate,
    required User owner,
    String? imageCover,
    List<Task>? tasks,
    List<User>? contributors,
}) = _Project;
}