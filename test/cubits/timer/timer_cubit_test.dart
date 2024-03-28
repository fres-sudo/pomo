import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pomo/cubits/timer/timer_cubit.dart';

void main() {
  late TimerCubit cubit;

  setUp(() {
    cubit = TimerCubit();
  });

  
  /// Testing the method [set]
  group('when the method set is called', () {
    blocTest<TimerCubit, TimerState>(
      'test that TimerCubit emits TimerState.set when set is called',
      setUp: () {
        //TODO: setup the environment
      },
      build: () => cubit,
      act: (cubit) {
        cubit.set();
      },
      expect: () => <TimerState>[
        //TODO: define the emitted TimerState states
      ],
      verify: (_) {
        //TODO: verify that methods are invoked properly
      },
    );
  });
  
}