import 'package:flutter_test/flutter_test.dart';
import 'package:pomo/models/user/user.dart';
import 'package:pomo/repositories/mappers/sign_up_response_mapper.dart';
import 'package:pomo/services/network/responses/sign_up_response/sign_up_response_response.dart';
import '../../fixtures/responses/sign_up_response_response_fixture_factory.dart';

void main() {
  late SignUpResponseMapper mapper;
  late SignUpResponseResponse dto;
  late User model;

  setUp(() {
    dto = SignUpResponseResponseFixture.factory().makeSingle();

    model = const User();
    mapper = const SignUpResponseMapper();
  });

  test('mapping User object from SignUpResponseResponse', () {
    expect(mapper.fromDTO(dto), equals(model));
  });

  test('mapping User to SignUpResponseResponse', () {
    expect(mapper.toDTO(model), equals(dto));
  });
}
