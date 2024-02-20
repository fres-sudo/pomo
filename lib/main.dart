import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pomo/cubits/theme/theme_cubit.dart';
import 'package:pomo/di/dependency_injector.dart';
import 'package:pomo/routes/app_router.dart';

import 'constants/theme.dart';

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

  final directory = await getApplicationDocumentsDirectory(); // from path provider

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: directory,
  );
  // Remove splash screen.
  FlutterNativeSplash.remove();

  runApp(DependencyInjector(child: PomoApp()));
}

class PomoApp extends StatelessWidget {
  PomoApp({super.key});

  // Initialize router.
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return DependencyInjector(
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (BuildContext context, state) {
          return MaterialApp.router(
            title: "Pomo",
            debugShowCheckedModeBanner: false,
            routerDelegate: AutoRouterDelegate(
              appRouter,
              navigatorObservers: () => [AutoRouteObserver()],
            ),
            routeInformationParser: appRouter.defaultRouteParser(),
            theme: LightTheme.make,
            darkTheme: DarkTheme.make,
            themeMode: state.mode,
          );
        },
      ),
    );
  }
}