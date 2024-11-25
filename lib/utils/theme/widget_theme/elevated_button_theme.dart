import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';
import 'package:flutter/material.dart';

class AppElevatedButtonTheme {
  AppElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      shape: const RoundedRectangleBorder(),
      foregroundColor: whiteColor,
      backgroundColor: secondaryColor,
      side: const BorderSide(
        color: whiteColor,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: buttonHeight,
      ),
    ),
  );
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      shape: const RoundedRectangleBorder(),
      foregroundColor: secondaryColor,
      backgroundColor: whiteColor,
      side: const BorderSide(
        color: secondaryColor,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: buttonHeight,
      ),
    ),
  );
}
