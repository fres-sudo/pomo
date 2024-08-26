import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:pomo/services/network/requests/wrapper/wrapper_request.dart';

extension WrapperRequestFixture on WrapperRequest {
  static WrapperRequestFixtureFactory factory() => WrapperRequestFixtureFactory();
}

class WrapperRequestFixtureFactory extends JsonFixtureFactory<WrapperRequest> {
  @override
  FixtureDefinition<WrapperRequest> definition() => define(
        (faker) => const WrapperRequest(),
  );

  @override
  JsonFixtureDefinition<WrapperRequest> jsonDefinition() => defineJson(
      (object) => {},
  );
}
