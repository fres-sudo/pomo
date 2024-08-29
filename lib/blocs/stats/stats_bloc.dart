import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pomo/error/stats_error.dart';
import 'dart:async';

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
  StatsBloc({ required this.statsRepository}) : super(const StatsState()) {
    on<FetchStatsStatsEvent>(_onFetchStats);
    
  }
  
  /// Method used to add the [FetchStatsStatsEvent] event
  void fetchStats({required String userId}) => add(StatsEvent.fetchStats(userId: userId));
  
  
  FutureOr<void> _onFetchStats(
    FetchStatsStatsEvent event,
    Emitter<StatsState> emit,
  ) async {
    emit(const StatsState(isLoading: true));
    try{
      final stats = await statsRepository.fetchStats(userId: event.userId);
      emit(StatsState(statistics: stats, isLoading: false));
    }catch(_) {
      emit(StatsState(error: FetchingStatsError(), isLoading: false));
    }
  }
  
}
