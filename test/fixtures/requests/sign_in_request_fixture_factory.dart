import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:pomo/services/network/requests/sign_in/sign_in_request.dart';

extension SignInRequestFixture on SignInRequest {
  static SignInRequestFixtureFactory factory() => SignInRequestFixtureFactory();
}

class SignInRequestFixtureFactory extends JsonFixtureFactory<SignInRequest> {
  @override
  FixtureDefinition<SignInRequest> definition() => define(
        (faker) => const SignInRequest(email: '', password: ''),
  );

  @override
  JsonFixtureDefinition<SignInRequest> jsonDefinition() => defineJson(
      (object) => {},
  );
}
