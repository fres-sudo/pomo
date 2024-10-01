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
    )..interceptors.addAll([
        if (kDebugMode) context.read<PrettyDioLogger>(),
        CookieInterceptor()
      ]),
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
          ),
      googleSignInFactory: (scopes) => GoogleSignIn(
        clientId: Platform.isIOS ? googleClientId : null,
        scopes: scopes,
      ),
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
  Provider<FlutterSecureStorage>(
    create: (_) => const FlutterSecureStorage(),
  ),

];

Future<PersistCookieJar> createPersistCookieJar() async {
  try {
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String appDocPath = appDocDir.path;
    final String cookiePath = path.join(appDocPath, "/.cookies");

    await Directory(cookiePath).create(recursive: true);

    return PersistCookieJar(
      ignoreExpires: true,
      storage: FileStorage(cookiePath),
    );
  } catch (e) {
    throw Exception('Failed to create PersistCookieJar: $e');
  }
}
