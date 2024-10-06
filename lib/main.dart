import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pomo/cubits/theme/theme_cubit.dart';
import 'package:pomo/di/dependency_injector.dart';
import 'package:pomo/routes/app_router.dart';
import 'package:timezone/data/latest_all.dart' as tz;

import 'constants/theme.dart';
import 'i18n/strings.g.dart';
import 'services/notification/notification_service.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final directory = await getApplicationDocumentsDirectory(); // from path provider

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: directory,
  );

  await NotificationService.init();
  tz.initializeTimeZones();

  LocaleSettings.useDeviceLocale();


  // Remove splash screen.
  //FlutterNativeSplash.remove();

  runApp(TranslationProvider(child: PomoApp()));
}

class PomoApp extends StatelessWidget {
  PomoApp({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return DependencyInjector(
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
              return MaterialApp.router(
                title: "Pomo",
                debugShowCheckedModeBanner: false,
                locale: TranslationProvider.of(context).flutterLocale,
                supportedLocales: AppLocaleUtils.supportedLocales,
                routerDelegate: AutoRouterDelegate(
                  appRouter,
                  navigatorObservers: () => [AutoRouteObserver()],
                ),
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
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
