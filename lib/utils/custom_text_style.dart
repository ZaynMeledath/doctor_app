import 'package:doctor_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle titleTextStyle({
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
}) {
  return GoogleFonts.montserrat(
    fontSize: fontSize ?? kTitleFontSize,
    fontWeight: fontWeight ?? FontWeight.w600,
    color: color,
    height: 1.1,
  );
}

TextStyle subTitleTextStyle({
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
}) {
  return GoogleFonts.montserrat(
    fontSize: fontSize ?? kSubTitleFontSize,
    fontWeight: fontWeight ?? FontWeight.w500,
    color: color,
    height: 1.1,
  );
}

TextStyle bodyTextStyle({
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
}) {
  return GoogleFonts.montserrat(
    fontSize: fontSize ?? kBodyFontSize,
    fontWeight: fontWeight ?? FontWeight.w400,
    color: color,
    height: 1.1,
  );
}
