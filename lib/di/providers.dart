part of 'dependency_injector.dart';


final List<SingleChildWidget> _providers = [
  if (kDebugMode)
    Provider<PrettyDioLogger>(
      create: (_) => PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        compact: true,
      ),
    ),
  Provider<Dio>(
    create: (context) => Dio(
      BaseOptions(contentType: 'application/json'),
    )
      ..interceptors.addAll([
        if (kDebugMode) context.read<PrettyDioLogger>(),
      ]),
  ),
  Provider<AuthenticationService>(
    create: (context) => AuthenticationService(
      context.read<Dio>(),
      baseUrl: kServerConnectionIP,
    ),
  ),
  Provider<FlutterSecureStorage>(
    create: (_) => const FlutterSecureStorage(),
  ),


  ChangeNotifierProvider(create: (context) => EmailValidProvider()),
  ChangeNotifierProvider(create: (context) => NameValidProvider()),
  ChangeNotifierProvider(create: (context) => PasswordValidProvider()),
];
