import 'package:dio/dio.dart';
import 'package:pomo/services/network/jto/user/user_jto.dart';
import 'package:pomo/services/network/response/sign_in/sign_in_response.dart';
import 'package:retrofit/retrofit.dart';
import '../requests/forgot_pass/forgot_pass_request.dart';
import '../requests/o_auth/o_auth_request.dart';
import '../requests/refresh_token/refresh_token_request.dart';
import '../requests/reset_password/reset_password_request.dart';
import '../requests/sign_in/sign_in_request.dart';
import '../requests/sign_up/sign_up_request.dart';
import '../requests/verify_token/verify_token_request.dart';
import '../response/refresh_token/refresh_token_response.dart';

part 'authentication_service.g.dart';

/// Abstract class of AuthenticationService
@RestApi()
abstract class AuthenticationService {
  factory AuthenticationService(Dio dio, {String baseUrl}) =
      _AuthenticationService;

  @POST('/auth/login')
  Future<SignInResponse> signIn(@Body() SignInRequest request);

  @POST('/auth/signup')
  Future<UserJTO> signUp(@Body() SignUpRequest request);

  @POST("/auth/forgotpassword")
  Future<String> forgotPassword(@Body() ForgotPasswordRequest request);

  @POST('/auth/verify-token')
  Future<String> verifyToken(@Body() VerifyTokenRequest request);

  @POST('/auth/resetpassword/{token}')
  Future<String> resetPassword(@Path('token') String token, @Body() ResetPasswordRequest request);

  @POST('/auth/refresh-token')
  Future<RefreshTokenResponse> refreshToken(@Body() RefreshTokenRequest refreshToken);

  @POST('/auth/google')
  Future<SignInResponse> retrieveGoogleUser(@Body() OAuthRequest request);

  @POST('/auth/apple')
  Future<SignInResponse> retrieveAppleUser(@Body() OAuthRequest request);
}

