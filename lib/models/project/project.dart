import 'package:freezed_annotation/freezed_annotation.dart';

import '../task/task.dart';
import '../user/user.dart';

part 'project.freezed.dart';

@freezed
class Project with _$Project {
  const Project._();

  const factory Project({
    String? id,
    required String name,
    String? description,
    required DateTime dueDate,
    required String owner,
    String? imageCover,
    List<Task>? tasks,
    List<User>? contributors,
}) = _Project;
}