import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthService {
  Stream<AuthState> get authStateChanges;
  User? get currentUser;
  Future<void> signIn({required String email});
  Future<AuthResponse> verifyOtp({required String email, required String otp});
  Future<void> signOut();
}

class AuthServiceImpl implements AuthService {
  final SupabaseClient supabase;
  final Logger logger;

  const AuthServiceImpl({required this.supabase, required this.logger});

  @override
  Stream<AuthState> get authStateChanges => supabase.auth.onAuthStateChange;

  @override
  User? get currentUser => supabase.auth.currentUser;

  @override
  Future<void> signIn({required String email}) async {
    try {
      return await supabase.auth
          .signInWithOtp(email: email, shouldCreateUser: true);
    } on PostgrestException catch (error, stackTrace) {
      logger.e('[AuthService] Postgres Error during sign in',
          error: error, stackTrace: stackTrace);
      // Handle specific Supabase errors if needed
      rethrow;
    } catch (error, stackTrace) {
      logger.e('[AuthService] Error during sign in',
          error: error, stackTrace: stackTrace);
      // Handle other errors if needed
      rethrow;
    }
  }

  @override
  Future<AuthResponse> verifyOtp(
      {required String email, required String otp}) async {
    try {
      final response = await supabase.auth
          .verifyOTP(type: OtpType.email, email: email, token: otp);
      return response;
    } on PostgrestException catch (error, stackTrace) {
      logger.e(
          '[AuthService] Postgres Error during sign in: $error, $stackTrace');
      // Handle specific Supabase errors if needed
      rethrow;
    } catch (error, stackTrace) {
      logger.e('[AuthService] Error during sign in: $error, $stackTrace');
      // Handle other errors if needed
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await supabase.auth.signOut();
    } on PostgrestException catch (error, stackTrace) {
      logger.e(
          '[AuthService] Postgres Error during sign out: $error, $stackTrace');
      // Handle specific Supabase errors if needed
      rethrow;
    } catch (error, stackTrace) {
      logger.e('[AuthService] Error during sign out: $error, $stackTrace');
      // Handle other errors if needed
      rethrow;
    }
  }
}
