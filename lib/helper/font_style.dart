
import 'package:flutter/material.dart';

class Font {
  static TextStyle notaTitle(
      { fontSize = 14.0,
        color = Colors.black,
        fontWeight = FontWeight.w600,
        fontStyle = FontStyle.normal}) {
    return TextStyle(
        fontSize: fontSize,
        fontFamily: 'Noto Sans Regular',
        color:  color,
        fontWeight: fontWeight,
        fontStyle: fontStyle);
  }

  static TextStyle SubTitle(
      {
        color = Colors.black,
        double letterSpace = 0.0,
        fontWeight = FontWeight.w600,
        fontStyle = FontStyle.normal,
        fontSize = 16.0}) {
    return TextStyle(
        fontSize: fontSize,
        letterSpacing: letterSpace,
        fontFamily: 'Noto Sans Regular',
        color:  color,
        fontStyle: fontStyle,
        fontWeight: fontWeight
    );
  }

  static TextStyle otherTitle(
      {
        color = Colors.black,
        double letterSpace = 0.0,
        fontWeight = FontWeight.w400,
        fontStyle = FontStyle.normal,
        fontSize = 14.0}) {
    return TextStyle(
        fontSize: fontSize,
        letterSpacing: letterSpace,
        fontFamily: 'Noto Sans Regular',
        color: color,
        fontStyle: fontStyle,
        fontWeight: fontWeight
    );
  }

  static TextStyle heeboTitle(
      {double fontSize = 34.0,
        color = Colors.black,
        fontWeight = FontWeight.w700,
        fontStyle = FontStyle.normal}) {
    return TextStyle(
        fontSize: fontSize,
        fontFamily: 'Hebbo Bold',
        color: color,
        fontWeight: fontWeight,
        fontStyle: fontStyle);
  }
}