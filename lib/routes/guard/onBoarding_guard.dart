import 'package:auto_route/auto_route.dart';
import 'package:pomo/routes/app_router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router)async{
    //if user already have seen on boarding, go to login
    var prefs = await SharedPreferences.getInstance();
    var inNotFirsLog = prefs.getBool("is_not_first_log");

    if(inNotFirsLog != null){ //user already seen the onboarding
      resolver.next(true);
    }else {
      // redirect the user to login page
      router.push(const OnBoardingRoute());
    }
  }
}