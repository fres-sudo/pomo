import 'package:auto_route/auto_route.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pomo/services/storage/storage_service.dart';

import '../../constants/constants.dart';
import '../app_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    const storage = FlutterSecureStorage();
    //check if user is authenticated if yes go to root, if not to login
    final value = await storage.read(key: StorageService.userDataKey);

    if (value != null) {
      resolver.next(true);
    } else {
      router.push(const HomeRoute());
    }
  }
}
