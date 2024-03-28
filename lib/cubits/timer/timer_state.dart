part of 'timer_cubit.dart';

@freezed
class TimerState with _$TimerState {
  
  const factory TimerState.setFocus(int minutes) = SetFocusTimerState;

  const factory TimerState.setBreak(int minutes) = SetBreakTimerState;

  const factory TimerState.defaultMode() = DefualtModeTimerState;

}
