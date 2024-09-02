import 'package:bloc/bloc.dart';

class SoundCubit extends Cubit<int> {
  SoundCubit() : super(-1); // Start with -1 for no sound state

  void nextSound(int totalSounds) {
    emit((state + 1) % (totalSounds + 1)); // Cycle through sounds including the no sound state
  }
}
