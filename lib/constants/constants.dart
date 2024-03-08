import 'package:logger/logger.dart';

// --- REGEX ----

final emailRegex = RegExp(r'^[\w-\.!]+@([\w-]+\.)+[\w-]{2,4}$');
final nameRegex = RegExp(r'^.{3,}$');
final surnameRegex = RegExp(r'^[\w,.][^0-9_\-!¡?÷¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}$');
final addressRegex =  RegExp(r'^.{3,}$');
final phoneRegex = RegExp(r'^\+\d{12}$');
final landlinePhoneRegex = RegExp(r'^\d+\d+$');


const kServerConnectionIP = "http://127.0.0.1:3000/api/v1";
const maxTimeExceedRequest = 10;
var logger = Logger(
  printer: PrettyPrinter(
      methodCount: 2, // Number of method calls to be displayed
      errorMethodCount: 8, // Number of method calls if stacktrace is provided
      lineLength: 120, // Width of the output
      colors: false, // Colorful log messages
      printEmojis: false, // Print an emoji for each log message
      printTime: true // Should each log print contain a timestamp
  ),
);