import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:pomo/services/network/requests/sign_up/sign_up_request.dart';

extension SignUpRequestFixture on SignUpRequest {
  static SignUpRequestFixtureFactory factory() => SignUpRequestFixtureFactory();
}

class SignUpRequestFixtureFactory extends JsonFixtureFactory<SignUpRequest> {
  @override
  FixtureDefinition<SignUpRequest> definition() => define(
        (faker) => const SignUpRequest(),
  );

  @override
  JsonFixtureDefinition<SignUpRequest> jsonDefinition() => defineJson(
      (object) => {},
  );
}
