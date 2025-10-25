import 'package:flutter/material.dart';

// ----------- C O L O R S -----------

// --- N E U T R A L ---

const Color kNeutral1000 = Color(0xff151515);
const Color kNeutral900 = Color(0xff333333);
const Color kNeutral800 = Color(0xff4d4d4d);
const Color kNeutral700 = Color(0xff666666);
const Color kNeutral600 = Color(0xff808080);
const Color kNeutral500 = Color(0xff999999);
const Color kNeutral400 = Color(0xffb3b3b3);
const Color kNeutral300 = Color(0xffc6c5c8);
const Color kNeutral200 = Color(0xffe6e6e6);
const Color kNeutral100 = Color(0xfff5f5f5);
const Color kNeutral50 = Color(0xfffafafa);
const Color kNeutralWhite = Colors.white;
const Color kNeutralBackground = Colors.white;

// --- P R I M A R Y ---

const Color kPrimary1000 = Color(0xff0a0449);
const Color kPrimary900 = Color(0xff100679);
const Color kPrimary800 = Color(0xff1609a9);
const Color kPrimary700 = Color(0xff1d0cda);
const Color kPrimary600 = Color(0xff3625f3);
const Color kPrimary500 = Color(0xff6255f6);
const Color kPrimary400 = Color(0xff8f86f9);
const Color kPrimary300 = Color(0xffa286f9);
const Color kPrimary200 = Color(0xffb686f9);
const Color kPrimary100 = Color(0xffe2cefc);

// --- G R E E N ---

const Color kGreen800 = Color(0xff204126);
const Color kGreen700 = Color(0xff31633a);
const Color kGreen600 = Color(0xff42854e);
const Color kGreen500 = Color(0xff53a862);
const Color kGreen400 = Color(0xff73ba80);
const Color kGreen300 = Color(0xff95cb9f);
const Color kGreen200 = Color(0xffb7dcbe);
const Color kGreen100 = Color(0xfff1f9f4);

// --- Y E L L O W ---

const Color kYellow800 = Color(0xff79501b);
const Color kYellow700 = Color(0xffa26c25);
const Color kYellow600 = Color(0xffcc872e);
const Color kYellow500 = Color(0xffd9a055);
const Color kYellow400 = Color(0xffe2b67e);
const Color kYellow300 = Color(0xffebcea8);
const Color kYellow200 = Color(0xfff5e5d1);
const Color kYellow100 = Color(0xfffcf7f1);

// --- R E D ---

const Color kRed800 = Color(0xff78150c);
const Color kRed700 = Color(0xffa61d11);
const Color kRed600 = Color(0xffd52516);
const Color kRed500 = Color(0xffea4335);
const Color kRed400 = Color(0xffef6d62);
const Color kRed300 = Color(0xfff39890);
const Color kRed200 = Color(0xfff8c3be);
const Color kRed100 = Color(0xfffef1f0);

// --- S O L I D ---

abstract class SolidColors {
  static const Color deepBlue = Color(0xFF101B2C);
  static const Color darkBlue = Color(0xFF3C43F0);
  static const Color blue = Color(0xFF62D6EE);
  static const Color purple = Color(0xFF7658CC);
  static const Color pink = Color(0xFFED6EF7);
  static const Color darkPink = Color(0xFFEA3C67);
  static const Color orange = Color(0xFFFFD600);
  static const Color lightGreen = Color(0xFFC6FD55);
  static const Color green = Color(0xFFA7E84B);
  static const Color darkGreen = Color(0xFF0A3A17);
}

// --- P A S T E L ---

Color kPastelBlue = const Color(0xff346cf6).withValues(alpha: 0.57);
const Color kPastelYellow = Color(0xfffef2c4);
Color kPastelPurple = const Color(0xff346cf6).withValues(alpha: 0.15);

// --- G R A D I E N T S ---

const LinearGradient kGradientPurple1 = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [Color(0xff6255f6), Color(0x006255f6)],
);
const LinearGradient kGradientPurple2 = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color(0xff6255f6), Color(0x006255f6)],
);
const LinearGradient kGradientPurple3 = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color(0xff6255f6), Color(0xffae8bfa)],
);

// --- S K E L E T O N ---

Color kSkeleton = const Color(0xff000000).withValues(alpha: 0.2);
