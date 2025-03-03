import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class OutlinedBtnTheme {
  OutlinedBtnTheme._();

  static final ligthOutlinedBtn = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.black,
      side: const BorderSide(color: CustomColors.primaryColor),
      textStyle: const TextStyle(
          fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );

  static final darkOutlinedBtn = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      side: const BorderSide(color: CustomColors.primaryColor),
      textStyle: const TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );
}
