import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo/constants/colors.dart';

class LightTheme {
  static get make =>
      ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: kNeutral50,
          cardColor: Colors.white,
          dividerColor: kNeutral100,
          textTheme: textTheme,
          colorScheme: ColorScheme.light(onSurface: kNeutral900),
          radioTheme: RadioThemeData(
            overlayColor: MaterialStateProperty.resolveWith((states) {
              // If the button is pressed, return green, otherwise blue
              if (states.contains(MaterialState.selected)) {
                return kPrimary500;
              }
              return kPrimary500;
            }),
            fillColor: MaterialStateProperty.resolveWith((states) {
              // If the button is pressed, return green, otherwise blue
              if (states.contains(MaterialState.selected)) {
                return kPrimary500;
              }
              return kPrimary500;
            }),
          ),
          bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: kNeutral900),
          checkboxTheme: CheckboxThemeData(
            splashRadius: 5,
            side: const BorderSide(
              color: kNeutral400,
            ),
            checkColor: MaterialStateProperty.resolveWith((states) {
              // If the button is pressed, return green, otherwise blue
              if (states.contains(MaterialState.selected)) {
                return kNeutral100;
              }
              return kNeutral100;
            }),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedIconTheme: IconThemeData(color: kPrimary500),
              unselectedIconTheme: IconThemeData(
                color: Colors.black,
              ),
              type: BottomNavigationBarType.fixed,
              enableFeedback: false,
              elevation: 0.0,
              selectedLabelStyle: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  color: kPrimary500),
              unselectedLabelStyle: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  color: kNeutral900),
              showUnselectedLabels: true,
              showSelectedLabels: true,
              selectedItemColor: kPrimary500,
              unselectedItemColor: Colors.black,
              backgroundColor: Colors.white));
}

class DarkTheme {
  static get make =>
      ThemeData.dark(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: const Color(0xFF000000),
        cardColor: Colors.grey[900],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900],
        ),
        bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: kNeutral900),
        colorScheme: ColorScheme.dark(
          onSurface: Colors.white,
        ),
        checkboxTheme: CheckboxThemeData(
          splashRadius: 5,
          side: const BorderSide(
            color: kNeutral50,
          ),
          checkColor: MaterialStateProperty.resolveWith((states) {
            // If the button is pressed, return green, otherwise blue
            if (states.contains(MaterialState.selected)) {
              return kNeutral900;
            }
            return kNeutral900;
          }),
        ),
        textTheme: textTheme,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(color: kPrimary500),
          unselectedIconTheme: IconThemeData(
            color: Colors.white,
          ),
          type: BottomNavigationBarType.fixed,
          enableFeedback: false,
          elevation: 0.0,
          selectedLabelStyle: GoogleFonts.inter(
              fontSize: 10, fontWeight: FontWeight.normal, color: kPrimary500),
          unselectedLabelStyle: GoogleFonts.inter(
              fontSize: 10, fontWeight: FontWeight.normal, color: Colors.white),
          showUnselectedLabels: true,
          showSelectedLabels: true,
          unselectedItemColor: Colors.white,
          selectedItemColor: kPrimary500,
          backgroundColor: kNeutral900,
        ),
      );
}

TextTheme textTheme = TextTheme(
  displayLarge: GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.w600,
  ),
  displayMedium: GoogleFonts.inter(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  ),
  displaySmall: GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  ),
  titleLarge: GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  ),
  titleMedium: GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  ),
  titleSmall: GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  ),
  bodyLarge: GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w400,
  ),
  bodyMedium: GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  ),
  bodySmall: GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  ),
  labelLarge: GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: kNeutral50,
  ),

);
