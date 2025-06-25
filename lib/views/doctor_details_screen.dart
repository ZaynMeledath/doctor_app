import 'package:doctor_app/constants/constants.dart';
import 'package:doctor_app/model/doctor_model.dart';
import 'package:doctor_app/utils/widgets/custom_text_style.dart';
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
              height: 350.h(),
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
                decoration: const BoxDecoration(
                  color: themeColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(34),
                  ),
                ),
                child: _buildTitleAndDetails(),
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
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w(),
            vertical: 14.w(),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    doctorModel.name.toString(),
                    style: titleTextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(6.w()),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kRadius),
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.favorite_outline,
                      size: 26.w(),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  doctorModel.specialization.toString(),
                  style: subtitleTextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 25.h()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDoctorExperienceCard(
                    title: 'Patients',
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
            ],
          ),
        ),
        SizedBox(height: 14.w()),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(
              left: 16.w(),
              right: 16.w(),
              top: 16.h(),
              bottom: 14.h(),
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(34),
              ),
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
            size: 18.w(),
            color: themeColor,
          ),
        ),
        SizedBox(width: 4.w()),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              title,
              style: bodyTextStyle(
                color: Colors.white,
                fontSize: 14.w(),
                fontWeight: FontWeight.w500,
              ),
            ),
            MyText(
              value,
              style: bodyTextStyle(
                color: Colors.white,
                fontSize: 14.w(),
                fontWeight: FontWeight.w600,
              ),
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
      decoration: BoxDecoration(
        color: themeColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: MyText(
          'Make an Appointment',
          style: subtitleTextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
