part of 'dependency_injector.dart';

final List<RepositoryProvider> _repositories = [
  RepositoryProvider<AuthenticationRepository>(create: (context) {
    final authenticationRepository = AuthenticationRepositoryImpl(
      signUpMapper: context.read(),
      signInMapper: context.read(),
      secureStorage: context.read(),
      authenticationService: context.read(),
      userStringMapper: context.read(),
    );

    context.read<Dio>().interceptors.insert(
          0,
          AuthInterceptor(
            authenticationRepository: authenticationRepository,
          ),
        );

    return authenticationRepository;
  }),
];
