import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/sound_cubit.dart';

class SoundPlayer extends StatelessWidget {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final List<String> _sounds = [
    'sounds/garden-vibes-lofi.mp3', // Replace with your actual sound file paths
    'sounds/heavy-rain.mp3',
    'sounds/light-rain.mp3',
    'sounds/lofi-study.mp3',
    'sounds/nature.mp3',
  ];

  void _playSound(int index) async {
    if (index == -1) {
      await _audioPlayer.stop(); // Stop the sound if index is -1 (no sound state)
    } else {
      await _audioPlayer.play(AssetSource(_sounds[index])); // Use AssetSource for asset files
    }
  }

  @override
  Widget build(BuildContext context) {
    print("AUDIO: ${_audioPlayer.state}" );
    return BlocProvider(
        create: (context) => SoundCubit(),
        child: BlocBuilder<SoundCubit, int>(
          builder: (context, currentIndex) {
            _playSound(currentIndex); // Play the corresponding sound on each state change
            return Center(
              child: IconButton(
                  onPressed: () => context.read<SoundCubit>().nextSound(_sounds.length),
                  icon: Icon(Icons.music_note_outlined)),
            );
          },
        ));
  }
}
