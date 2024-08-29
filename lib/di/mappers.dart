part of 'dependency_injector.dart';

final List<SingleChildWidget> _mappers = [
  Provider<DTOMapper<UserJTO, User>>(
    create: (_) => const UserMapper(),
  ),
  Provider<Mapper<User, String>>(
    create: (_) => const UserStringMapper(),
  ),
  Provider<DTOMapper<SignUpResponse, User>>(
    create: (_) => const SignUpResponseMapper(),
  ),
  Provider<DTOMapper<TaskJTO, Task>>(
    create: (context) => TaskMapper(userMapper: context.read()),
  ),
  Provider<DTOMapper<ProjectJTO, Project>>(
    create: (context) =>
        ProjectMapper(userMapper: context.read(), taskMapper: context.read()),
  ),
  Provider<DTOMapper<StatsJTO, Stats>>(
    create: (_) => StatsMapper(),
  ),
];
