import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pomo/cubits/auth/auth_cubit.dart';

void main() {
  late AuthCubit cubit;

  setUp(() {
    cubit = AuthCubit();
  });

  
  /// Testing the method [checkAutenticationState]
  group('when the method checkAutenticationState is called', () {
    blocTest<AuthCubit, AuthState>(
      'test that AuthCubit emits AuthState.authenticated when checkAutenticationState is called',
      setUp: () {
        //TODO: setup the environment
      },
      build: () => cubit,
      act: (cubit) {
        cubit.checkAutenticationState();
      },
      expect: () => <AuthState>[
        //TODO: define the emitted AuthState states
      ],
      verify: (_) {
        //TODO: verify that methods are invoked properly
      },
    );
  });
  
  /// Testing the method [authenticated]
  group('when the method authenticated is called', () {
    blocTest<AuthCubit, AuthState>(
      'test that AuthCubit emits AuthState.authenticated when authenticated is called',
      setUp: () {
        //TODO: setup the environment
      },
      build: () => cubit,
      act: (cubit) {
        cubit.authenticated();
      },
      expect: () => <AuthState>[
        //TODO: define the emitted AuthState states
      ],
      verify: (_) {
        //TODO: verify that methods are invoked properly
      },
    );
  });
  
  /// Testing the method [signOut]
  group('when the method signOut is called', () {
    blocTest<AuthCubit, AuthState>(
      'test that AuthCubit emits AuthState.authenticated when signOut is called',
      setUp: () {
        //TODO: setup the environment
      },
      build: () => cubit,
      act: (cubit) {
        cubit.signOut();
      },
      expect: () => <AuthState>[
        //TODO: define the emitted AuthState states
      ],
      verify: (_) {
        //TODO: verify that methods are invoked properly
      },
    );
  });
  
}