import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/components/widgets/pulsing_button.dart';
import 'package:pomo/constants/colors.dart';
import '../../constants/constants.dart';
import '../../cubits/sound_cubit.dart';

class SoundPlayer extends StatefulWidget {
  @override
  _SoundPlayerState createState() => _SoundPlayerState();
}

class _SoundPlayerState extends State<SoundPlayer> {
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void playSound(int index) async {
    if (index == kSounds.length) {
      await audioPlayer.stop();
    } else {
      await audioPlayer.setReleaseMode(ReleaseMode.loop);
      await audioPlayer.play(AssetSource(kSounds[index]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SoundCubit, int>(
      listener: (context, currentIndex) => playSound(currentIndex),
      builder: (context, currentIndex) => PulsingButton(
        onLongPress: () => context.read<SoundCubit>().stopSound(),
        onTap: () => context.read<SoundCubit>().nextSound(),
        disabled: currentIndex == kSounds.length,
        pulseColor: Theme.of(context).colorScheme.onSecondary.withValues(alpha: 0.2),
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: kNeutralWhite),
            image: currentIndex == kSounds.length
                ? null
                : DecorationImage(image: Image.asset(kBackgroundsImages[currentIndex]).image, fit: BoxFit.cover),
          ),
          child: currentIndex != kSounds.length ? const SizedBox() : const Icon(Icons.music_note_outlined),
        ),
      ),
    );
  }
}
