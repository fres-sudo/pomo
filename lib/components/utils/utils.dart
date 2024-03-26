import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:io' show Platform;

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
  /// is dark mode currently enabled?
  bool get isDarkMode {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
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
/*
PhoneNumber seperatePhoneAndDialCode(String number) {
  Map<String, dynamic> foundedCountry = {};
  for (var country in Countries.allCountries) {
    String dialCode = country["dial_code"].toString();
    if (number.contains(dialCode)) {
      foundedCountry = country;
    }
  }

  if (foundedCountry.isNotEmpty) {
    var newPhoneNumber = number.substring(
      foundedCountry["dial_code"]!.length,
    );
    return PhoneNumber(isoCode: foundedCountry["code"], nsn: newPhoneNumber);
  } else {
    return PhoneNumber(isoCode: IsoCode.IT, nsn: number);
  }
}
*/
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
/*
String? statusToEnum({required String? status}) {
  if (status?.toLowerCase() == "TO_CALL".toLowerCase()) {
    return 'Da chiamare';
  } else if (status?.toLowerCase() == "TO_RECALL".toLowerCase()) {
    return 'Da richiamare';
  } else if (status?.toLowerCase() == "APPOINTMENT".toLowerCase()) {
    return 'Appuntamento';
  } else if (status?.toLowerCase() == "NOT_INTERESTED".toLowerCase()) {
    return 'Non Interessato';
  } else if (status?.toLowerCase() == "COMPLETED".toLowerCase()) {
    return 'Completato';
  } else if (status?.toLowerCase() == "CLOSED".toLowerCase()) {
    return 'Chiuso';
  }
  return null;
}

Color colorFromStatus({required String? status}) {

  return  status != null &&
      status == "TO_CALL" ? kBlue
      : status == "TO_RECALL" ? kAlertsWaringDark
      : status == "CALLING" ? kAlertsErrorBase
      : status == "APPOINTMENT" ? kPortage
      : status == "COMPLETED" ? kAlertSuccessBaseGreen
      : status == "NOT_INTERESTED" ? kGreyScale900
      : status == "CLOSED" ? kGreyScale900
      : kGreyScale900;
}

Color backgroundColorFromStatus({required String? status}) {

  return status != null &&
      status == "TO_CALL" ? kLightBlue
      : status == "TO_RECALL" ? kSecondary200
      : status == "CALLING" ? kAlertsErrorLight
      : status == "APPOINTMENT" ? kPortageLight
      : status == "COMPLETED" ? kPrimaryTwo100
      : status == "NOT_INTERESTED" ? kGreyScale100
      : status == "CLOSED" ? kGreyScale100
      : kWhite;

}

String textFromStatus({required String? status}) {

  return status != null &&
      status == "TO_CALL" ? 'DA CHIAMARE'
      : status == "TO_RECALL" ? "DA RICHIAMARE "
      : status == "CALLING" ? "IN CORSO..."
      : status == "NOT_INTERESTED" ? "NON INTERESSATO"
      : status == "APPOINTMENT" ? "APPUNTAMENTO"
      : status == "COMPLETED" ? "COMPLETATA"
      : status == "CLOSED" ? "CHIUSO"
      : "Non disponibile";
}
*/

