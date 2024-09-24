part of 'notification_cubit.dart';

class NotificationState {
  final Map<String, int> scheduledNotifications;

  NotificationState(this.scheduledNotifications);

  NotificationState copyWith({Map<String, int>? scheduledNotifications}) {
    return NotificationState(scheduledNotifications ?? this.scheduledNotifications);
  }

  // Convert to JSON for HydratedCubit storage
  Map<String, dynamic> toJson() => {
    'scheduledNotifications': scheduledNotifications,
  };

  // Create state from JSON
  factory NotificationState.fromJson(Map<String, dynamic> json) {
    return NotificationState(
      (json['scheduledNotifications'] as Map).cast<String, int>(),
    );
  }
}