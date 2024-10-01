import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:pomo/services/network/responses/refresh_token/refresh_token_response.dart';

extension RefreshTokenResponseFixture on RefreshTokenResponse {
  static RefreshTokenResponseFixtureFactory factory() => RefreshTokenResponseFixtureFactory();
}

class RefreshTokenResponseFixtureFactory extends JsonFixtureFactory<RefreshTokenResponse> {
  @override
  FixtureDefinition<RefreshTokenResponse> definition() => define(
        (faker) => const RefreshTokenResponse(),
  );

  @override
  JsonFixtureDefinition<RefreshTokenResponse> jsonDefinition() => defineJson(
      (object) => {},
  );
}
