import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle headerBold(
      {double fontSize = 24,
      FontWeight fontWeight = FontWeight.bold,
      Color? color}) {
    return GoogleFonts.montserrat(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle headerMedium({
    double fontSize = 20,
    FontWeight fontWeight = FontWeight.w500,
    Color? color,
  }) {
    return GoogleFonts.montserrat(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? Colors.grey,
    );
  }

  static TextStyle bodyRegular(
      {double fontSize = 16,
      FontWeight fontWeight = FontWeight.normal,
      Color? color}) {
    return GoogleFonts.montserrat(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? Colors.grey);
  }

  static TextStyle bodySmall(
      {double fontSize = 14,
      FontWeight fontWeight = FontWeight.normal,
      Color? color}) {
    return GoogleFonts.montserrat(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
