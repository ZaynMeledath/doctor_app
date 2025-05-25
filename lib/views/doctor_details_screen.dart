import 'package:doctor_app/constants/constants.dart';
import 'package:doctor_app/utils/screen_size.dart';
import 'package:doctor_app/utils/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final int index;
  const DoctorDetailsScreen({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: ''),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: double.maxFinite,
              height: 400.h(),
              child: Hero(
                tag: 'doctor_avatar$index',
                child: Image.asset(
                  'assets/images/doctor_avatar.jpg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w(),
                ),
                decoration: const BoxDecoration(
                  color: themeColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
