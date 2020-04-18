import 'package:flutter/material.dart';

class Styles {
  //Colors
  static LinearGradient get primaryGradient =>
      LinearGradient(colors: [Color(0xFF04D8CB), Color(0xFF78FF86)]);

  static Color get backgroundColor => Color(0xFF252C4A);
  static Color get highlightColor => Color(0XFF7081C5);
  static Color get primaryColor => Color(0xFF2F3758);
  static Color get primaryWhite => Color(0xFFDADADA);
  static Color get errorRed => Color(0xFFcc0000);

  //Font Sizes
  static double get headline => 32;
  static double get title => 20;
  static double get normal => 16;
  static double get small => 12;

  //Font Weight
  static FontWeight get fontWeight => FontWeight.w500;

//Text Styles
  //white text
  static TextStyle get headlineWhiteTextStyle =>
      TextStyle(color: primaryWhite, fontSize: headline, fontWeight: fontWeight);
  static TextStyle get titleWhiteTextStyle => headlineWhiteTextStyle.copyWith(fontSize: title);
  static TextStyle get normalWhiteTextStyle => headlineWhiteTextStyle.copyWith(fontSize: normal);
  static TextStyle get smallWhiteTextStyle => headlineWhiteTextStyle.copyWith(fontSize: small);

  //primary color text
  static TextStyle get headlineHighlightTextStyle =>
      TextStyle(color: highlightColor, fontSize: headline, fontWeight: fontWeight);
  static TextStyle get titleHighlightTextStyle => headlineHighlightTextStyle.copyWith(fontSize: title);
  static TextStyle get normalHighlightTextStyle => headlineHighlightTextStyle.copyWith(fontSize: normal);
  static TextStyle get smallHighlightTextStyle => headlineHighlightTextStyle.copyWith(fontSize: small);

  //Icon Size
  static double get normalIconSize => 24;
}
