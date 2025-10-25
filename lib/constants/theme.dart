import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:pomo/constants/device.dart';

abstract final class AppTheme {
  static const scheme = FlexScheme.blackWhite;
  static const subThemesData = FlexSubThemesData(
    interactionEffects: true,
    tintedDisabledControls: true,
    useM2StyleDividerInM3: true,
    splashType: FlexSplashType.inkSparkle,
    filledButtonRadius: 40.0,
    inputDecoratorIsFilled: true,
    inputDecoratorUnfocusedHasBorder: false,
    inputDecoratorRadius: Sizes.borderRadius,
    inputDecoratorBorderType: FlexInputBorderType.outline,
    alignedDropdown: true,
    navigationRailUseIndicator: true,
  );

  static final visualDensity = FlexColorScheme.comfortablePlatformDensity;
  static const cupertinoOverrideTheme =
      CupertinoThemeData(applyThemeToAll: true);

  // The FlexColorScheme defined light mode ThemeData.
  static ThemeData light = FlexThemeData.light(
      scheme: scheme,
      subThemesData: subThemesData,
      visualDensity: visualDensity,
      cupertinoOverrideTheme: cupertinoOverrideTheme);

  // The FlexColorScheme defined dark mode ThemeData.
  static ThemeData dark = FlexThemeData.dark(
      scheme: scheme,
      subThemesData: subThemesData,
      visualDensity: visualDensity,
      cupertinoOverrideTheme: cupertinoOverrideTheme);
}

TextTheme textTheme = GoogleFonts.interTightTextTheme();
