import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo/constants/colors.dart';

class LightTheme {
  static get make => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: kNeutral50,
        cardColor: Colors.white,
        dividerColor: kNeutral100,
        textTheme: textTheme,
        colorScheme: const ColorScheme.light(onSurface: kNeutral900, primary: kPrimary500, onSecondaryContainer: kNeutral600,),
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
        inputDecorationTheme: InputDecorationTheme(
          prefixIconColor: kNeutral900,
          fillColor: kNeutral100,
          hintStyle: GoogleFonts.inter(
              fontSize: 16, fontWeight: FontWeight.w500, color: kNeutral600),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kRed500, width: 1),
            borderRadius: BorderRadius.circular(12.0),
          ),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none),
          filled: true,
          contentPadding:
              const EdgeInsets.only(bottom: 40 / 2, left: 16, top: 12),
          suffixIconColor: kNeutral900
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
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return kPrimary500;
            }
          }),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedIconTheme: const IconThemeData(color: kPrimary500),
            unselectedIconTheme: const IconThemeData(
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
            backgroundColor: Colors.white),
        cardTheme: CardTheme(color: kNeutral100, surfaceTintColor: kNeutral900),
        iconTheme: const IconThemeData(color: kNeutral900),
        dividerTheme: DividerThemeData(
            color: kNeutral200
        ),
      snackBarTheme: SnackBarThemeData(
          backgroundColor: kNeutral50
      )
      );
}

class DarkTheme {
  static get make => ThemeData.dark(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: const Color(0xFF000000),
        cardColor: kNeutral900,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900],
        ),
        dividerTheme: const DividerThemeData(
          color: kNeutral800
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        cardTheme: CardTheme(color: kNeutral900, surfaceTintColor: kNeutral100),
        inputDecorationTheme: InputDecorationTheme(
          prefixIconColor: kNeutral100,
          fillColor: kNeutral900,
          hintStyle: GoogleFonts.inter(
              fontSize: 16, fontWeight: FontWeight.w500, color: kNeutral400),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kRed500, width: 1),
            borderRadius: BorderRadius.circular(12.0),
          ),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none),
          filled: true,
          contentPadding:
              const EdgeInsets.only(bottom: 40 / 2, left: 16, top: 12),
            suffixIconColor: kNeutral100
        ),
        bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: kNeutral900),
        colorScheme: const ColorScheme.dark(
          onSurface: Colors.white,
          onPrimary: kPrimary400,
          onSecondaryContainer: kNeutral400,
        ),
        checkboxTheme: CheckboxThemeData(
          splashRadius: 5,
          side: const BorderSide(
            color: kNeutral50,
          ),
          checkColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return kNeutral900;
            }
          }),
          fillColor: MaterialStateProperty.resolveWith((states) {
            // If the button is pressed, return green, otherwise blue
            if (states.contains(MaterialState.selected)) {
              return kPrimary500;
            }
          }),
        ),
        textTheme: textTheme,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedIconTheme: const IconThemeData(color: kPrimary500),
          unselectedIconTheme: const IconThemeData(
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
        snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          backgroundColor: kNeutral1000,
          shape: RoundedRectangleBorder(

            borderRadius: BorderRadius.circular(12),
          ),
          contentTextStyle: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.white
          ),
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
