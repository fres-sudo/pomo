import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Preserving splash screen.
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Delay for splash screen.
  await Future.delayed(const Duration(seconds: 2));

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Remove splash screen.
  FlutterNativeSplash.remove();

  runApp(const Placeholder());
}



