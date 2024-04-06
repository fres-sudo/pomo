import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../app_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {

    const storage = FlutterSecureStorage();
    //check if user is authenticated if yes go to root, if not to login
    var value = await storage.read(key: "user_data");

    if (value != null) {
      // User logged in, check JWT token validity
      final Map<String, dynamic> userData = Map<String, dynamic>.from(jsonDecode(value));
      final String? token = userData['token'];

      if (token != null) {
        if (JwtDecoder.isExpired(token)) {
          // Token is expired, redirect to login page
          router.push(const LoginRoute());
        } else {
          // Token is valid, allow navigation
          resolver.next(true);
        }
      } else {
        // Token is missing, redirect to login page
        router.push(const LoginRoute());
      }
    } else {
      // User not logged in, redirect to login page
      router.push(const LoginRoute());
    }
  }
}

