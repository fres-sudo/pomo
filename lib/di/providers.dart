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
  Provider<supabase.SupabaseClient>.value(
    value: supabase.Supabase.instance.client,
  ),
  Provider<Logger>(create: (_) => Logger(printer: PrettyPrinter())),
  Provider<NotificationService>(
    create: (context) => NotificationServiceImpl(
      logger: context.read(),
      supabase: context.read(),
    ),
  ),
  Provider<Dio>(
    create: (context) => Dio(
      BaseOptions(contentType: 'application/json'),
    )..interceptors.addAll([
        if (kDebugMode) context.read<PrettyDioLogger>(),
      ]),
  ),
  Provider<FlutterSecureStorage>(
    create: (_) => const FlutterSecureStorage(),
  ),
  Provider<StorageService>(
    create: (context) => StorageService(
        userStringMapper: context.read(), secureStorage: context.read()),
  ),
  Provider<AuthenticationService>(
    create: (context) => AuthenticationService(
      context.read<Dio>(),
      baseUrl: kServerConnectionIP,
    ),
  ),
  Provider<OAuthService>(
    create: (context) => OAuthServiceImpl(
        appleSignInFactory: ({required scopes, nonce}) =>
            SignInWithApple.getAppleIDCredential(
              scopes: scopes,
              nonce: nonce,
            )),
  ),
  Provider<AuthService>(
    create: (context) => AuthServiceImpl(
      logger: context.read(),
      supabase: context.read(),
    ),
  ),
  Provider<ProjectService>(
    create: (context) => ProjectService(
      context.read<Dio>(),
      baseUrl: kServerConnectionIP,
    ),
  ),
  Provider<TaskService>(
    create: (context) => TaskService(
      context.read<Dio>(),
      baseUrl: kServerConnectionIP,
    ),
  ),
  Provider<UserService>(
    create: (context) => UserService(
      context.read<Dio>(),
      baseUrl: kServerConnectionIP,
    ),
  ),
  Provider<StatsService>(
    create: (context) => StatsService(
      context.read<Dio>(),
      baseUrl: kServerConnectionIP,
    ),
  ),
];
