import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

kCalendarStyle(BuildContext context) => CalendarStyle(
      defaultDecoration: BoxDecoration(borderRadius: BorderRadius.circular(10), shape: BoxShape.rectangle),
      weekendDecoration: BoxDecoration(borderRadius: BorderRadius.circular(10), shape: BoxShape.rectangle),
      outsideDaysVisible: false,
      selectedDecoration: BoxDecoration(
          color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(10), shape: BoxShape.rectangle),
      isTodayHighlighted: true,
      todayTextStyle: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.onSurface),
      todayDecoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).primaryColor.withValues(alpha: 0.8),
          ),
          borderRadius: BorderRadius.circular(10),
          shape: BoxShape.rectangle),
    );
