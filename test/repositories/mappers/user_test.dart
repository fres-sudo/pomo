import 'package:flutter_test/flutter_test.dart';
import 'package:pomo/models/user/user.dart';
import 'package:pomo/repositories/mappers/user.dart';
import 'package:pomo/services/network/jto/string/string_jto.dart';
import '../../fixtures/jto/string_jto_fixture_factory.dart';

void main() {
  late User mapper;
  late StringJTO dto;
  late User model;

  setUp(() {
    dto = StringJTOFixture.factory().makeSingle();

    model = User();
    mapper = const User();
  });

  test('mapping User object from StringJTO', () {
    expect(mapper.fromDTO(dto), equals(model));
  });

  test('mapping User to StringJTO', () {
    expect(mapper.toDTO(model), equals(dto));
  });
}
