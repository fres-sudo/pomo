import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class UserServiceV2 {
  Future<Map<String, dynamic>> getUserProfile(String userId);
}

class UserServiceV2Impl implements UserServiceV2 {
  final SupabaseClient supabase;
  final Logger logger;

  const UserServiceV2Impl({required this.supabase, required this.logger});

  @override
  Future<Map<String, dynamic>> getUserProfile(String userId) async {
    try {
      final response =
          await supabase.from('profiles').select().eq('id', userId).single();
      return response;
    } catch (error, stackTrace) {
      logger.e("[UserServiceV2] Error fetching user profile",
          error: error, stackTrace: stackTrace);
      rethrow;
    }
  }
}
