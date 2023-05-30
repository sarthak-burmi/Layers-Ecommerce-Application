import 'package:flutter/material.dart';
import 'package:flutter_application_2/theme/text_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class TAppTheme {
  TAppTheme._();
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.white,
      shadow: Colors.grey.withOpacity(0.5),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TTextTheme.dartkTextTheme,
    colorScheme: ColorScheme.dark(
      primary: Colors.grey,
      shadow: Colors.white.withOpacity(0.5),
    ),
  );
  static Color containerColor(BuildContext context) {
    return Theme.of(context).colorScheme.background;
  }
}
