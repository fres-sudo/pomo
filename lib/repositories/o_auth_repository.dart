import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pine/pine.dart';
import 'package:pomo/services/network/authentication/authentication_service.dart';
import 'package:pomo/services/network/requests/o_auth/o_auth_request.dart';
import '../models/user/user.dart';
import '../services/network/authentication/oauth_service.dart';
import '../services/network/jto/user/user_jto.dart';
import '../services/storage/storage_service.dart';

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
    required this.storageService
  });

  final OAuthService oAuthService;
  final AuthenticationService authenticationService;
  final Mapper<User, String> userStringMapper;
  final DTOMapper<UserJTO, User> userMapper;
  final StorageService storageService;

  @override
  Future<User> signInWithApple() async {
      final googleAccount = await oAuthService.signInWithGoogle();
      final response = await authenticationService.retrieveGoogleUser(
          OAuthRequest(
              username: "guest-apple-${DateTime.now().millisecondsSinceEpoch.toString()}",
              email: googleAccount?.email ?? "",
              avatar: googleAccount?.photoUrl
          ));
      final user = userMapper.fromDTO(response.user);

      await storageService.storeRefreshToken(response.refreshToken);
      await storageService.storeAccessToken(response.accessToken);
      await storageService.storeUserData(user: user);

      return user;
  }

  @override
  Future<User> signInWithGoogle() async {
      final googleAccount = await oAuthService.signInWithGoogle();
      final response = await authenticationService.retrieveGoogleUser(
          OAuthRequest(
              username: "guest-google-${DateTime.now().millisecondsSinceEpoch.toString()}",
              email: googleAccount?.email ?? "",
              avatar: googleAccount?.photoUrl,
              providerUserId: googleAccount?.id ?? '',
          ));
      final user = userMapper.fromDTO(response.user);

      await storageService.storeRefreshToken(response.refreshToken);
      await storageService.storeAccessToken(response.accessToken);
      await storageService.storeUserData(user: user);

      return user;
  }

}
