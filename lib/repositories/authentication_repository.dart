import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:pine/pine.dart';
import 'package:pomo/constants/constants.dart';
import 'package:pomo/services/network/authentication/authentication_service.dart';
import 'package:pomo/services/network/requests/forgot_pass/forgot_pass_request.dart';
import 'package:pomo/services/network/requests/refresh_token/refresh_token_request.dart';
import 'package:pomo/services/network/requests/reset_password/reset_password_request.dart';
import 'package:pomo/services/network/requests/verify_token/verify_token_request.dart';
import 'package:pomo/services/network/response/refresh_token/refresh_token_response.dart';
import 'package:pomo/services/storage/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user/user.dart';
import '../services/network/jto/user/user_jto.dart';
import '../services/network/requests/sign_in/sign_in_request.dart';
import '../services/network/requests/sign_up/sign_up_request.dart';
import '../services/network/response/sign_up/sign_up_response.dart';

/// Abstract class of AuthenticationRepository
abstract class AuthenticationRepository {
  Future<User> signIn({
    required String email,
    required String password,
  });

  Future<User> signUp({required String username, required String email, required String password, required String confirmPassword});

  Future<String> forgotPassword({required String email});

  Future<String> verifyToken({required String token, required String email});

  Future<String> resetPassword({required String email, required String token, required String newPassword, required String confirmNewPassword});

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
    required this.userMapper,
    required this.authenticationService,
    required this.signUpMapper,
    required this.storageService,
  });

  final _authController = StreamController<bool>.broadcast();

  void notifySignedOut() => _authController.add(false); // false == not authenticated

  final AuthenticationService authenticationService;
  final DTOMapper<SignUpResponse, User> signUpMapper;
  final DTOMapper<UserJTO, User> userMapper;
  final StorageService storageService;

  @override
  Future<User> signIn({
    required String email,
    required String password,
  }) async {
    final request = SignInRequest(email: email, password: password);
    final response = await authenticationService.signIn(request);

    final user = userMapper.fromDTO(response.user);

    await storageService.storeRefreshToken(response.refreshToken);
    await storageService.storeAccessToken(response.accessToken);
    await storageService.storeUserData(user: user);

    return user;
  }

  @override
  Future<User> signUp({required String username, required String email, required String password, required String confirmPassword}) async {
    final response = await authenticationService.signUp(
      SignUpRequest(
        username: username,
        email: email,
        password: password,
        passwordConfirmation: password,
      ),
    );
    final user = userMapper.fromDTO(response);
    return user;
  }

  @override
  Future<String> forgotPassword({required String email}) async {
    final result = await authenticationService.forgotPassword(ForgotPasswordRequest(email: email));
    return result;
  }

  @override
  Future<void> signOut() async {
    await storageService.clearStorageWithoutFirstSeen();
    final sharedPref = await SharedPreferences.getInstance();
    await HydratedBloc.storage.delete("focusTime");
    await HydratedBloc.storage.delete("breakTime");
    await sharedPref.clear();
    _authController.add(false); // Notify listeners that the user is signed out
  }

  @override
  Future<User?> get currentUser async => await storageService.userData;

  @override
  Future<String?> get getAccessToken async => await storageService.accessToken;

  @override
  Future<String?> get getRefreshToken async => await storageService.refreshToken;

  @override
  Future<RefreshTokenResponse> refreshToken({required String refreshToken}) async {
    final response = await authenticationService.refreshToken(RefreshTokenRequest(refreshToken: refreshToken));
    await storageService.storeAccessToken(response.accessToken);
    await storageService.storeRefreshToken(response.refreshToken);
    return response;
  }

  @override
  Future<String> resetPassword(
      {required String email, required String token, required String newPassword, required String confirmNewPassword}) async {
    final result = await authenticationService.resetPassword(
        token, ResetPasswordRequest(email: email, newPassword: newPassword, confirmNewPassword: confirmNewPassword));
    return result;
  }

  @override
  Future<String> verifyToken({required String token, required String email}) async {
    final result = await authenticationService.verifyToken(VerifyTokenRequest(email: email, token: token));
    return result;
  }

  @override
  Stream<bool> get authStatusStream => _authController.stream;

  void dispose() {
    _authController.close();
  }
}
