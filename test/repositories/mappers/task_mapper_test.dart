import 'package:flutter_test/flutter_test.dart';
import 'package:pomo/models/task/task.dart';
import 'package:pomo/repositories/mappers/task_mapper.dart';
import 'package:pomo/services/network/jto/task/task_jto.dart';
import '../../fixtures/jto/task_jto_fixture_factory.dart';

void main() {
  late TaskMapper mapper;
  late TaskJTO dto;
  late Task model;

  setUp(() {
    dto = TaskJTOFixture.factory().makeSingle();

    model = Task();
    mapper = const TaskMapper();
  });

  test('mapping Task object from TaskJTO', () {
    expect(mapper.fromDTO(dto), equals(model));
  });

  test('mapping Task to TaskJTO', () {
    expect(mapper.toDTO(model), equals(dto));
  });
}
