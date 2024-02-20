import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo/components/utils/utils.dart';
import 'package:pomo/constants/colors.dart';

class LightTheme {
  static get make => ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: kNeutral50,
      cardColor: Colors.white,
      dividerColor: kNeutral100,
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
      bottomSheetTheme: const  BottomSheetThemeData(
          backgroundColor: kNeutral900
      ),
      checkboxTheme: CheckboxThemeData(
        splashRadius: 5,
        side: const BorderSide(
          color: kNeutral50,
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
        type: BottomNavigationBarType.fixed,
        enableFeedback: false,
        elevation: 0.0,
        selectedLabelStyle: GoogleFonts.inter(
            fontSize: 10, fontWeight: FontWeight.normal, color: kPrimary500),
        unselectedLabelStyle: GoogleFonts.inter(
            fontSize: 10, fontWeight: FontWeight.normal, color: kNeutral900),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedItemColor: kPrimary500,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.white
      ));
}

class DarkTheme {
  static get make => ThemeData.dark(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: const Color(0xFF000000),
        cardColor: Colors.grey[900],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900],
        ),
        bottomSheetTheme:const BottomSheetThemeData(
          backgroundColor: kNeutral900
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
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
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
