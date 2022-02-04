import 'package:app/styles/color_styles.dart';
import 'package:flutter/material.dart';

class FontSyles{

  static TextStyle headerStyle (double size) => TextStyle(fontSize: size,color: ColorStyles.colorWhite , fontWeight: FontWeight.w800);
  static TextStyle locationStyle = TextStyle(fontSize: 13, color: ColorStyles.colorLightGrey);
  static TextStyle dayStyle = const TextStyle(fontSize: 22, color: Colors.black87, fontWeight: FontWeight.w600);

}