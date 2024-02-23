import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pomo/blocs/sign_in/sign_in_bloc.dart';

void main() {
  late SignInBloc bloc;

  setUp(() {
    bloc = SignInBloc();
  });

  
  /// Testing the event [PerformSignInEvent]
  group('when the event PerformSignInEvent is added to the BLoC', () {
    blocTest<SignInBloc, SignInState>(
      'test that SignInBloc emits SignInState.notSignedIn when perform is called',
      setUp: () {
        //TODO: setup the environment
      },
      build: () => bloc,
      act: (bloc) {
        bloc.perform();
      },
      expect: () => <SignInState>[
        //TODO: define the emitted SignInState states
      ],
      verify: (_) {
        //TODO: verify that methods are invoked properly
      },
    );
  });
  
}