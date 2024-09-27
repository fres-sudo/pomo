import 'package:dio/dio.dart';
import 'package:pomo/repositories/authentication_repository.dart';

class AuthInterceptor extends QueuedInterceptor {
  final AuthenticationRepository authenticationRepository;

  AuthInterceptor({required this.authenticationRepository});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final user = await authenticationRepository.currentUser;

    //print("USER IN INTECEPTOR: $user");

    if (user != null) {
      //options.headers[HttpHeaders.authorizationHeader] = 'Bearer ${user.token}';
    }
    super.onRequest(options, handler);
  }
}

