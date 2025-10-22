part of 'stats_bloc.dart';

@freezed
sealed class StatsEvent with _$StatsEvent {
  const factory StatsEvent.fetchStats() = FetchStatsStatsEvent;
}
