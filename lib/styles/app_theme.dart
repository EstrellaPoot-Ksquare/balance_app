import 'package:balance_app/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static Color mainColor = ColorConstants.mainbg;
  static final ThemeData theme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: ColorConstants.mainbg,
      elevation: 0,
    ),
    // scaffoldBackgroundColor: ColorConstants.scaffoldbg,
    inputDecorationTheme: InputDecorationTheme(
      alignLabelWithHint: true,
      labelStyle: TextStyle(
        fontSize: 20,
        color: ColorConstants.inputLabels,
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 24,
      ),
      errorStyle:
          TextStyle(fontSize: 20, color: ColorConstants.inputErrorBorder),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorConstants.inputBorder,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorConstants.mainbg, width: 3),
        borderRadius: BorderRadius.circular(15),
      ),
      errorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorConstants.inputErrorBorder, width: 3),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorConstants.inputFocusedErrorBorder, width: 4),
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 15,
        ),
      ),
    ),
  );
}
