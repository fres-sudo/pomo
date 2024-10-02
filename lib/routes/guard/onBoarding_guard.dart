import 'package:auto_route/auto_route.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pomo/routes/app_router.gr.dart';
import 'package:pomo/services/storage/storage_service.dart';

class OnBoardingGuard extends AutoRouteGuard {

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router)async{
    //if user already have seen on boarding, go to login

    final storage = FlutterSecureStorage();
    final value = await storage.read(key: StorageService.isFirstAccessKey);

    if(value == null){
      //user already seen the onboarding
      router.push(const OnBoardingRoute());
    }else {
      // redirect the user to login page
      resolver.next(true);
    }
  }
}