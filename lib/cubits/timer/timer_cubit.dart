import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:async';

part 'timer_state.dart';

part 'timer_cubit.freezed.dart';

/// The TimerCubit
class TimerCubit extends Cubit<TimerState> {

  /// Create a new instance of [TimerCubit].
  TimerCubit() : super(const TimerState.defaultMode());

   int _focusTime = 25;
   int _breakTime = 5;

  get focusTime => _focusTime;
  get breakTime => _breakTime;
  
  /// Method used to perform the [setFocus] action
  FutureOr<void> setFocus(int minutes) {
    if (minutes > 0 && minutes <= 60) {
      emit(TimerState.setFocus(minutes));
      _focusTime = minutes;
    } else {
      emit(const TimerState.defaultMode());
    }
  }
  /// Method used to perform the [setBreak] action
  FutureOr<void> setBreak(int minutes) {
    if (minutes > 0 && minutes <= 60) {
      emit(TimerState.setBreak(minutes));
      _breakTime = minutes;
    } else {
      emit(const TimerState.defaultMode());
    }
  }

  void resetAll() => emit(const TimerState.defaultMode());


  
}
