import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:pomo/services/network/responses/sign_up/sign_up_response.dart';

extension SignUpResponseFixture on SignUpResponse {
  static SignUpResponseFixtureFactory factory() => SignUpResponseFixtureFactory();
}

class SignUpResponseFixtureFactory extends JsonFixtureFactory<SignUpResponse> {
  @override
  FixtureDefinition<SignUpResponse> definition() => define(
        (faker) => const SignUpResponse(),
  );

  @override
  JsonFixtureDefinition<SignUpResponse> jsonDefinition() => defineJson(
      (object) => {},
  );
}
