import 'package:flutter/material.dart';

class NameValidProvider extends ChangeNotifier {
  bool? _nameIsValid;

  bool? getNameIsValid() {
    return _nameIsValid;
  }

  void updateNameIsValid(bool isValid) {
    _nameIsValid = isValid;
    notifyListeners();
  }

  void resetNameIsValid() {
    _nameIsValid = null;
    notifyListeners();
  }

}
