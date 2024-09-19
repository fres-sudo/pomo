import 'package:logger/logger.dart';

// --- REGEX ----

final emailRegex = RegExp(r'^[\w-\.!]+@([\w-]+\.)+[\w-]{2,4}$');
final nameRegex = RegExp(r'^.{3,}$');
final surnameRegex = RegExp(r'^[\w,.][^0-9_\-!¡?÷¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}$');
final addressRegex =  RegExp(r'^.{3,}$');
final phoneRegex = RegExp(r'^\+\d{12}$');
final landlinePhoneRegex = RegExp(r'^\d+\d+$');
final digitsOnlyRegex = RegExp(r'[^\d]');


const List<String> kSounds = [
  'sounds/garden-vibes-lofi.mp3', // Replace with your actual sound file paths
  'sounds/heavy-rain.mp3',
  'sounds/light-rain.mp3',
  'sounds/lofi-study.mp3',
  'sounds/nature.mp3',
];
const List<String> kBackgroundsImages = [
  'assets/images/garden-lofi-image.jpg',
  'assets/images/rainy-image.jpg',
  'assets/images/rainy-2-image.jpg',
  'assets/images/lofi-image.jpg',
  'assets/images/forest-image.jpg',
];

const googleClientId = "446557214930-ko2r5pjdb94jk2gcv83l8te8rvk8jbmk.apps.googleusercontent.com";
const kServerConnectionIP =
    "http://localhost:9000/api";
    //"https://pomo-fres-sudos-projects.vercel.app/api/v1";
    //"https://pomo.fres.space/api/v1";
const maxTimeExceedRequest = 10;
var logger = Logger(
  printer: PrettyPrinter(
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: false,
  ),
);