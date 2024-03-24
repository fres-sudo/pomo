import 'package:auto_route/auto_route.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../app_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {

    const storage = FlutterSecureStorage();
    //check if user is authenticated if yes go to root, if not to login
    var value = await storage.read(key: "user_data");

    //print("VALUE IN GUARD: $value");

    if (value != null) {
      //user logged
      resolver.next(true);
    } else {
      // redirect the user to login page
      router.push(const LoginRoute());
    }
  }
}
