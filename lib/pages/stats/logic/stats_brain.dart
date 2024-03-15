import '../../../models/task/task.dart';
class StatsBrain {
  final List<Task> completedTasks;
  final List<bool> selectedMode;

  late final double focusTime;
  late final double breakTime;
  late final int allTasks;

  StatsBrain(this.completedTasks, this.selectedMode) {
    if (selectedMode[0]) {
      focusTime = getFocusTimeToday(completedTasks);
      breakTime = getBreakTimeToday(completedTasks);
      allTasks = getAllTasksToday(completedTasks);
    } else if (selectedMode[1]) {
      focusTime = getFocusTimeYesterday(completedTasks);
      breakTime = getBreakTimeYesterday(completedTasks);
      allTasks = getAllTasksYesterday(completedTasks);
    } else {
      focusTime = getFocusTimeAll(completedTasks);
      breakTime = getBreakTimeAll(completedTasks);
      allTasks = getAllTasksAll(completedTasks);
    }
  }

  double getFocusTimeToday(List<Task> completedTasks) {
    // Ottieni la data di inizio di oggi
    DateTime today = DateTime.now();

    // Ottieni la lista dei task completati di oggi
    List<Task> completedToday = completedTasks.where((task) =>
    task.completed &&
        task.createdAt.isAfter(today.subtract(Duration(days: 1)))).toList();

    // Calcola il tempo totale di focus time
    double totalFocusTime = completedToday.length * 25 / 60; // Converti da minuti a ore
    return totalFocusTime.roundToDouble();
  }

  double getBreakTimeToday(List<Task> completedTasks) {
    // Ottieni la data di inizio di oggi
    DateTime today = DateTime.now();

    // Ottieni la lista dei task completati di oggi
    List<Task> completedToday = completedTasks.where((task) =>
    task.completed &&
        task.createdAt.isAfter(today.subtract(Duration(days: 1)))).toList();

    // Calcola il tempo totale di break time
    double totalBreakTime = completedToday.length * 5 / 60; // Converti da minuti a ore
    return totalBreakTime.roundToDouble();
  }

  int getAllTasksToday(List<Task> completedTasks) {
    // Ottieni la data di inizio di oggi
    DateTime today = DateTime.now();

    // Ottieni la lista dei task completati di oggi
    List<Task> completedToday = completedTasks.where((task) =>
    task.completed &&
        task.createdAt.isAfter(today.subtract(Duration(days: 1)))).toList();

    // Numero totale di task completati
    int totalTasks = completedToday.length;
    return totalTasks;
  }

  double getFocusTimeYesterday(List<Task> completedTasks) {
    // Ottieni la data di inizio di ieri
    DateTime yesterday = DateTime.now().subtract(Duration(days: 1));

    // Ottieni la lista dei task completati di ieri
    List<Task> completedYesterday = completedTasks.where((task) =>
    task.completed &&
        task.createdAt.isAfter(yesterday.subtract(Duration(days: 1))) &&
        task.createdAt.isBefore(yesterday)).toList();

    // Calcola il tempo totale di focus time
    double totalFocusTime = completedYesterday.length * 25 / 60; // Converti da minuti a ore
    return totalFocusTime.roundToDouble();
  }

  double getBreakTimeYesterday(List<Task> completedTasks) {
    // Ottieni la data di inizio di ieri
    DateTime yesterday = DateTime.now().subtract(Duration(days: 1));

    // Ottieni la lista dei task completati di ieri
    List<Task> completedYesterday = completedTasks.where((task) =>
    task.completed &&
        task.createdAt.isAfter(yesterday.subtract(Duration(days: 1))) &&
        task.createdAt.isBefore(yesterday)).toList();

    // Calcola il tempo totale di break time
    double totalBreakTime = completedYesterday.length * 5 / 60; // Converti da minuti a ore
    return totalBreakTime.roundToDouble();
  }

  int getAllTasksYesterday(List<Task> completedTasks) {
    // Ottieni la data di inizio di ieri
    DateTime yesterday = DateTime.now().subtract(Duration(days: 1));

    // Ottieni la lista dei task completati di ieri
    List<Task> completedYesterday = completedTasks.where((task) =>
    task.completed &&
        task.createdAt.isAfter(yesterday.subtract(Duration(days: 1))) &&
        task.createdAt.isBefore(yesterday)).toList();

    // Numero totale di task completati
    int totalTasks = completedYesterday.length;
    return totalTasks;
  }

  double getFocusTimeAll(List<Task> completedTasks) {
    // Calcola il tempo totale di focus time per tutti i task completati
    double totalFocusTime = completedTasks.length * 25 / 60; // Converti da minuti a ore
    return totalFocusTime.roundToDouble();
  }

  double getBreakTimeAll(List<Task> completedTasks) {
    // Calcola il tempo totale di break time per tutti i task completati
    double totalBreakTime = completedTasks.length * 5 / 60; // Converti da minuti a ore
    return totalBreakTime.roundToDouble();
  }

  int getAllTasksAll(List<Task> completedTasks) {
    // Numero totale di task completati
    int totalTasks = completedTasks.length;
    return totalTasks;
  }

}


