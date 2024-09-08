part of 'schedule_cubit.dart';


@freezed
class ScheduleState with _$ScheduleState {
  const factory ScheduleState({
    @Default([]) List<Task> tasks,
    required DateTime focusedDay,
    required DateTime selectedDay,
    @Default(CalendarFormat.month) CalendarFormat calendarFormat,
  }) = _ScheduleState;

  factory ScheduleState.initial() {
    final now = DateTime.now();
    return ScheduleState(
      focusedDay: now,
      selectedDay: now,
    );
  }
}