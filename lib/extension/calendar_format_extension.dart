import 'package:table_calendar/table_calendar.dart';

extension CalendarFormatExtension on CalendarFormat {
  bool requiresFetch(CalendarFormat newFormat) {
    // Define the "broader" direction: week < twoWeeks < month
    return index < newFormat.index;
  }
}