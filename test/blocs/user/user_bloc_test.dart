import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pomo/blocs/user/user_bloc.dart';

void main() {
  late UserBloc bloc;

  setUp(() {
    bloc = UserBloc();
  });

  
  /// Testing the event [UpdateUserUserEvent]
  group('when the event UpdateUserUserEvent is added to the BLoC', () {
    blocTest<UserBloc, UserState>(
      'test that UserBloc emits UserState.updating when updateUser is called',
      setUp: () {
        //TODO: setup the environment
      },
      build: () => bloc,
      act: (bloc) {
        bloc.updateUser();
      },
      expect: () => <UserState>[
        //TODO: define the emitted UserState states
      ],
      verify: (_) {
        //TODO: verify that methods are invoked properly
      },
    );
  });
  
}