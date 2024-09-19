import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pine/pine.dart';
import 'package:pomo/services/network/authentication/authentication_service.dart';
import 'package:pomo/services/network/requests/o_auth/o_auth_request.dart';
import '../constants/constants.dart';
import '../models/user/user.dart';
import '../services/network/authentication/oauth_service.dart';
import '../services/network/jto/user/user_jto.dart';
import '../services/network/requests/sign_in/sign_in_request.dart';
import '../services/network/requests/sign_up/sign_up_request.dart';
import '../services/network/response/sign_up/sign_up_response.dart';

/// Abstract class of AuthenticationRepository
abstract class OAuthRepository {

  Future<User> signInWithApple();
  Future<User> signInWithGoogle();

}

/// Implementation of the base interface AuthenticationRepository
class OAuthRepositoryImpl implements OAuthRepository {
  OAuthRepositoryImpl({
    required this.authenticationService,
    required this.userMapper,
    required this.oAuthService,
    required this.userStringMapper,
    required this.secureStorage,
  });

  final OAuthService oAuthService;
  final AuthenticationService authenticationService;
  final Mapper<User, String> userStringMapper;
  final DTOMapper<UserJTO, User> userMapper;
  final FlutterSecureStorage secureStorage;

  @override
  Future<User> signInWithApple() async {
    try {
      final googleAccount = await oAuthService.signInWithGoogle();
      final response = await authenticationService.retrieveGoogleUser(
          OAuthRequest(
              username: "guest-${DateTime.now().millisecondsSinceEpoch.toString()}",
              email: googleAccount?.email ?? "",
              avatar: googleAccount?.photoUrl
          ));
      final user = userMapper.fromDTO(response);
      await secureStorage.write(
        key: 'user_data',
        value: userStringMapper.from(user),
      );

      return user;
    } catch (error) {
      logger.e('Error signing in: $error');
      throw Exception('Sign-in failed');
    }
  }

  @override
  Future<User> signInWithGoogle() async {
    try {
      final googleAccount = await oAuthService.signInWithGoogle();
      final response = await authenticationService.retrieveGoogleUser(
          OAuthRequest(
              username: googleAccount?.displayName ?? "",
              email: googleAccount?.email ?? "",
              avatar: googleAccount?.photoUrl,
              providerUserId: googleAccount?.id ?? '',
          ));
      final user = userMapper.fromDTO(response);
      await secureStorage.write(
        key: 'user_data',
        value: userStringMapper.from(user),
      );

      return user;
    } catch (error) {
      logger.e('Error signing in: $error');
      throw Exception('Sign-in failed');
    }
  }

}
