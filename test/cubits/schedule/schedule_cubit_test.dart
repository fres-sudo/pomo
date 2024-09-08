import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pomo/cubits/schedule/schedule_cubit.dart';

void main() {
  late ScheduleCubit cubit;

  setUp(() {
    cubit = ScheduleCubit();
  });

  
  /// Testing the method [setCalendarFormat]
  group('when the method setCalendarFormat is called', () {
    blocTest<ScheduleCubit, ScheduleState>(
      'test that ScheduleCubit emits ScheduleState.initial when setCalendarFormat is called',
      setUp: () {
        //TODO: setup the environment
      },
      build: () => cubit,
      act: (cubit) {
        cubit.setCalendarFormat();
      },
      expect: () => <ScheduleState>[
        //TODO: define the emitted ScheduleState states
      ],
      verify: (_) {
        //TODO: verify that methods are invoked properly
      },
    );
  });
  
  /// Testing the method [setTasks]
  group('when the method setTasks is called', () {
    blocTest<ScheduleCubit, ScheduleState>(
      'test that ScheduleCubit emits ScheduleState.initial when setTasks is called',
      setUp: () {
        //TODO: setup the environment
      },
      build: () => cubit,
      act: (cubit) {
        cubit.setTasks();
      },
      expect: () => <ScheduleState>[
        //TODO: define the emitted ScheduleState states
      ],
      verify: (_) {
        //TODO: verify that methods are invoked properly
      },
    );
  });
  
  /// Testing the method [onDaySelected]
  group('when the method onDaySelected is called', () {
    blocTest<ScheduleCubit, ScheduleState>(
      'test that ScheduleCubit emits ScheduleState.initial when onDaySelected is called',
      setUp: () {
        //TODO: setup the environment
      },
      build: () => cubit,
      act: (cubit) {
        cubit.onDaySelected();
      },
      expect: () => <ScheduleState>[
        //TODO: define the emitted ScheduleState states
      ],
      verify: (_) {
        //TODO: verify that methods are invoked properly
      },
    );
  });
  
}