import 'package:doctor_app/constants/constants.dart';
import 'package:doctor_app/model/doctor_model.dart';
import 'package:doctor_app/utils/custom_text_style.dart';
import 'package:doctor_app/utils/screen_size.dart';
import 'package:doctor_app/utils/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final int index;
  final DoctorModel doctorModel;
  const DoctorDetailsScreen({
    required this.index,
    required this.doctorModel,
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
                child: Column(
                  children: [
                    _buildTitleAndDetails(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//====================Title and Details====================//
  Widget _buildTitleAndDetails() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(
              doctorModel.name.toString(),
              style: titleTextStyle(),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kRadius),
                color: Colors.transparent,
                border: Border.all(
                  color: themeColor,
                ),
              ),
              child: IconButton(
                padding: EdgeInsets.all(5.w()),
                splashRadius: (kRadius - 5.w()).abs(),
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_outline,
                  size: 26.w(),
                ),
              ),
            ),
          ],
        ),
        MyText(
          doctorModel.specialization.toString(),
          style: subtitleTextStyle(),
        ),
        SizedBox(height: 25.h()),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildDoctorExperienceCard(
              title: 'Pateints',
              value: doctorModel.totalPatients.toString(),
            ),
            _buildDoctorExperienceCard(
              title: 'Years of Experience',
              value: doctorModel.experience.toString(),
            ),
            _buildDoctorExperienceCard(
              title: 'Reviews',
              value: doctorModel.totalReviews.toString(),
            ),
          ],
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(kRadius),
            ),
            child: Column(
              children: [
                _buildDescription(),
                SizedBox(height: 12.h()),
                _buildAppointmentButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }

//====================Doctor Experience Card====================//
  Widget _buildDoctorExperienceCard({
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.w()),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(kRadius),
          ),
          child: Icon(
            Icons.groups_outlined,
            size: 24.w(),
            color: themeColor,
          ),
        ),
        SizedBox(width: 20.w()),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              title,
              style: titleTextStyle(),
            ),
            MyText(
              value,
              style: titleTextStyle(),
            ),
          ],
        ),
      ],
    );
  }

//====================Doctor Description====================//
  Widget _buildDescription() {
    return Expanded(
      child: ListView(
        children: [
          MyText(
            'About Doctor',
            style: titleTextStyle(),
          ),
          SizedBox(height: 15.h()),
          MyText(doctorModel.description.toString()),
        ],
      ),
    );
  }

//====================Appointment Button====================//
  Widget _buildAppointmentButton() {
    return Container(
      width: double.maxFinite,
      height: 60.h(),
      margin: EdgeInsets.symmetric(
        horizontal: 24.w(),
      ),
      child: Center(
        child: MyText(
          'Make an Appointment',
          style: subtitleTextStyle(),
        ),
      ),
    );
  }
}
