import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:pomo/services/network/responses/project/project_response.dart';

extension ProjectResponseFixture on ProjectResponse {
  static ProjectResponseFixtureFactory factory() => ProjectResponseFixtureFactory();
}

class ProjectResponseFixtureFactory extends JsonFixtureFactory<ProjectResponse> {
  @override
  FixtureDefinition<ProjectResponse> definition() => define(
        (faker) => const ProjectResponse(),
  );

  @override
  JsonFixtureDefinition<ProjectResponse> jsonDefinition() => defineJson(
      (object) => {},
  );
}
