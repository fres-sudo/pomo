import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:pomo/services/network/requests/forgot_pass/forgot_pass_request.dart';

extension ForgotPassRequestFixture on ForgotPassRequest {
  static ForgotPassRequestFixtureFactory factory() => ForgotPassRequestFixtureFactory();
}

class ForgotPassRequestFixtureFactory extends JsonFixtureFactory<ForgotPassRequest> {
  @override
  FixtureDefinition<ForgotPassRequest> definition() => define(
        (faker) => const ForgotPassRequest(),
  );

  @override
  JsonFixtureDefinition<ForgotPassRequest> jsonDefinition() => defineJson(
      (object) => {},
  );
}
