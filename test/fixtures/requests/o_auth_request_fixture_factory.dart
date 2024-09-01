import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:pomo/services/network/requests/o_auth/o_auth_request.dart';

extension OAuthRequestFixture on OAuthRequest {
  static OAuthRequestFixtureFactory factory() => OAuthRequestFixtureFactory();
}

class OAuthRequestFixtureFactory extends JsonFixtureFactory<OAuthRequest> {
  @override
  FixtureDefinition<OAuthRequest> definition() => define(
        (faker) => const OAuthRequest(),
  );

  @override
  JsonFixtureDefinition<OAuthRequest> jsonDefinition() => defineJson(
      (object) => {},
  );
}
