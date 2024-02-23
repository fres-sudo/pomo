import 'package:flutter_test/flutter_test.dart';
import 'package:pomo/models/string/string.dart';
import 'package:pomo/repositories/mappers/user_string_mapper.dart';
import 'package:pomo/services/network/jto/user/user_jto.dart';
import '../../fixtures/jto/user_jto_fixture_factory.dart';

void main() {
  late UserStringMapper mapper;
  late UserJTO dto;
  late String model;

  setUp(() {
    dto = UserJTOFixture.factory().makeSingle();

    model = String();
    mapper = const UserStringMapper();
  });

  test('mapping String object from UserJTO', () {
    expect(mapper.fromDTO(dto), equals(model));
  });

  test('mapping String to UserJTO', () {
    expect(mapper.toDTO(model), equals(dto));
  });
}
