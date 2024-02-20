part of 'dependency_injector.dart';


final List<SingleChildWidget> _providers = [
  Provider<Dio>(
    create: (context) => Dio()
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
  ChangeNotifierProvider(create: (context) => EmailValidProvider()),
  ChangeNotifierProvider(create: (context) => NameValidProvider()),
  ChangeNotifierProvider(create: (context) => PasswordValidProvider()),
];
