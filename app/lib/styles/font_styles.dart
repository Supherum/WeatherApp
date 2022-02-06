import 'package:app/styles/color_styles.dart';
import 'package:flutter/material.dart';

class FontSyles {
  static TextStyle headerStyle(double size) => TextStyle(
      fontSize: size,
      color: ColorStyles.colorWhite,
      fontWeight: FontWeight.w800);
  static TextStyle headerStyleStatus(double size) => TextStyle(
      fontSize: size,
      color: ColorStyles.colorWhite,
      fontWeight: FontWeight.w500);

  static TextStyle locationStyle =
      TextStyle(fontSize: 13, color: ColorStyles.colorLightGrey);
  static TextStyle dayStyle = const TextStyle(
      fontSize: 22, color: Colors.black87, fontWeight: FontWeight.w600);
  static const TextStyle bottomNavigationStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static TextStyle weatherResults = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w400, color: Colors.blueAccent[400]);
  static TextStyle dayName = const TextStyle(
    fontSize: 12,
  );
  static TextStyle temperatureDay = TextStyle(
      fontSize: 16, color: Colors.blueAccent[400], fontWeight: FontWeight.w600);
  static TextStyle sectionText =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
  static TextStyle weatherSmallResults = TextStyle(
      fontSize: 15, fontWeight: FontWeight.w600, color: Colors.blueAccent[400]);
}
