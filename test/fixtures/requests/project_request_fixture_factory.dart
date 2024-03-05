import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:pomo/services/network/requests/project/project_request.dart';

extension ProjectRequestFixture on ProjectRequest {
  static ProjectRequestFixtureFactory factory() => ProjectRequestFixtureFactory();
}

class ProjectRequestFixtureFactory extends JsonFixtureFactory<ProjectRequest> {
  @override
  FixtureDefinition<ProjectRequest> definition() => define(
        (faker) => const ProjectRequest(),
  );

  @override
  JsonFixtureDefinition<ProjectRequest> jsonDefinition() => defineJson(
      (object) => {},
  );
}
