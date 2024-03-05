import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:pomo/services/network/jto/project/project_jto.dart';

extension ProjectJTOFixture on ProjectJTO {
  static ProjectJTOFixtureFactory factory() => ProjectJTOFixtureFactory();
}

class ProjectJTOFixtureFactory extends JsonFixtureFactory<ProjectJTO> {
  @override
  FixtureDefinition<ProjectJTO> definition() => define(
        (faker) => const ProjectJTO(),
  );

  @override
  JsonFixtureDefinition<ProjectJTO> jsonDefinition() => defineJson(
      (object) => {},
  );
}
