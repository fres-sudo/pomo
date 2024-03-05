import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:pomo/services/network/jto/task/task_jto.dart';

extension TaskJTOFixture on TaskJTO {
  static TaskJTOFixtureFactory factory() => TaskJTOFixtureFactory();
}

class TaskJTOFixtureFactory extends JsonFixtureFactory<TaskJTO> {
  @override
  FixtureDefinition<TaskJTO> definition() => define(
        (faker) => const TaskJTO(),
  );

  @override
  JsonFixtureDefinition<TaskJTO> jsonDefinition() => defineJson(
      (object) => {},
  );
}
