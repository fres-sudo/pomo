import '../../../models/task/task.dart';

class StatsBrain {
  final List<Task> completedTasks;
  final List<bool> selectedMode;

  late final double focusTime;
  late final double breakTime;
  late final int allTasks;

  StatsBrain({required this.completedTasks, required this.selectedMode});

  double getFocusTimeToday() {
    // Get today's start date
    DateTime today = DateTime.now();

    // Get the list of completed tasks for today
    List<Task> completedToday = completedTasks.where((task) =>
    task.completed &&
        task.createdAt.isAfter(today.subtract(const Duration(days: 1)))).toList();

    // Calculate the total focus time
    double totalFocusTime = completedToday.length * 25 / 60; // Convert from minutes to hours
    return totalFocusTime.roundToDouble();
  }

  double getBreakTimeToday() {
    // Get today's start date
    DateTime today = DateTime.now();

    // Get the list of completed tasks for today
    List<Task> completedToday = completedTasks.where((task) =>
    task.completed &&
        task.createdAt.isAfter(today.subtract(const Duration(days: 1)))).toList();

    // Calculate the total break time
    double totalBreakTime = completedToday.length * 5 / 60; // Convert from minutes to hours
    return totalBreakTime.roundToDouble();
  }

  int getAllTasksToday() {
    // Get today's start date
    DateTime today = DateTime.now();

    // Get the list of completed tasks for today
    List<Task> completedToday = completedTasks.where((task) =>
    task.completed &&
        task.createdAt.isAfter(today.subtract(const Duration(days: 1)))).toList();

    // Total number of completed tasks
    int totalTasks = completedToday.length;
    return totalTasks;
  }

  double getFocusTimeYesterday() {
    // Get yesterday's start date
    DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));

    // Get the list of completed tasks for yesterday
    List<Task> completedYesterday = completedTasks.where((task) =>
    task.completed &&
        task.createdAt.isAfter(yesterday.subtract(const Duration(days: 1))) &&
        task.createdAt.isBefore(yesterday)).toList();

    // Calculate the total focus time
    double totalFocusTime = completedYesterday.length * 25 / 60; // Convert from minutes to hours
    return totalFocusTime.roundToDouble();
  }

  double getBreakTimeYesterday() {
    // Get yesterday's start date
    DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));

    // Get the list of completed tasks for yesterday
    List<Task> completedYesterday = completedTasks.where((task) =>
    task.completed &&
        task.createdAt.isAfter(yesterday.subtract(const Duration(days: 1))) &&
        task.createdAt.isBefore(yesterday)).toList();

    // Calculate the total break time
    double totalBreakTime = completedYesterday.length * 5 / 60; // Convert from minutes to hours
    return totalBreakTime.roundToDouble();
  }

  int getAllTasksYesterday() {
    // Get yesterday's start date
    DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));

    // Get the list of completed tasks for yesterday
    List<Task> completedYesterday = completedTasks.where((task) =>
    task.completed &&
        task.createdAt.isAfter(yesterday.subtract(const Duration(days: 1))) &&
        task.createdAt.isBefore(yesterday)).toList();

    // Total number of completed tasks
    int totalTasks = completedYesterday.length;
    return totalTasks;
  }

  double getFocusTimeAll() {
    // Calculate the total focus time for all completed tasks
    double totalFocusTime = completedTasks.length * 25 / 60; // Convert from minutes to hours
    return totalFocusTime.roundToDouble();
  }

  double getBreakTimeAll() {
    // Calculate the total break time for all completed tasks
    double totalBreakTime = completedTasks.length * 5 / 60; // Convert from minutes to hours
    return totalBreakTime.roundToDouble();
  }

  int getAllTasksAll() {
    // Total number of completed tasks
    int totalTasks = completedTasks.length;
    return totalTasks;
  }

  double getTaskOfMonday() {
    return _getTasksForDay(DateTime.now().weekday - (DateTime.now().weekday - DateTime.monday));
  }

  double getTaskOfTuesday() {
    return _getTasksForDay(DateTime.now().weekday - (DateTime.now().weekday - DateTime.tuesday));
  }

  double getTaskOfWednesday() {
    return _getTasksForDay(DateTime.now().weekday - (DateTime.now().weekday - DateTime.wednesday));
  }

  double getTaskOfThursday() {
    return _getTasksForDay(DateTime.now().weekday - (DateTime.now().weekday - DateTime.thursday));
  }

  double getTaskOfFriday() {
    return _getTasksForDay(DateTime.now().weekday - (DateTime.now().weekday - DateTime.friday));
  }

  double getTaskOfSaturday() {
    return _getTasksForDay(DateTime.now().weekday - (DateTime.now().weekday - DateTime.saturday));
  }

  double getTaskOfSunday() {
    return _getTasksForDay(DateTime.now().weekday - (DateTime.now().weekday - DateTime.sunday));
  }

  double _getTasksForDay(int dayOfWeek) {
    // Calculate the difference in days from the current day to the specified day of the week
    int diff = DateTime.now().weekday - dayOfWeek;
    if (diff < 0) diff += 7; // Adjust to previous week if today is before the target day

    // Get the date of the specified day of the week
    DateTime day = DateTime.now().subtract(Duration(days: diff));

    // Get the start and end of the specified day
    DateTime startOfDay = DateTime(day.year, day.month, day.day);
    DateTime endOfDay = startOfDay.add(const Duration(days: 1));

    // Filter completed tasks for the specified day
    List<Task> tasksForDay = completedTasks.where((task) =>
    task.completed &&
        task.createdAt.isAfter(startOfDay) &&
        task.createdAt.isBefore(endOfDay)).toList();

    // Return the number of tasks completed on the specified day
    return tasksForDay.length.toDouble();
  }

  int getTasksOfTheWeek(){
    return (getTaskOfMonday() + getTaskOfTuesday() + getTaskOfWednesday() + getTaskOfThursday() + getTaskOfFriday() + getTaskOfSaturday() + getTaskOfSunday()).toInt();
  }

  int getCompletionPercentageOfWeek(List<Task> tasks) {
    int completedTasksCount = completedTasks.where((task) => task.completed).length;
    int totalTasksCount = tasks.length;

    double completionPercentage = (completedTasksCount / totalTasksCount) * 100;
    return completionPercentage.toInt();
  }

}
