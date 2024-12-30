import 'package:freezed_annotation/freezed_annotation.dart';



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
    String? projectId,
    required DateTime dueDate,
    required DateTime createdAt,
    DateTime? updatedAt,
    required bool highPriority,
    DateTime? completedAt,
}) = _Task;

  int compareTo(Task other) {
    // First, compare by highPriority (highPriority tasks first)
    if (highPriority != other.highPriority) {
      return other.highPriority ? 1 : -1; // High priority (true) tasks come first
    }
    // If highPriority is the same, sort by dueDate in ascending order
    return dueDate.compareTo(other.dueDate);
  }
}