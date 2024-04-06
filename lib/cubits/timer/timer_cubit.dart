import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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

  final storage = const FlutterSecureStorage();

  Future<void> getStoredValues() async {
    final storedFocusTime = await storage.read(key: 'focusTime');
    final storedBreakTime = await storage.read(key: 'breakTime');

    if (storedFocusTime != null) {
      _focusTime = int.parse(storedFocusTime);
    }

    if (storedBreakTime != null) {
      _breakTime = int.parse(storedBreakTime);
    }
  }

  /// Method used to perform the [setFocus] action
  FutureOr<void> setFocus(int minutes) async {
    if (minutes > 0 && minutes <= 60) {
      emit(TimerState.setFocus(minutes));
      _focusTime = minutes;
      await storage.write(key: 'focusTime', value: minutes.toString());
    } else {
      emit(const TimerState.defaultMode());
    }
  }
  /// Method used to perform the [setBreak] action
  FutureOr<void> setBreak(int minutes) async {
    if (minutes > 0 && minutes <= 60) {
      emit(TimerState.setBreak(minutes));
      _breakTime = minutes;
      await storage.write(key: 'breakTime', value: minutes.toString());
    } else {
      emit(const TimerState.defaultMode());
    }
  }

  FutureOr<void> resetAll() async {
    await storage.write(key: 'focusTime', value: "25");
    await storage.write(key: 'breakTime', value: "5");
    _focusTime = 25;
    _breakTime = 5;
    emit(const TimerState.defaultMode());
  }
}
