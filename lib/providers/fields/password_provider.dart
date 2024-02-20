import 'package:flutter/material.dart';

class PasswordValidProvider extends ChangeNotifier {
  bool? _passwordIsValid;

  bool? getPasswordIsValid() {
    return _passwordIsValid;
  }

  void updatePasswordIsValid(bool isValid) {
    _passwordIsValid = isValid;
    notifyListeners();
  }

  void resetPasswordIsValid() {
    _passwordIsValid = null;
    notifyListeners();
  }
}
