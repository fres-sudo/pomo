import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:io' show Platform;

import '../../cubits/theme/theme_cubit.dart';
import 'custom_popup.dart';



String durationToString(int minutes) {
  var d = Duration(minutes:minutes);
  List<String> parts = d.toString().split(':');
  return '${parts[0].padLeft(2, '')}:${parts[1].padLeft(2, '0')}';
}

Future<String> getUserId() async {
  const storage = FlutterSecureStorage();
  var userData = await storage.read(key: "user_data");
  final Map<String, dynamic> userMap = json.decode(userData!);
  return userMap['_id'];
}

extension DarkMode on BuildContext {
  bool get isDarkMode {
    return watch<ThemeCubit>().state.mode == ThemeMode.dark;
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

Future<void> showPopup(BuildContext context, String title, String description) async {
  return showDialog(context: context,
      builder: (BuildContext context) {
        return CustomPopup(
          title: title,
          text: description,
        );
      }
  );
}

Future<bool?> showConfirmPopup(BuildContext context, String title, String description, VoidCallback onYesPressed) {
  if (kIsWeb || !Platform.isIOS) {
    return showDialog<bool?>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(description),
        actions: <Widget>[
          TextButton(
            child: const Text("Annulla"),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text("Conferma"),
            onPressed: () {
              onYesPressed();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
  else {
    return showCupertinoDialog<bool?>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(description),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
              child: const Text("Annulla"),
              onPressed: () {
                Navigator.pop(context);
              }
          ),
          CupertinoDialogAction(
              isDestructiveAction: true,
              child: const Text("Conferma"),
              onPressed: () {
                onYesPressed();
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}

extension IterableExtensions<E> on Iterable<E> {
  E? firstWhereOrNull(bool Function(E element) test) {
    try {
      return firstWhere(test);
    } catch (e) {
      return null;
    }
  }
}

extension ColorExtension on Color {
  /// Convert the color to a darken color based on the [percent]
  Color darken([int percent = 40]) {
    assert(1 <= percent && percent <= 100);
    final value = 1 - percent / 100;
    return Color.fromARGB(alpha, (red * value).round(), (green * value).round(),
        (blue * value).round());
  }
}

