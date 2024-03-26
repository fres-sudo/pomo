import 'package:flutter_test/flutter_test.dart';
import 'package:pomo/models/project/project.dart';
import 'package:pomo/repositories/mappers/project_mapper.dart';
import 'package:pomo/services/network/jto/project/project_jto.dart';
import '../../fixtures/jto/project_jto_fixture_factory.dart';

void main() {
  late ProjectMapper mapper;
  late ProjectJTO dto;
  late Project model;

  setUp(() {
    dto = ProjectJTOFixture.factory().makeSingle();

    model = const Project();
    mapper = const ProjectMapper();
  });

  test('mapping Project object from ProjectJTO', () {
    expect(mapper.fromDTO(dto), equals(model));
  });

  test('mapping Project to ProjectJTO', () {
    expect(mapper.toDTO(model), equals(dto));
  });
}
