import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:pomo/models/task/task.dart';

extension TaskFixture on Task {
  static TaskFixtureFactory factory() => TaskFixtureFactory();
}

class TaskFixtureFactory extends FixtureFactory<Task> {
  @override
  FixtureDefinition<Task> definition() => define(
        (faker) => const Task(),
  );
}
