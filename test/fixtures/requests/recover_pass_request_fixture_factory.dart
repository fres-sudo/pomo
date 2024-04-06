import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:pomo/services/network/requests/recover_pass/recover_pass_request.dart';

extension RecoverPassRequestFixture on RecoverPassRequest {
  static RecoverPassRequestFixtureFactory factory() => RecoverPassRequestFixtureFactory();
}

class RecoverPassRequestFixtureFactory extends JsonFixtureFactory<RecoverPassRequest> {
  @override
  FixtureDefinition<RecoverPassRequest> definition() => define(
        (faker) => const RecoverPassRequest(),
  );

  @override
  JsonFixtureDefinition<RecoverPassRequest> jsonDefinition() => defineJson(
      (object) => {},
  );
}
