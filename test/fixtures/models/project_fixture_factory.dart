import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:pomo/models/project/project.dart';

extension ProjectFixture on Project {
  static ProjectFixtureFactory factory() => ProjectFixtureFactory();
}

class ProjectFixtureFactory extends FixtureFactory<Project> {
  @override
  FixtureDefinition<Project> definition() => define(
        (faker) => const Project(),
  );
}
