import 'package:flutter/widgets.dart';

// Extension on EdgeInsets to add custom padding sizes
extension CustomEdgeInsets on EdgeInsets {
  // Define padding sizes
  static const double _xs = 4.0;
  static const double _sm = 8.0;
  static const double _md = 16.0;
  static const double _lg = 24.0;
  static const double _xl = 32.0;

  // Padding with equal size on all sides
  static EdgeInsets get XS => EdgeInsets.all(_xs);
  static EdgeInsets get SM => EdgeInsets.all(_sm);
  static EdgeInsets get MD => EdgeInsets.all(_md);
  static EdgeInsets get LG => EdgeInsets.all(_lg);
  static EdgeInsets get XL => EdgeInsets.all(_xl);

  // Padding with symmetric vertical and horizontal sizes
  static EdgeInsets symmetricXS({bool vertical = false, bool horizontal = false}) => EdgeInsets.symmetric(
    vertical: vertical ? _xs : 0.0,
    horizontal: horizontal ? _xs : 0.0,
  );

  static EdgeInsets symmetricSM({bool vertical = false, bool horizontal = false}) => EdgeInsets.symmetric(
    vertical: vertical ? _sm : 0.0,
    horizontal: horizontal ? _sm : 0.0,
  );

  static EdgeInsets symmetricMD({bool vertical = false, bool horizontal = false}) => EdgeInsets.symmetric(
    vertical: vertical ? _md : 0.0,
    horizontal: horizontal ? _md : 0.0,
  );

  static EdgeInsets symmetricLG({bool vertical = false, bool horizontal = false}) => EdgeInsets.symmetric(
    vertical: vertical ? _lg : 0.0,
    horizontal: horizontal ? _lg : 0.0,
  );

  static EdgeInsets symmetricXL({bool vertical = false, bool horizontal = false}) => EdgeInsets.symmetric(
    vertical: vertical ? _xl : 0.0,
    horizontal: horizontal ? _xl : 0.0,
  );

  // Padding with different values for each side
  static EdgeInsets onlyXS({bool left = false, bool top = false, bool right = false, bool bottom = false}) => EdgeInsets.only(
    left: left ? _xs : 0.0,
    top: top ? _xs : 0.0,
    right: right ? _xs : 0.0,
    bottom: bottom ? _xs : 0.0,
  );

  static EdgeInsets onlySM({bool left = false, bool top = false, bool right = false, bool bottom = false}) => EdgeInsets.only(
    left: left ? _sm : 0.0,
    top: top ? _sm : 0.0,
    right: right ? _sm : 0.0,
    bottom: bottom ? _sm : 0.0,
  );

  static EdgeInsets onlyMD({bool left = false, bool top = false, bool right = false, bool bottom = false}) => EdgeInsets.only(
    left: left ? _md : 0.0,
    top: top ? _md : 0.0,
    right: right ? _md : 0.0,
    bottom: bottom ? _md : 0.0,
  );

  static EdgeInsets onlyLG({bool left = false, bool top = false, bool right = false, bool bottom = false}) => EdgeInsets.only(
    left: left ? _lg : 0.0,
    top: top ? _lg : 0.0,
    right: right ? _lg : 0.0,
    bottom: bottom ? _lg : 0.0,
  );

  static EdgeInsets onlyXL({bool left = false, bool top = false, bool right = false, bool bottom = false}) => EdgeInsets.only(
    left: left ? _xl : 0.0,
    top: top ? _xl : 0.0,
    right: right ? _xl : 0.0,
    bottom: bottom ? _xl : 0.0,
  );
}
