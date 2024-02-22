import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_router.gr.dart';


class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {

    //check if user is authenticated if yes go to root, if not to login
    var prefs = await SharedPreferences.getInstance();
    var value = prefs.getString("userData");

    if (value != null) {
      //user logged
      resolver.next(true);
    } else {
      // redirect the user to login page
      router.push(const LoginRoute());
    }
  }
}
