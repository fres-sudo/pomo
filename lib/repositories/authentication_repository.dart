import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:pine/pine.dart';
import 'package:pomo/services/cookies/shared_pref_storage.dart';
import 'package:pomo/services/network/authentication/authentication_service.dart';
import 'package:pomo/services/network/requests/forgot_pass/forgot_pass_request.dart';
import 'package:pomo/services/network/requests/reset_password/reset_password_request.dart';
import 'package:pomo/services/network/requests/verify_token/verify_token_request.dart';
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
}

/// Implementation of the base interface AuthenticationRepository
class AuthenticationRepositoryImpl implements AuthenticationRepository {
  AuthenticationRepositoryImpl({
    required this.userMapper,
    required this.authenticationService,
    required this.signUpMapper,
    required this.userStringMapper,
    required this.secureStorage,
  });

  final AuthenticationService authenticationService;
  final DTOMapper<SignUpResponse, User> signUpMapper;
  final Mapper<User, String> userStringMapper;
  final DTOMapper<UserJTO, User> userMapper;
  final FlutterSecureStorage secureStorage;

  @override
  Future<User> signIn({
    required String email,
    required String password,
  }) async {
      final request = SignInRequest(email: email, password: password);
      final response = await authenticationService.signIn(request);

    final user = userMapper.fromDTO(response);

    await secureStorage.write(
      key: 'user_data',
      value: userStringMapper.from(user),
    );

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
   await secureStorage.deleteAll();
   final sharedPref = await SharedPreferences.getInstance();
   final sharedStorage =  SharedPrefStorage();
   await HydratedBloc.storage.delete("focusTime");
   await HydratedBloc.storage.delete("breakTime");
   await sharedPref.clear();
   await sharedStorage.clear();
  }

  @override
  Future<User?> get currentUser async {
    final json = await secureStorage.read(key: 'user_data');
    if (json != null) {
      return userStringMapper.to(json);
    }
    return null;
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
}
