import 'package:flutter/material.dart';

enum SizeType { XS, SM, MD, LG, XL }

class Gap {
  // Define an enum for different sizes

  // Define the sizes in pixels
  static const Map<SizeType, double> _sizes = {
    SizeType.XS: 6.0,
    SizeType.SM: 8.0,
    SizeType.MD: 20.0,
    SizeType.LG: 28.0,
    SizeType.XL: 32.0,
  };

  // A method that returns a SizedBox with the height or width for the given size
  static SizedBox box({
    SizeType size = SizeType.MD, // Default size is MD
    bool isHorizontal = false, // Set to true if you need a horizontal SizedBox (width)
  }) {
    final double value = _sizes[size] ?? 0.0;
    return isHorizontal ? SizedBox(width: value) : SizedBox(height: value);
  }

  // Quick access methods for vertical SizedBoxes
  static SizedBox get XS => box(size: SizeType.XS);

  static SizedBox get SM => box(size: SizeType.SM);

  static SizedBox get MD => box(size: SizeType.MD);

  static SizedBox get LG => box(size: SizeType.LG);

  static SizedBox get XL => box(size: SizeType.XL);

  // Quick access methods for horizontal SizedBoxes
  static SizedBox get XS_H => box(size: SizeType.XS, isHorizontal: true);

  static SizedBox get SM_H => box(size: SizeType.SM, isHorizontal: true);

  static SizedBox get MD_H => box(size: SizeType.MD, isHorizontal: true);

  static SizedBox get LG_H => box(size: SizeType.LG, isHorizontal: true);

  static SizedBox get XL_H => box(size: SizeType.XL, isHorizontal: true);
}
