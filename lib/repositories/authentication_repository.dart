import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:pine/pine.dart';
import 'package:pomo/constants/constants.dart';
import 'package:pomo/error/generic_error.dart';
import 'package:pomo/error/localized.dart';
import 'package:pomo/repositories/mappers/user_mapper_v2.dart';
import 'package:pomo/services/network/authentication/auth_service.dart';
import 'package:pomo/services/network/authentication/authentication_service.dart';
import 'package:pomo/services/network/requests/forgot_pass/forgot_pass_request.dart';
import 'package:pomo/services/network/requests/refresh_token/refresh_token_request.dart';
import 'package:pomo/services/network/requests/reset_password/reset_password_request.dart';
import 'package:pomo/services/network/requests/verify_token/verify_token_request.dart';
import 'package:pomo/services/network/response/refresh_token/refresh_token_response.dart';
import 'package:pomo/services/network/user/user_service_v2.dart';
import 'package:pomo/services/storage/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supa;

import '../models/user/user.dart';
import '../services/network/jto/user/user_jto.dart';
import '../services/network/response/sign_up/sign_up_response.dart';

/// Abstract class of AuthenticationRepository
abstract class AuthenticationRepository {
  Future<void> signIn({
    required String email,
  });

  Future<void> verifyOtp({
    required String email,
    required String otp,
  });

  Future<String> forgotPassword({required String email});

  Future<String> verifyToken({required String token, required String email});

  Future<String> resetPassword(
      {required String email,
      required String token,
      required String newPassword,
      required String confirmNewPassword});

  Future<void> signOut();

  Future<User?> get currentUser;

  Future<RefreshTokenResponse> refreshToken({required String refreshToken});

  Future<String?> get getRefreshToken;

  Future<String?> get getAccessToken;

  Stream<bool> get authStatusStream;
}

/// Implementation of the base interface AuthenticationRepository
class AuthenticationRepositoryImpl implements AuthenticationRepository {
  AuthenticationRepositoryImpl({
    required this.userService,
    required this.authenticationService,
    required this.authService,
    required this.signUpMapper,
    required this.storageService,
  });

  final _authController = StreamController<bool>.broadcast();

  final AuthenticationService authenticationService;
  final DTOMapper<SignUpResponse, User> signUpMapper;
  final StorageService storageService;
  final AuthService authService;
  final UserServiceV2 userService;

  @override
  Future<void> signIn({
    required String email,
  }) async {
    try {
      await authService.signIn(email: email);
    } on LocalizedError catch (error, stackTrace) {
      logger.e("[AuthenticationRepository] Handled Error during signIn",
          error: error, stackTrace: stackTrace);
      rethrow;
    } catch (error, stackTrace) {
      logger.e("[AuthenticationRepository] Unhandled Error during signIn",
          error: error, stackTrace: stackTrace);
      throw GenericError();
    }
  }

  @override
  Future<void> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      await authService.verifyOtp(email: email, otp: otp);
    } on LocalizedError catch (error, stackTrace) {
      logger.e("[AuthenticationRepository] Handled Error during verifyOtp",
          error: error, stackTrace: stackTrace);
      rethrow;
    } catch (error, stackTrace) {
      logger.e("[AuthenticationRepository] Unhandled Error during verifyOtp",
          error: error, stackTrace: stackTrace);
      throw GenericError();
    }
  }

  @override
  Future<String> forgotPassword({required String email}) async {
    final result = await authenticationService
        .forgotPassword(ForgotPasswordRequest(email: email));
    return result;
  }

  @override
  Future<void> signOut() async {
    try {
      await authService.signOut();
    } on LocalizedError catch (e, stack) {
      logger.e("[AuthenticationRepository] Handled Error during signOut",
          error: e, stackTrace: stack);
      rethrow;
    } catch (e, stack) {
      logger.e("[AuthenticationRepository] Unhandled Error during signOut",
          error: e, stackTrace: stack);
      throw GenericError();
    } finally {
      // Clear local storage regardless of sign-out success
      await Future.wait([
        storageService.clearStorageWithoutFirstSeen(),
        HydratedBloc.storage.delete("focusTime"),
        HydratedBloc.storage.delete("breakTime"),
        SharedPreferences.getInstance().then((prefs) => prefs.clear())
      ]);
    }
  }

  @override
  Future<User?> get currentUser async {
    if (authService.currentUser == null) {
      return null;
    }
    final user = await userService.getUserProfile(authService.currentUser!.id);
    return User(
        id: user["id"],
        username: user["username"],
        email: user["email"],
        avatar: user["avatar"],
        onboardingCompletedAt: user["onboardingCompletedAt"],
        createdAt: user["createdAt"]);
  }

  @override
  Future<String?> get getAccessToken async => await storageService.accessToken;

  @override
  Future<String?> get getRefreshToken async =>
      await storageService.refreshToken;

  @override
  Future<RefreshTokenResponse> refreshToken(
      {required String refreshToken}) async {
    final response = await authenticationService
        .refreshToken(RefreshTokenRequest(refreshToken: refreshToken));
    await storageService.storeAccessToken(response.accessToken);
    await storageService.storeRefreshToken(response.refreshToken);
    return response;
  }

  @override
  Future<String> resetPassword(
      {required String email,
      required String token,
      required String newPassword,
      required String confirmNewPassword}) async {
    final result = await authenticationService.resetPassword(
        token,
        ResetPasswordRequest(
            email: email,
            newPassword: newPassword,
            confirmNewPassword: confirmNewPassword));
    return result;
  }

  @override
  Future<String> verifyToken(
      {required String token, required String email}) async {
    final result = await authenticationService
        .verifyToken(VerifyTokenRequest(email: email, token: token));
    return result;
  }

  @override
  Stream<bool> get authStatusStream =>
      authService.authStateChanges.map((event) => event.session != null);

  void dispose() {
    _authController.close();
  }
}
