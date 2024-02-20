import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:pomo/models/user/user.dart';

extension UserFixture on User {
  static UserFixtureFactory factory() => UserFixtureFactory();
}

class UserFixtureFactory extends FixtureFactory<User> {
  @override
  FixtureDefinition<User> definition() => define(
        (faker) => const User(),
  );
}
