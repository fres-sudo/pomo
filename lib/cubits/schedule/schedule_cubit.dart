import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../models/task/task.dart';

part 'schedule_cubit.freezed.dart';

part 'schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit() : super(ScheduleState.initial());

  void onDaySelected({required DateTime selectedDay, required DateTime focusedDay, required VoidCallback onFetch, required VoidCallback onNoFetch}) {
    final bool isSameMonth = selectedDay.month == state.selectedDay.month;
    if (!isSameDay(state.selectedDay, selectedDay)) {
      emit(state.copyWith(
        selectedDay: selectedDay,
        focusedDay: focusedDay,
      ));
    }
    isSameMonth ? onNoFetch() : onFetch();
 }

  void changeCalendarFormat({required CalendarFormat format}) => emit(state.copyWith(calendarFormat: format));

  void setSelectedTasks({required List<Task> tasks}) => emit(state.copyWith(tasks: tasks));
}
