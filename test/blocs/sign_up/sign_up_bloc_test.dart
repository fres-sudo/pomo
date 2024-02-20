import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pomo/blocs/sign_up/sign_up_bloc.dart';

void main() {
  late SignUpBloc bloc;

  setUp(() {
    bloc = SignUpBloc();
  });

  
  /// Testing the event [PerformSignUpEvent]
  group('when the event PerformSignUpEvent is added to the BLoC', () {
    blocTest<SignUpBloc, SignUpState>(
      'test that SignUpBloc emits SignUpState.performing when perform is called',
      setUp: () {
        //TODO: setup the environment
      },
      build: () => bloc,
      act: (bloc) {
        bloc.perform();
      },
      expect: () => <SignUpState>[
        //TODO: define the emitted SignUpState states
      ],
      verify: (_) {
        //TODO: verify that methods are invoked properly
      },
    );
  });
  
}