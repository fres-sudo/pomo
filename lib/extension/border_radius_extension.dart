import 'package:flutter/widgets.dart';

// Extension on BorderRadius to add custom sizes
extension CustomBorderRadius on BorderRadius {
  static const double _xs = 4.0;
  static const double _sm = 8.0;
  static const double _md = 16.0;
  static const double _lg = 20.0;
  static const double _xl = 32.0;

  static BorderRadius get XS => BorderRadius.circular(_xs);
  static BorderRadius get SM => BorderRadius.circular(_sm);
  static BorderRadius get MD => BorderRadius.circular(_md);
  static BorderRadius get LG => BorderRadius.circular(_lg);
  static BorderRadius get XL => BorderRadius.circular(_xl);
}
