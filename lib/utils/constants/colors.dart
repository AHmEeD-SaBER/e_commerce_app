import 'package:flutter/material.dart';

class CustomColors {
  CustomColors._();

  // App Basic Colors
  static const Color primaryColor = Color.fromARGB(255, 0, 221, 181);
  static const Color secondaryColor = Color.fromARGB(255, 243, 239, 117);
  static const Color accent = Color.fromARGB(255, 4, 189, 240);

  // App Text Colors
  static const Color textPrimaryColor = Color(0xFF333333);
  static const Color textSecondaryColor = Color(0xFF6c7570);
  static const Color textWhiteColor = Color(0xFFFFFFFF);

  // App Background Colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const primaryBackground = Color(0xFFF3F5FF);

  // App Background Cotainer Colors
  static const Color containerLight = Color(0xFFF6F6F6);
  static Color containerDark = CustomColors.white.withOpacity(0.1);

  // Button Colors
  static const Color buttonPrimary = Colors.cyanAccent;
  static const Color buttonSecondary = Color.fromARGB(255, 89, 89, 89);
  static const Color btnDisabled = Color(0xFFD1D1D1);

  // App Border Colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Error Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color sucsess = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFA000);
  static const Color info = Color(0xFF2196F3);

  // Natural Shades
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF232323);
  static const Color darkGrey = Color(0xFF939393);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color softGrey = Color(0xFFF4F4F4);

  // Gradient Colors
  static const Gradient primaryGradient = LinearGradient(
    colors: [Color(0xffff9a9a), Color(0xfffad0c4), Color(0xfffad0c4)],
    begin: Alignment(0, 0),
    end: Alignment(0.707, -0.707),
  );
}
