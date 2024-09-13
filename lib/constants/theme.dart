import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo/constants/colors.dart';

class LightTheme {
  static get make => ThemeData.light(useMaterial3: true).copyWith(
        primaryColor: kPrimary500,
        visualDensity: VisualDensity.compact,
        scaffoldBackgroundColor: kNeutralWhite,
        cardColor: kNeutral100,
        indicatorColor: kPrimary500,
        dividerColor: kNeutral200,
        textTheme: textTheme,
        colorScheme: const ColorScheme.light(
            onSurface: kNeutral900,
            surface: kNeutral1000,
            error: kRed500,
            onError: kRed100,
            primary: kPrimary500,
            secondary: kNeutral100,
            onSecondary: kNeutral600,
            onSecondaryContainer: kNeutral600,
            onSurfaceVariant: kNeutralWhite),
        radioTheme: RadioThemeData(
          overlayColor: MaterialStateProperty.resolveWith((states) {
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
        listTileTheme: ListTileThemeData(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            titleTextStyle: textTheme.titleMedium,
            subtitleTextStyle: textTheme.labelMedium?.copyWith(color: kNeutral600)),
        inputDecorationTheme: InputDecorationTheme(
            prefixIconColor: kNeutral900,
            fillColor: kNeutral100,
            hintStyle: textTheme.bodyMedium?.copyWith(color: kNeutral600),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kRed500, width: 1),
              borderRadius: BorderRadius.circular(16.0),
            ),
            disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
            filled: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            suffixIconColor: kNeutral900),
        bottomSheetTheme: const BottomSheetThemeData(backgroundColor: kNeutral100),
        checkboxTheme: CheckboxThemeData(
          splashRadius: 5,
          side: const BorderSide(
            color: kNeutral400,
          ),
          checkColor: WidgetStateProperty.resolveWith((states) {
            // If the button is pressed, return green, otherwise blue
            if (states.contains(WidgetState.selected)) {
              return kNeutral100;
            }
            return kNeutral100;
          }),
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return kPrimary500;
            }
            return null;
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
            selectedLabelStyle: textTheme.bodySmall?.copyWith(fontSize: 11, color: kPrimary500),
            unselectedLabelStyle: textTheme.bodySmall?.copyWith(fontSize: 11, color: kNeutral900),
            showUnselectedLabels: true,
            showSelectedLabels: true,
            selectedItemColor: kPrimary500,
            unselectedItemColor: Colors.black,
            backgroundColor: Colors.white),
        cardTheme: const CardTheme(color: kNeutral100, surfaceTintColor: kNeutral900),
        iconTheme: const IconThemeData(color: kNeutral900),
        dividerTheme: const DividerThemeData(color: kNeutral200),
        snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          backgroundColor: kNeutral50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentTextStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 18),
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ))),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 18),
                backgroundColor: kPrimary500,
                foregroundColor: kNeutral300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ))),
        datePickerTheme: DatePickerThemeData(
          dayStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: kNeutral700),
          weekdayStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: kNeutral700),
          backgroundColor: Colors.white,
          surfaceTintColor: kNeutral100,
          headerForegroundColor: kNeutral700,
          dividerColor: kNeutral200,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          dayForegroundColor: WidgetStateColor.resolveWith((states) => states.contains(WidgetState.selected) ? Colors.white : kNeutral700),
          dayBackgroundColor: WidgetStateColor.resolveWith((states) => states.contains(WidgetState.selected) ? kPrimary500 : Colors.white),
          dayOverlayColor: WidgetStateColor.resolveWith((states) => states.contains(WidgetState.selected) ? kPrimary500 : kNeutral700),
          yearForegroundColor: WidgetStateColor.resolveWith((states) => states.contains(WidgetState.selected) ? Colors.white : kNeutral700),
          yearOverlayColor: WidgetStateColor.resolveWith((states) => states.contains(WidgetState.selected) ? kPrimary500 : kNeutral700),
          todayForegroundColor: WidgetStateColor.resolveWith((states) => kNeutral700),
          confirmButtonStyle: ButtonStyle(
              foregroundColor: WidgetStateColor.resolveWith((states) => Colors.white),
              backgroundColor: WidgetStateColor.resolveWith((_) => kPrimary500),
              padding: const WidgetStatePropertyAll(EdgeInsets.all(10)),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),

              textStyle: WidgetStateTextStyle.resolveWith((_) => GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white))),
          cancelButtonStyle: ButtonStyle(
              foregroundColor: WidgetStateColor.resolveWith((states) => states.contains(WidgetState.selected) ? kPrimary500 : kNeutral700),
              side: WidgetStateBorderSide.resolveWith((states) => const BorderSide(color: kNeutral300)),
              overlayColor: WidgetStateColor.resolveWith((states) => kNeutral300),
              padding: const WidgetStatePropertyAll(EdgeInsets.all(10)),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              textStyle: WidgetStateTextStyle.resolveWith((_) => GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: kNeutral500))),
        ),
        toggleButtonsTheme: ToggleButtonsThemeData(
          splashColor: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          focusColor: Colors.transparent,
          selectedColor: Colors.transparent,
          fillColor: Colors.transparent,
        ),
      );
}

