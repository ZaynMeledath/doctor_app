import 'package:doctor_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//====================Custom Text Class====================//
class MyText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final TextStyle? style;
  const MyText(
    this.text, {
    this.textAlign,
    this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textScaler: TextScaler.noScaling,
      textAlign: textAlign,
      style: style ?? bodyTextStyle(),
    );
  }
}

//====================Title====================//
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

//====================Subtitle====================//
TextStyle subtitleTextStyle({
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

//====================Body====================//
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
