import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pine/pine.dart';
import 'package:pomo/services/network/authentication/authentication_service.dart';
import '../constants/constants.dart';
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

  Future<User> signUp(
      {required String username,
      required String email,
      required String password,
      required String confirmPassword});

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
    try {
      final request = SignInRequest(email: email, password: password);

      final response = await authenticationService.signIn(request);

      final user = userMapper.fromDTO(response);

      await secureStorage.write(
        key: 'user_data',
        value: userStringMapper.from(user),
      );

      return user;
    } catch (error) {
      logger.e('Error signing in: $error');
      rethrow;
    }
  }

  @override
  Future<User> signUp(
      {required String username,
      required String email,
      required String password,
      required String confirmPassword}) async {
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
  Future<void> signOut() => secureStorage.delete(key: 'user_data');

  @override
  Future<User?> get currentUser async {
    final json = await secureStorage.read(key: 'user_data');

    if (json != null) {
      return userStringMapper.to(json);
    }

    return null;
  }
}
