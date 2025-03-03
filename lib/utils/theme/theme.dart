import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/theme/custom/appbar_theme.dart';
import 'package:e_commerce_app/utils/theme/custom/bottom_sheet_theme.dart';
import 'package:e_commerce_app/utils/theme/custom/checkbx_theme.dart';
import 'package:e_commerce_app/utils/theme/custom/custom_text_theme.dart';
import 'package:e_commerce_app/utils/theme/custom/elevated_btn_theme.dart';
import 'package:e_commerce_app/utils/theme/custom/outlined_btn_theme.dart';
import 'package:e_commerce_app/utils/theme/custom/textfield_theme.dart';
import 'package:e_commerce_app/utils/theme/custom/chip_theme.dart'
    as custom_chip;
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: CustomColors.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    textTheme: CustomTextTheme.lightTextTheme,
    elevatedButtonTheme: ElevatedBtnTheme.lightElevatedBtnTheme,
    outlinedButtonTheme: OutlinedBtnTheme.ligthOutlinedBtn,
    inputDecorationTheme: TextfieldTheme.lightInputDecorationTheme,
    checkboxTheme: CheckbxTheme.lightCheckbxTheme,
    bottomSheetTheme: BottomSheetTheme.lightBottomSheetTheme,
    appBarTheme: AppbarTheme.lightAppbarTheme,
    chipTheme: custom_chip.ChipTheme.lightChipTheme,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: CustomColors.primaryColor,
      selectionColor: Color.fromARGB(160, 184, 184, 184),
      selectionHandleColor: Color.fromARGB(160, 184, 184, 184),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: CustomColors.primaryColor,
    scaffoldBackgroundColor: Colors.black,
    textTheme: CustomTextTheme.darkTextTheme,
    elevatedButtonTheme: ElevatedBtnTheme.darkElevatedBtnTheme,
    outlinedButtonTheme: OutlinedBtnTheme.darkOutlinedBtn,
    inputDecorationTheme: TextfieldTheme.darkInputDecorationTheme,
    checkboxTheme: CheckbxTheme.darkCheckbxTheme,
    bottomSheetTheme: BottomSheetTheme.darkBottomSheetTheme,
    appBarTheme: AppbarTheme.darkAppbarTheme,
    chipTheme: custom_chip.ChipTheme.darkChipTheme,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: CustomColors.primaryColor,
      selectionColor: Color.fromARGB(160, 184, 184, 184),
      selectionHandleColor: Color.fromARGB(160, 184, 184, 184),
    ),
  );
}
