extension DateComparison on DateTime {
  /// Checks if this date is before the day of another date.
  bool isBeforeDay(DateTime other) {
    // Compare the dates ignoring the time component.
    final currentDate = DateTime(year, month, day);
    final otherDate = DateTime(other.year, other.month, other.day);

    return currentDate.isBefore(otherDate);
  }
}