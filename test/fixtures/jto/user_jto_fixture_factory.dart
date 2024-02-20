import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:pomo/services/network/jto/user/user_jto.dart';

extension UserJTOFixture on UserJTO {
  static UserJTOFixtureFactory factory() => UserJTOFixtureFactory();
}

class UserJTOFixtureFactory extends JsonFixtureFactory<UserJTO> {
  @override
  FixtureDefinition<UserJTO> definition() => define(
        (faker) => const UserJTO(),
  );

  @override
  JsonFixtureDefinition<UserJTO> jsonDefinition() => defineJson(
      (object) => {},
  );
}
