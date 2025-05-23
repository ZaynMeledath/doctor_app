import 'package:doctor_app/constants/constants.dart';
import 'package:doctor_app/utils/custom_text_style.dart';
import 'package:doctor_app/utils/screen_size.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w(),
          ),
          child: Column(
            children: [
              SizedBox(height: 10.h()),
              _buildHeader(),
              SizedBox(height: 20.h()),
              Align(
                alignment: Alignment.centerLeft,
                child: _buildDateAndTitle(),
              ),
              SizedBox(height: 10.h()),
              _buildSearchField(),
              SizedBox(height: 20.h()),
              _buildDoctorsList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        SizedBox(
          width: 100.w(),
          height: 100.w(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(kRadius),
            child: Image.asset(
              'assets/images/avatar.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 20.w()),
        Text(
          'Hi Ajay!',
          style: subTitleTextStyle(),
        ),
        const Expanded(
          child: SizedBox(),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(kRadius),
            border: Border.all(
              color: Colors.black54,
            ),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              size: 28.w(),
            ),
            splashRadius: kRadius,
          ),
        ),
        SizedBox(width: 6.w()),
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(kRadius),
            border: Border.all(
              color: Colors.black54,
            ),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_outline,
              size: 28.w(),
            ),
            splashRadius: kRadius,
          ),
        ),
      ],
    );
  }

  Widget _buildDateAndTitle() {
    final dateTime = DateTime.now();
    final weekDay = weekDays[dateTime.weekday];
    final month = months[dateTime.month];
    final date = dateTime.day;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$weekDay, $month $date',
          style: subTitleTextStyle(),
        ),
        SizedBox(height: 15.h()),
        Text(
          "Let's find your doctor",
          style: titleTextStyle(),
        ),
      ],
    );
  }

  Widget _buildSearchField() {
    return TextFormField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: 'Find here...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kRadius),
        ),
      ),
    );
  }

  Widget _buildDoctorsList() {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.only(bottom: 15.h()),
              child: _buildDoctorCard());
        },
      ),
    );
  }

  Widget _buildDoctorCard() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w(),
        vertical: 10.h(),
      ),
      decoration: BoxDecoration(
        color: themeColor.withAlpha(10),
        borderRadius: BorderRadius.circular(kRadius),
        border: Border.all(
          color: Colors.black54,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 70.w(),
                height: 70.w(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(kRadius),
                  child: Image.asset(
                    'assets/images/avatar.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 12.w()),
              //--------------------Name and Details--------------------//
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr. Johny Sins',
                    style: subTitleTextStyle(),
                  ),
                  SizedBox(height: 4.h()),
                  Row(
                    children: [
                      Text(
                        'Cardiologist',
                        style: bodyTextStyle(),
                      ),
                      SizedBox(width: 20.w()),
                      Text(
                        'MIMS Hospital',
                        style: bodyTextStyle(),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h()),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 24.w(),
                      ),
                      Text(
                        '4.9',
                        style: bodyTextStyle(),
                      ),
                      SizedBox(width: 20.w()),
                      Text(
                        '12PM - 3PM',
                        style: bodyTextStyle(),
                      ),
                    ],
                  ),
                ],
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Icon(
                Icons.favorite_outline,
                size: 26.w(),
              )
            ],
          ),
          SizedBox(height: 15.h()),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12.w(),
              vertical: 6.w(),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(kRadius),
              border: Border.all(
                color: themeColor,
              ),
            ),
            child: Text(
              'Appointment',
              style: subTitleTextStyle(),
            ),
          ),
        ],
      ),
    );
  }
}
