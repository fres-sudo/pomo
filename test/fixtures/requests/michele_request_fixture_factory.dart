import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:pomo/services/network/requests/michele/michele_request.dart';

extension MicheleRequestFixture on MicheleRequest {
  static MicheleRequestFixtureFactory factory() => MicheleRequestFixtureFactory();
}

class MicheleRequestFixtureFactory extends JsonFixtureFactory<MicheleRequest> {
  @override
  FixtureDefinition<MicheleRequest> definition() => define(
        (faker) => const MicheleRequest(),
  );

  @override
  JsonFixtureDefinition<MicheleRequest> jsonDefinition() => defineJson(
      (object) => {},
  );
}
