import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pomo/blocs/task/task_bloc.dart';

void main() {
  late TaskBloc bloc;

  setUp(() {
    bloc = TaskBloc();
  });

  
  /// Testing the event [CreateTaskTaskEvent]
  group('when the event CreateTaskTaskEvent is added to the BLoC', () {
    blocTest<TaskBloc, TaskState>(
      'test that TaskBloc emits TaskState.cretaing when createTask is called',
      setUp: () {
        //TODO: setup the environment
      },
      build: () => bloc,
      act: (bloc) {
        bloc.createTask();
      },
      expect: () => <TaskState>[
        //TODO: define the emitted TaskState states
      ],
      verify: (_) {
        //TODO: verify that methods are invoked properly
      },
    );
  });
  
  /// Testing the event [GetTaskByIdTaskEvent]
  group('when the event GetTaskByIdTaskEvent is added to the BLoC', () {
    blocTest<TaskBloc, TaskState>(
      'test that TaskBloc emits TaskState.cretaing when getTaskById is called',
      setUp: () {
        //TODO: setup the environment
      },
      build: () => bloc,
      act: (bloc) {
        bloc.getTaskById();
      },
      expect: () => <TaskState>[
        //TODO: define the emitted TaskState states
      ],
      verify: (_) {
        //TODO: verify that methods are invoked properly
      },
    );
  });
  
  /// Testing the event [UpdateTaskByIdTaskEvent]
  group('when the event UpdateTaskByIdTaskEvent is added to the BLoC', () {
    blocTest<TaskBloc, TaskState>(
      'test that TaskBloc emits TaskState.cretaing when updateTaskById is called',
      setUp: () {
        //TODO: setup the environment
      },
      build: () => bloc,
      act: (bloc) {
        bloc.updateTaskById();
      },
      expect: () => <TaskState>[
        //TODO: define the emitted TaskState states
      ],
      verify: (_) {
        //TODO: verify that methods are invoked properly
      },
    );
  });
  
  /// Testing the event [DeleteTaskByIdTaskEvent]
  group('when the event DeleteTaskByIdTaskEvent is added to the BLoC', () {
    blocTest<TaskBloc, TaskState>(
      'test that TaskBloc emits TaskState.cretaing when deleteTaskById is called',
      setUp: () {
        //TODO: setup the environment
      },
      build: () => bloc,
      act: (bloc) {
        bloc.deleteTaskById();
      },
      expect: () => <TaskState>[
        //TODO: define the emitted TaskState states
      ],
      verify: (_) {
        //TODO: verify that methods are invoked properly
      },
    );
  });
  
  /// Testing the event [GetTasksByProjectTaskEvent]
  group('when the event GetTasksByProjectTaskEvent is added to the BLoC', () {
    blocTest<TaskBloc, TaskState>(
      'test that TaskBloc emits TaskState.cretaing when getTasksByProject is called',
      setUp: () {
        //TODO: setup the environment
      },
      build: () => bloc,
      act: (bloc) {
        bloc.getTasksByProject();
      },
      expect: () => <TaskState>[
        //TODO: define the emitted TaskState states
      ],
      verify: (_) {
        //TODO: verify that methods are invoked properly
      },
    );
  });
  
}