part of 'dependency_injector.dart';

final List<BlocProvider> _blocs = [
  BlocProvider<AuthCubit>(
    create: (context) => AuthCubit(
      authenticationRepository: context.read(),
    )..checkAuthenticationState(),
  ),
  BlocProvider<ThemeCubit>(
    create: (_) => ThemeCubit(),
  ),
  BlocProvider<SignInBloc>(
    create: (context) => SignInBloc(authenticationRepository: context.read()),
  ),
  BlocProvider<SignUpBloc>(
    create: (context) => SignUpBloc(authenticationRepository: context.read()),
  ),
  BlocProvider<ProjectBloc>(
    create: (context) => ProjectBloc(projectRepository: context.read()),
  ),
  BlocProvider<TaskBloc>(
    create: (context) => TaskBloc(taskRepository: context.read()),
  ),
];
