import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pomo/cubits/theme/theme_cubit.dart';
import 'package:pomo/di/dependency_injector.dart';
import 'package:pomo/routes/app_router.dart';

import 'constants/theme.dart';
import 'i18n/strings.g.dart';
import 'local_notification.dart';

/// ----------- [Notification] ---------------
int id = 0;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

/// Streams are created so that app can respond to notification-related events
/// since the plugin is initialised in the `main` function
final StreamController<ReceivedNotification> didReceiveLocalNotificationStream = StreamController<ReceivedNotification>.broadcast();

final StreamController<String?> selectNotificationStream = StreamController<String?>.broadcast();

const MethodChannel platform = MethodChannel('dexterx.dev/flutter_local_notifications_example');

const String portName = 'notification_send_port';

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}

String? selectedNotificationPayload;

/// A notification action which triggers a url launch event
const String urlLaunchActionId = 'id_1';

/// A notification action which triggers a App navigation event
const String navigationActionId = 'id_3';

/// Defines a iOS/MacOS notification category for text input actions.
const String darwinNotificationCategoryText = 'textCategory';

/// Defines a iOS/MacOS notification category for plain actions.
const String darwinNotificationCategoryPlain = 'plainCategory';

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  // ignore: avoid_print
  print('notification(${notificationResponse.id}) action tapped: '
      '${notificationResponse.actionId} with'
      ' payload: ${notificationResponse.payload}');
  if (notificationResponse.input?.isNotEmpty ?? false) {
    // ignore: avoid_print
    print('notification action tapped with input: ${notificationResponse.input}');
  }
}

/// ----------- [Notification] ---------------

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Preserving splash screen.
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final directory = await getApplicationDocumentsDirectory(); // from path provider

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: directory,
  );

  await LocalNotifications.init();

  LocaleSettings.useDeviceLocale(); // and this

  // Remove splash screen.
  FlutterNativeSplash.remove();

  runApp(TranslationProvider(child: PomoApp()));
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
