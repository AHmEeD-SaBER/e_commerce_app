import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CheckbxTheme {
  CheckbxTheme._();

  static CheckboxThemeData lightCheckbxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }
        return Colors.black;
      },
    ),
    fillColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return CustomColors.primaryColor;
        }
        return Colors.transparent;
      },
    ),
  );

  static CheckboxThemeData darkCheckbxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }
        return Colors.black;
      },
    ),
    fillColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return CustomColors.primaryColor;
        }
        return Colors.transparent;
      },
    ),
  );
}
