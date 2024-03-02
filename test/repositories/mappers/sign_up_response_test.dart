import 'package:flutter_test/flutter_test.dart';
import 'package:pomo/models/sign_up/sign_up.dart';
import 'package:pomo/repositories/mappers/sign_up_response.dart';
import 'package:pomo/services/network/responses/user/user_response.dart';
import '../../fixtures/responses/user_response_fixture_factory.dart';

void main() {
  late SignUpResponse mapper;
  late UserResponse dto;
  late SignUp model;

  setUp(() {
    dto = UserResponseFixture.factory().makeSingle();

    model = SignUp();
    mapper = const SignUpResponse();
  });

  test('mapping SignUp object from UserResponse', () {
    expect(mapper.fromDTO(dto), equals(model));
  });

  test('mapping SignUp to UserResponse', () {
    expect(mapper.toDTO(model), equals(dto));
  });
}
