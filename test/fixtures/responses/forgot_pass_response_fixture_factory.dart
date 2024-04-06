import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:pomo/services/network/responses/forgot_pass/forgot_pass_response.dart';

extension ForgotPassResponseFixture on ForgotPassResponse {
  static ForgotPassResponseFixtureFactory factory() => ForgotPassResponseFixtureFactory();
}

class ForgotPassResponseFixtureFactory extends JsonFixtureFactory<ForgotPassResponse> {
  @override
  FixtureDefinition<ForgotPassResponse> definition() => define(
        (faker) => const ForgotPassResponse(),
  );

  @override
  JsonFixtureDefinition<ForgotPassResponse> jsonDefinition() => defineJson(
      (object) => {},
  );
}
