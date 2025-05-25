import 'package:doctor_app/utils/custom_text_style.dart';
import 'package:doctor_app/utils/flight_shuttle_builder.dart';
import 'package:doctor_app/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar myAppBar({
  required String title,
  Color? backgroundColor,
  Color? foregroundColor,
  bool implyLeading = true,
  List<Widget>? trailingIconsList,
  double? elevation,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: elevation ?? 10,
    titleSpacing: 0,
    toolbarHeight: screenSize.width * .13,
    surfaceTintColor: Colors.transparent,
    backgroundColor: backgroundColor ?? Colors.transparent,
    title: Row(
      children: [
        Visibility(
          visible: implyLeading,
          child: Hero(
            tag: 'back_button',
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: screenSize.width * .061,
                color: foregroundColor,
              ),
              onPressed: () {
                FocusScopeNode currentFocus = FocusScope.of(Get.context!);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
                Get.back();
              },
            ),
          ),
        ),
        SizedBox(width: screenSize.width * .041),
        Hero(
          tag: title,
          flightShuttleBuilder: flightShuttleBuilder,
          child: MyText(
            title,
            style: GoogleFonts.inter(
              color: foregroundColor,
              fontSize: 16.w(),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Expanded(child: SizedBox()),
        if (trailingIconsList != null)
          Row(
            children: trailingIconsList,
          ),
        SizedBox(width: screenSize.width * .03),
      ],
    ),
  );
}
