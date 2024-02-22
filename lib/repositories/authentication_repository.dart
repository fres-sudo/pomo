import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pomo/repositories/mappers/user_mapper.dart';
import 'package:pomo/services/network/authentication/authentication_service.dart';
import 'package:pomo/services/network/jto/user/user_jto.dart';
import '../constants/constants.dart';
import '../models/user/user.dart';
import '../services/network/requests/sign_in/sign_in_request.dart';
import '../services/network/requests/sign_up/sign_up_request.dart';

/// Abstract class of AuthenticationRepository
abstract class AuthenticationRepository {
  Future<User> signIn({
    required String email,
    required String password,
  });

  Future<User> signUp(
      {required String username,
      required String email,
      required String password,
      required String confirmPassword});

  Future<void> signOut();
}

/// Implementation of the base interface AuthenticationRepository
class AuthenticationRepositoryImpl implements AuthenticationRepository {
  AuthenticationRepositoryImpl({
    required this.authenticationService,
    required this.userMapper,
    required this.secureStorage,
  });

  final AuthenticationService authenticationService;
  final UserMapper userMapper;
  final FlutterSecureStorage secureStorage;

  @override
  Future<User> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await authenticationService.signIn(
        SignInRequest(
          email: email,
          password: password,
        ),
      );

      final user = userMapper.fromDTO(response.user);

      await secureStorage.write(
        key: 'user_data',
        value: userMapper.toDTO(user)
            .toString(), //TODO: implement correctly the string (json)
      );

      return user;
    } catch (error) {
      logger.e('Error signing in: $error');
      throw Exception('Sign-in failed');
    }
  }

  @override
  Future<User> signUp(
      {required String username,
      required String email,
      required String password,
      required String confirmPassword}) async {
    try {
      final response = await authenticationService.signUp(
        SignUpRequest(
          username: username,
          email: email,
          password: password,
          confirmPassword: password,
        ),
      );

      final user = userMapper.fromDTO(response.user);

      return user;
    } catch (error) {
      logger.e(
        'Error signing up with name: $username, email $email and password $password',
      );

      rethrow;
    }
  }

  @override
  Future<void> signOut() => secureStorage.delete(key: 'user_data');

  Future<User?> get currentUser async {
    final json = await secureStorage.read(key: 'user_data');

    if (json != null) {
      return userMapper
          .fromDTO(json as UserJTO); //TODO: implement correctly the UserJTO
    }

    return null;
  }
}
