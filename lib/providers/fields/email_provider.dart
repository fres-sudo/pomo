import 'package:flutter/material.dart';

class EmailValidProvider extends ChangeNotifier {
  bool? _emailIsValid;

  bool? getEmailIsValid() {
    return _emailIsValid;
  }

  void updateEmailIsValid(bool isValid) {
    _emailIsValid = isValid;
    notifyListeners();
  }

  void resetEmailIsValid() {
    _emailIsValid = null;
    notifyListeners();
  }
}
