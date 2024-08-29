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
}