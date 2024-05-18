import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:pomo/models/ciaooo/ciaooo.dart';

extension CIAOOOFixture on CIAOOO {
  static CIAOOOFixtureFactory factory() => CIAOOOFixtureFactory();
}

class CIAOOOFixtureFactory extends FixtureFactory<CIAOOO> {
  @override
  FixtureDefinition<CIAOOO> definition() => define(
        (faker) => const CIAOOO(),
  );
}
