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
  RepositoryProvider<ProjectRepository>(create: (context) {
    final projectRepository = ProjectRepositoryImpl(
      taskMapper: context.read(),
      projectMapper: context.read(),
      projectService: context.read(),
      userMapper: context.read(),
    );
    return projectRepository;
  }),
  RepositoryProvider<TaskRepository>(create: (context) {
    final taskRepository = TaskRepositoryImpl(
      taskMapper: context.read(),
      projectMapper: context.read(),
      taskService: context.read(),
    );
    return taskRepository;
  }),
];
