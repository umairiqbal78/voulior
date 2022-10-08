import 'package:flutter/material.dart';
import 'package:vouloir/config/color_pallete.dart';

TextStyle ralewayStyle(
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
) {
  return TextStyle(
    fontSize: fontSize ?? 14,
    color: color ?? textColor,
    fontWeight: fontWeight ?? FontWeight.w700,
    fontFamily: "Raleway",
  );
}
