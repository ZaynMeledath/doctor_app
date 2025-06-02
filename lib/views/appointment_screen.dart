import 'package:doctor_app/utils/custom_text_style.dart';
import 'package:doctor_app/utils/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: 'Appoinment'),
      body: Column(
        children: [
          _buildScheduler(),
          _buildAppointmentMethods(),
        ],
      ),
    );
  }

//====================Schedule Segment====================//
  Widget _buildScheduler() {
    return const Column(
      children: [],
    );
  }

  Widget _buildAppointmentMethods() {
    return Column(
      children: [
        Text(
          'Clinic Visit',
          style: titleTextStyle(),
        ),
        Text(
          'Video Call',
          style: titleTextStyle(),
        ),
      ],
    );
  }
}
