import 'package:pine/pine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats_jto.g.dart';

part 'stats_jto.freezed.dart';

@freezed
class StatsJTO extends DTO with _$StatsJTO {
  const factory StatsJTO({
    required int totalTasksToday,
    required int totalTasksYesterday,
    required int totalTasksAll,
    required List<int> completedTasksOfTheWeek,
    required List<int> uncompletedTasksOfTheWeek,
    required double completionPercentage,
}) = _StatsJTO;

  factory StatsJTO.fromJson(Map<String, dynamic> json) =>
    _$StatsJTOFromJson(json);
}
