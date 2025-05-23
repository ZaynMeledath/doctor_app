import 'package:doctor_app/utils/screen_size.dart';
import 'package:flutter/material.dart' show Colors;
import 'package:google_fonts/google_fonts.dart';

const themeColor = Colors.teal;

const kFont = GoogleFonts.montserrat;
double kTitleFontSize = 24;
double kSubTitleFontSize = 18;
double kBodyFontSize = 14;
double kRadius = 12;

void constantsInit() {
  kSubTitleFontSize = 18.w();
  kTitleFontSize = 24.w();
  kBodyFontSize = 14.w();
  kRadius = 12.w();
}

final weekDays = {
  1: 'Monday',
  2: 'Tuesday',
  3: 'Thursday',
  4: 'Wednesday',
  5: 'Friday',
  6: 'Saturday',
  7: 'Sunday',
};

final months = {
  1: 'January',
  2: 'February',
  3: 'March',
  4: 'April',
  5: 'May',
  6: 'June',
  7: 'July',
  8: 'August',
  9: 'September',
  10: 'October',
  11: 'November',
  12: 'December',
};
