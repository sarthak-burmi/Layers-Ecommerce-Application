import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    displayMedium: GoogleFonts.montserrat(color: Colors.black87),
    titleSmall: GoogleFonts.montserrat(
      color: Colors.black54,
    ),
  );
  static TextTheme dartkTextTheme = TextTheme(
    displayMedium: GoogleFonts.montserrat(color: Colors.white70),
    titleSmall: GoogleFonts.montserrat(color: Colors.white60),
    bodyLarge: GoogleFonts.montserrat(color: Colors.white60),
  );
}
