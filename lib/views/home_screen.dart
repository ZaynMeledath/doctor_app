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
      body: Column(
        children: [
          _buildHeader(),
          _buildDateAndTitle(),
          _buildSearchField(),
          _buildDoctorsList(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        SizedBox(
          width: 50.w(),
          height: 50.w(),
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
            icon: const Icon(
              Icons.notifications,
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
            icon: const Icon(
              Icons.favorite,
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
      children: [
        Text(
          '$weekDay, $month $date',
          style: subTitleTextStyle(),
        ),
        SizedBox(height: 15.h()),
        Text(
          "Let's find your doctor",
          style: subTitleTextStyle(),
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
          return _buildDoctorCard();
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
        borderRadius: BorderRadius.circular(kRadius),
        border: Border.all(
          color: themeColor,
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(kRadius),
            child: Image.asset(
              'assets/images/avatar.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
