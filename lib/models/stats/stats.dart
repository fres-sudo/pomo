import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats.freezed.dart';

@freezed
class Stats with _$Stats {
  const Stats._();

  const factory Stats({
    required int totalTasksToday,
    required int totalTasksYesterday,
    required int totalTasksAll,
    required List<int> completedTasksOfTheWeek,
    required List<int> uncompletedTasksOfTheWeek,
    required double completionPercentage,
}) = _Stats;

  static Stats fake() => const Stats(totalTasksToday: 0, totalTasksYesterday: 0, totalTasksAll: 1, completedTasksOfTheWeek: [0,0,0,0,0,0,0], uncompletedTasksOfTheWeek: [0,0,0,0,0,0,0], completionPercentage: 0);
}