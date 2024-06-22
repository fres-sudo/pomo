part of 'timer_cubit.dart';

@freezed
class TimerState with _$TimerState {

  const factory TimerState({
    @Default(25) int focusTime,
    @Default(5) int breakTime,
  }) = _TimerState;

}
