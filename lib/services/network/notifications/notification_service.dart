import 'package:logger/logger.dart';
import 'package:pomo/error/generic_error.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class NotificationService {
  Future<void> sendNotification({
    required String title,
    required String body,
    required String to,
  });
}

class NotificationServiceImpl implements NotificationService {
  final SupabaseClient supabase;
  final Logger logger;

  const NotificationServiceImpl({required this.supabase, required this.logger});

  SupabaseQueryBuilder get _notifications => supabase.from('notifications');

  @override
  Future<void> sendNotification({
    required String title,
    required String body,
    required String to,
  }) async {
    try {
      logger.i('[NotificationService] Sending notification to $to');
      await _notifications.insert({
        'title': title,
        'body': body,
        'user_id': to,
      });
    } on PostgrestException catch (error, stackTrace) {
      logger.e(
          '[NotificationService] Error sending notification: $error, $stackTrace');
      if (error.code == '42501') {
        throw OperationNotAllowedError();
      }
    } catch (error, stackTrace) {
      logger.e(
          '[NotificationService] Unexpected error sending notification: $error, $stackTrace');
      throw GenericError();
    }
  }
}
