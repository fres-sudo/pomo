import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'notification_state.dart';


class NotificationCubit extends HydratedCubit<NotificationState> {
  NotificationCubit() : super(NotificationState({}));

  // Add notification with project/task id and notification id
  void addScheduledNotification(String itemId, int notificationId) {
    final newMap = Map<String, int>.from(state.scheduledNotifications);
    newMap[itemId] = notificationId;
    emit(state.copyWith(scheduledNotifications: newMap));
  }

  // Remove notification when completed
  void removeScheduledNotification(String itemId) {
    final newMap = Map<String, int>.from(state.scheduledNotifications);
    newMap.remove(itemId);
    emit(state.copyWith(scheduledNotifications: newMap));
  }

  @override
  NotificationState? fromJson(Map<String, dynamic> json) => NotificationState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(NotificationState state) => state.toJson();

}