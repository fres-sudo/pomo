import 'package:flutter_test/flutter_test.dart';
import 'package:pomo/models/user/user.dart';
import 'package:pomo/repositories/mappers/user_mapper.dart';
import 'package:pomo/services/network/jto/user/user_jto.dart';
import '../../fixtures/jto/user_jto_fixture_factory.dart';

void main() {
  late UserMapper mapper;
  late UserJTO dto;
  late User model;

  setUp(() {
    dto = UserJTOFixture.factory().makeSingle();

    model = const User();
    mapper = const UserMapper();
  });

  test('mapping User object from UserJTO', () {
    expect(mapper.fromDTO(dto), equals(model));
  });

  test('mapping User to UserJTO', () {
    expect(mapper.toDTO(model), equals(dto));
  });
}