class DarkTheme {
  static get make => ThemeData.dark(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: const Color(0xFF000000),
        visualDensity: VisualDensity.compact,
        cardColor: kNeutral900,
        primaryColor: kPrimary500,
        dividerColor: kNeutral800,
        indicatorColor: kPrimary500,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900],
        ),
        dividerTheme: const DividerThemeData(color: kNeutral800),
        iconTheme: const IconThemeData(color: Colors.white),
        cardTheme: const CardTheme(color: kNeutral900, surfaceTintColor: kNeutral100),
        inputDecorationTheme: InputDecorationTheme(
            prefixIconColor: kNeutral100,
            fillColor: kNeutral900,
            hintStyle: textTheme.bodyMedium?.copyWith(color: kNeutral400),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kRed500, width: 1),
              borderRadius: BorderRadius.circular(16.0),
            ),
            disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
            filled: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            suffixIconColor: kNeutral100),
        bottomSheetTheme: const BottomSheetThemeData(backgroundColor: kNeutral900),
        colorScheme: const ColorScheme.dark(
            surface: Colors.black,
            onSurface: Colors.white,
            secondary: kNeutral900,
            onSecondary: kNeutral400,
            primary: kPrimary400,
            onPrimaryContainer: Colors.blue,
            onSecondaryContainer: kNeutral400,
            onSurfaceVariant: kNeutral900,
            error: kRed500,
            onError: kRed100),
        listTileTheme: ListTileThemeData(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            titleTextStyle: textTheme.titleMedium,
            subtitleTextStyle: textTheme.labelMedium?.copyWith(color: kNeutral600)),
        checkboxTheme: CheckboxThemeData(
          splashRadius: 5,
          side: const BorderSide(
            color: kNeutral50,
          ),
          checkColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return kNeutral900;
            }
            return null;
          }),
          fillColor: WidgetStateProperty.resolveWith((states) {
            // If the button is pressed, return green, otherwise blue
            if (states.contains(WidgetState.selected)) {
              return kPrimary500;
            }
            return null;
          }),
        ),
        radioTheme: RadioThemeData(
          overlayColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return kPrimary500;
            }
            return kPrimary500;
          }),
          fillColor: WidgetStateProperty.resolveWith((states) {
            // If the button is pressed, return green, otherwise blue
            if (states.contains(WidgetState.selected)) {
              return kPrimary500;
            }
            return kPrimary500;
          }),
        ),
        textTheme: textTheme.apply(bodyColor: Colors.white),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedIconTheme: const IconThemeData(color: kPrimary500),
          unselectedIconTheme: const IconThemeData(
            color: Colors.white,
          ),
          type: BottomNavigationBarType.fixed,
          enableFeedback: false,
          elevation: 0.0,
          selectedLabelStyle: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.normal, color: kPrimary400),
          unselectedLabelStyle: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.white),
          showUnselectedLabels: true,
          showSelectedLabels: true,
          unselectedItemColor: Colors.white,
          selectedItemColor: kPrimary400,
          backgroundColor: kNeutral900,
        ),
        snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          backgroundColor: kNeutral1000,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentTextStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 18),
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ))),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 18),
                backgroundColor: kPrimary500,
                foregroundColor: kNeutral300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ))),
        datePickerTheme: DatePickerThemeData(
          dayStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: kNeutral700),
          weekdayStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: kNeutral700),
          backgroundColor: kNeutral900,
          surfaceTintColor: kNeutral800,
          headerForegroundColor: Colors.white,
          dividerColor: kNeutral300,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          dayForegroundColor: const WidgetStatePropertyAll(Colors.white),
          dayBackgroundColor: WidgetStateColor.resolveWith((states) => states.contains(WidgetState.selected) ? kPrimary500 : Colors.transparent),
          dayOverlayColor: WidgetStateColor.resolveWith((states) => states.contains(WidgetState.selected) ? kPrimary500 : kNeutral700),
          yearForegroundColor: WidgetStateColor.resolveWith((states) => states.contains(WidgetState.selected) ? kNeutral900 : kNeutral700),
          yearOverlayColor: WidgetStateColor.resolveWith((states) => states.contains(WidgetState.selected) ? kPrimary500 : kNeutral700),
          todayForegroundColor: WidgetStateColor.resolveWith((states) => states.contains(WidgetState.selected) ? Colors.white : kPrimary500),
          todayBackgroundColor: WidgetStateProperty.resolveWith((state) => state.contains(WidgetState.selected) ? kPrimary500 : Colors.transparent),
          confirmButtonStyle: ButtonStyle(
              foregroundColor: WidgetStateColor.resolveWith((states) => Colors.white),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              backgroundColor: WidgetStateColor.resolveWith((_) => kPrimary500),
              padding: const WidgetStatePropertyAll(EdgeInsets.all(10)),
              textStyle: WidgetStateTextStyle.resolveWith((_) => GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white))),
          cancelButtonStyle: ButtonStyle(
              foregroundColor: WidgetStateColor.resolveWith((states) => states.contains(WidgetState.selected) ? kPrimary500 : kNeutral200),
              side: WidgetStateBorderSide.resolveWith((states) => const BorderSide(color: kNeutral300)),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              overlayColor: WidgetStateColor.resolveWith((states) => kNeutral300),
              padding: const WidgetStatePropertyAll(EdgeInsets.all(10)),
              textStyle: WidgetStateTextStyle.resolveWith((_) => GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: kNeutral500))),
        ),
        toggleButtonsTheme: ToggleButtonsThemeData(
          splashColor: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          focusColor: Colors.transparent,
          selectedColor: Colors.transparent,
          fillColor: Colors.transparent,
        ),
      );
}

TextTheme textTheme = GoogleFonts.interTightTextTheme();
