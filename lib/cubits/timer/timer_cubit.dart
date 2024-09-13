import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'timer_state.dart';

part 'timer_cubit.freezed.dart';

/// The TimerCubit
class TimerCubit extends HydratedCubit<TimerState> {

  /// Create a new instance of [TimerCubit].
  TimerCubit() : super(const TimerState(focusTime: 25, breakTime: 5));

  /// Method used to perform the [setTimer] action
  FutureOr<void> setTimer(int focusTime, int breakTime) {
    emit(TimerState(focusTime: focusTime, breakTime: breakTime));
  }

  FutureOr<void> resetAll() {
    emit(const TimerState(focusTime: 25, breakTime: 5));
  }

  @override
  TimerState? fromJson(Map<String, dynamic> json) {
      return TimerState(
        focusTime: json['focusTime'] as int,
        breakTime: json['breakTime'] as int,
      );
  }

  @override
  Map<String, dynamic>? toJson(TimerState state) {
      return {
        'focusTime': state.focusTime,
        'breakTime': state.breakTime,
    };
  }
}
