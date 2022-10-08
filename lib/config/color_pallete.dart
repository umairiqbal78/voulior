import 'package:flutter/material.dart';

Color cardColor = buildMaterialColor(const Color.fromRGBO(233, 213, 202, 1));
Color secColor = buildMaterialColor(const Color.fromRGBO(130, 115, 151, 1));
Color primaryColor = buildMaterialColor(const Color.fromRGBO(54, 48, 98, 1));
Color textColor = buildMaterialColor(const Color.fromRGBO(31, 41, 51, 1));
Color greenColor = buildMaterialColor(const Color.fromRGBO(30, 212, 0, 1));
Color neutral = buildMaterialColor(const Color.fromRGBO(31, 41, 51, 1));
Color profileSubtitle =
    buildMaterialColor(const Color.fromRGBO(140, 147, 170, 1));
Color neutrals_softgrey =
    buildMaterialColor(const Color.fromRGBO(220, 223, 227, 1));
Color neutralsDark2 = buildMaterialColor(const Color.fromRGBO(50, 63, 75, 1));
Color neutralsGrey1 =
    buildMaterialColor(const Color.fromRGBO(107, 117, 128, 1));

MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
