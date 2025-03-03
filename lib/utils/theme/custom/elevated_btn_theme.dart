import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ElevatedBtnTheme {
  ElevatedBtnTheme._();

  static ElevatedButtonThemeData lightElevatedBtnTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: CustomColors.dark,
      disabledBackgroundColor: Colors.grey,
      disabledForegroundColor: Colors.grey,
      side: BorderSide(color: CustomColors.dark),
      padding: EdgeInsets.symmetric(vertical: 14),
      textStyle: TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );

  static ElevatedButtonThemeData darkElevatedBtnTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: CustomColors.primaryColor,
      disabledBackgroundColor: Colors.grey,
      disabledForegroundColor: Colors.grey,
      side: BorderSide(color: CustomColors.primaryColor),
      padding: EdgeInsets.symmetric(vertical: 14),
      textStyle: TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  );
}
