part of 'stats_bloc.dart';

@freezed
class StatsState with _$StatsState {

  const factory StatsState.initial() = InitialStatsState;

  const factory StatsState.fetching() = FetchingStatsState;
  const factory StatsState.fetched(Stats statistics) = FetchedStatsState;
  const factory StatsState.error(LocalizedError error) = ErrorStatsState;

}
