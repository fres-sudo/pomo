import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pomo/blocs/project/project_bloc.dart';

void main() {
  late ProjectBloc bloc;

  setUp(() {
    bloc = ProjectBloc();
  });

  
  /// Testing the event [GetProjectsByUserProjectEvent]
  group('when the event GetProjectsByUserProjectEvent is added to the BLoC', () {
    blocTest<ProjectBloc, ProjectState>(
      'test that ProjectBloc emits ProjectState.fetching when getProjectsByUser is called',
      setUp: () {
        //TODO: setup the environment
      },
      build: () => bloc,
      act: (bloc) {
        bloc.getProjectsByUser();
      },
      expect: () => <ProjectState>[
        //TODO: define the emitted ProjectState states
      ],
      verify: (_) {
        //TODO: verify that methods are invoked properly
      },
    );
  });
  
  /// Testing the event [CreateProjectProjectEvent]
  group('when the event CreateProjectProjectEvent is added to the BLoC', () {
    blocTest<ProjectBloc, ProjectState>(
      'test that ProjectBloc emits ProjectState.fetching when createProject is called',
      setUp: () {
        //TODO: setup the environment
      },
      build: () => bloc,
      act: (bloc) {
        bloc.createProject();
      },
      expect: () => <ProjectState>[
        //TODO: define the emitted ProjectState states
      ],
      verify: (_) {
        //TODO: verify that methods are invoked properly
      },
    );
  });
  
  /// Testing the event [GetProjectByIdProjectEvent]
  group('when the event GetProjectByIdProjectEvent is added to the BLoC', () {
    blocTest<ProjectBloc, ProjectState>(
      'test that ProjectBloc emits ProjectState.fetching when getProjectById is called',
      setUp: () {
        //TODO: setup the environment
      },
      build: () => bloc,
      act: (bloc) {
        bloc.getProjectById();
      },
      expect: () => <ProjectState>[
        //TODO: define the emitted ProjectState states
      ],
      verify: (_) {
        //TODO: verify that methods are invoked properly
      },
    );
  });
  
  /// Testing the event [UpdateProjectByIdProjectEvent]
  group('when the event UpdateProjectByIdProjectEvent is added to the BLoC', () {
    blocTest<ProjectBloc, ProjectState>(
      'test that ProjectBloc emits ProjectState.fetching when updateProjectById is called',
      setUp: () {
        //TODO: setup the environment
      },
      build: () => bloc,
      act: (bloc) {
        bloc.updateProjectById();
      },
      expect: () => <ProjectState>[
        //TODO: define the emitted ProjectState states
      ],
      verify: (_) {
        //TODO: verify that methods are invoked properly
      },
    );
  });
  
  /// Testing the event [DeleteProjectByIdProjectEvent]
  group('when the event DeleteProjectByIdProjectEvent is added to the BLoC', () {
    blocTest<ProjectBloc, ProjectState>(
      'test that ProjectBloc emits ProjectState.fetching when deleteProjectById is called',
      setUp: () {
        //TODO: setup the environment
      },
      build: () => bloc,
      act: (bloc) {
        bloc.deleteProjectById();
      },
      expect: () => <ProjectState>[
        //TODO: define the emitted ProjectState states
      ],
      verify: (_) {
        //TODO: verify that methods are invoked properly
      },
    );
  });
  
}