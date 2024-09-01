import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../mixins/encrypted_credentials_mixin.dart';


typedef GoogleSignInFactory = GoogleSignIn Function(List<String> scopes);
typedef AppleSignInFactory = Future<AuthorizationCredentialAppleID> Function({
required List<AppleIDAuthorizationScopes> scopes,
String? nonce,
});

abstract class OAuthService {

  Future<GoogleSignInAccount?> signInWithGoogle();

  Future<AuthorizationCredentialAppleID?> signInWithApple();

}


class OAuthServiceImpl with EncryptedCredentialsMixin implements OAuthService {

  final AppleSignInFactory appleSignInFactory;
  final GoogleSignInFactory googleSignInFactory;

  const OAuthServiceImpl({
    required this.appleSignInFactory,
    required this.googleSignInFactory,
  });


  @override
  Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      return await googleSignInFactory(['email']).signIn();
    } catch (_) {
      throw Error();
    }
  }

  @override
  Future<AuthorizationCredentialAppleID?> signInWithApple() async {
    try {
      // To prevent replay attacks with the credential returned from Apple, we
      // include a nonce in the credential request. When signing in with
      // Firebase, the nonce in the id token returned by Apple, is expected to
      // match the sha256 hash of `rawNonce`.
      final rawNonce = generateNonce();
      final nonce = sha256ofString(rawNonce);

      // Request credential for the currently signed in Apple account.
      return await appleSignInFactory(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName
        ],
        nonce: nonce,
      );
    } catch (_) {
      throw Error();
    }
  }

}
