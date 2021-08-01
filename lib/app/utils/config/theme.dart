import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  textTheme: GoogleFonts.openSansTextTheme(),
  primaryColorDark: const Color(0xFF630024),
  primaryColorLight: const Color(0xFFFC005D),
  primaryColor: const Color(0xFF7D002E),
  accentColor: const Color(0xFFB03562),
  buttonColor: const Color(0xFFB30041),
  highlightColor: const Color(0xFFFDC2BB),
  scaffoldBackgroundColor: const Color(0xFFFEEDEB),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);

class Palette {
  static final Color firebaseNavy = Color(0xFF2C384A);
  static final Color firebaseOrange = Color(0xFFF57C00);
  static final Color firebaseAmber = Color(0xFFFFA000);
  static final Color firebaseYellow = Color(0xFFFFCA28);
  static final Color firebaseGrey = Color(0xFFECEFF1);
  static final Color googleBackground = Color(0xFF4285F4);
}