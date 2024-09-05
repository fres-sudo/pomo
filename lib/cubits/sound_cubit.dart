import 'package:bloc/bloc.dart';
import '../../constants/constants.dart';

class SoundCubit extends Cubit<int> {
  SoundCubit() : super(kSounds.length); // Start with no sound state

  void nextSound() {
    emit((state + 1) % (kSounds.length + 1));
  }

  void stopSound() {
    emit(kSounds.length);
  }
}