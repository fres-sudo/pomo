part of 'stats_bloc.dart';

@freezed
class StatsEvent with _$StatsEvent {
  
  const factory StatsEvent.fetchStats({required String userId}) = FetchStatsStatsEvent;
  
}
