part of 'dependency_injector.dart';

final List<BlocProvider> _blocs = [
  BlocProvider<ThemeCubit>(
    create: (_) => ThemeCubit(),
  ),
  BlocProvider<SignInBloc>(
    create: (context) => SignInBloc(authenticationRepository: context.read(), oAuthRepository: context.read()),
  ),
  BlocProvider<SignUpBloc>(
    create: (context) => SignUpBloc(authenticationRepository: context.read()),
  ),
  BlocProvider<UserBloc>(
    create: (context) => UserBloc(userRepository: context.read(), authenticationRepository: context.read()),
  ),
  BlocProvider<AuthCubit>(
    create: (context) => AuthCubit(
      authenticationRepository: context.read(),
    )..checkAuthentication(),
  ),
  BlocProvider<TimerCubit>(
    create: (context) => TimerCubit(),
  ),
  BlocProvider<ProjectBloc>(
    create: (context) => ProjectBloc(projectRepository: context.read()),
  ),
  BlocProvider<TaskBloc>(
    create: (context) => TaskBloc(taskRepository: context.read()),
  ),
  BlocProvider<StatsBloc>(
    create: (context) => StatsBloc(statsRepository: context.read()),
  ),
  BlocProvider<SoundCubit>(
    create: (_) => SoundCubit(),
  ),
  BlocProvider<ScheduleCubit>(
    create: (_) => ScheduleCubit(),
  ),
];
