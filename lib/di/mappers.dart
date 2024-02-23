part of 'dependency_injector.dart';

final List<SingleChildWidget> _mappers = [
  Provider<DTOMapper<UserJTO, User>>(
    create: (_) => const UserMapper(),
  ),
  Provider<Mapper<User, String>>(
    create: (_) => const UserStringMapper(),
  ),


];

