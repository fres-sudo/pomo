part of 'stats_bloc.dart';

@freezed
class StatsState with _$StatsState {
  const factory StatsState({
    Stats? statistics,
    LocalizedError? error,
    @Default(false) isLoading,
  }) = _StatsState;

  const StatsState._();
}
