part of 'dependency_injector.dart';

final List<BlocProvider> _blocs = [
  BlocProvider<ThemeCubit>(
    create: (_) => ThemeCubit(),
  ),
  BlocProvider<SignInBloc>(
    create: (context) => SignInBloc(authenticationRepository: context.read()),
  )
];
