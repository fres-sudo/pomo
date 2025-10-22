import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pomo/error/stats_error.dart';
import 'dart:async';

import '../../constants/constants.dart';
import '../../error/localized.dart';
import '../../models/stats/stats.dart';
import '../../repositories/stats_repository.dart';

part 'stats_event.dart';

part 'stats_state.dart';

part 'stats_bloc.freezed.dart';

/// The StatsBloc
class StatsBloc extends Bloc<StatsEvent, StatsState> {
  final StatsRepository statsRepository;

  /// Create a new instance of [StatsBloc].
  StatsBloc({required this.statsRepository}) : super(StatsState.initial()) {
    on<FetchStatsStatsEvent>(_onFetchStats);
  }

  /// Method used to add the [FetchStatsStatsEvent] event
  void fetchStats() => add(StatsEvent.fetchStats());

  FutureOr<void> _onFetchStats(
    FetchStatsStatsEvent event,
    Emitter<StatsState> emit,
  ) async {
    emit(StatsState.fetching());
    try {
      final stats = await statsRepository.fetchStats();
      emit(StatsState.fetched(stats));
    } catch (e, stack) {
      logger.e("_onFetchStats", error: e, stackTrace: stack);
      emit(StatsState.error(FetchingStatsError()));
    }
  }
}
