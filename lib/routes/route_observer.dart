import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class DebugRouteObserver extends AutoRouteObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    log('🚀 Route PUSHED: ${route.settings.name}');
    if (route.settings.arguments != null) {
      log('   Arguments: ${route.settings.arguments}');
    }
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    log('⬅️ Route POPPED: ${route.settings.name}');
    super.didPop(route, previousRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    log('🗑️ Route REMOVED: ${route.settings.name}');
    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    log('🔄 Route REPLACED: ${oldRoute?.settings.name} → ${newRoute?.settings.name}');
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }
}