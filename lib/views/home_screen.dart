import 'package:doctor_app/constants/constants.dart';
import 'package:doctor_app/model/doctor_model.dart';
import 'package:doctor_app/utils/widgets/custom_text_style.dart';
import 'package:doctor_app/utils/screen_size.dart';
import 'package:doctor_app/views/doctor_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              SizedBox(height: 18.h()),
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

//====================Header====================//
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
        SizedBox(width: 15.w()),
        MyText(
          'Hi Ajay!',
          style: titleTextStyle(
            fontSize: 20.w(),
            fontWeight: FontWeight.w600,
          ),
        ),
        const Expanded(
          child: SizedBox(),
        ),
        Container(
          padding: EdgeInsets.all(8.w()),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(kRadius),
            border: Border.all(
              color: Colors.black54,
            ),
          ),
          child: Icon(
            Icons.notifications_outlined,
            size: 28.w(),
          ),
        ),
        SizedBox(width: 6.w()),
        Container(
          padding: EdgeInsets.all(8.w()),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(kRadius),
            border: Border.all(
              color: Colors.black54,
            ),
          ),
          child: Icon(
            Icons.favorite_outline,
            size: 28.w(),
          ),
        ),
      ],
    );
  }

//====================Date and Title====================//
  Widget _buildDateAndTitle() {
    final dateTime = DateTime.now();
    final weekDay = weekDays[dateTime.weekday];
    final month = months[dateTime.month];
    final date = dateTime.day;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          '$weekDay, $month $date',
          style: subtitleTextStyle(),
        ),
        SizedBox(height: 15.h()),
        MyText(
          "Let's find your doctor",
          style: titleTextStyle(),
        ),
      ],
    );
  }

//====================Search Field====================//
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

//====================Doctors List====================//
  Widget _buildDoctorsList() {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 15.h()),
            child: _buildDoctorCard(index: index),
          );
        },
      ),
    );
  }

//====================Doctor Card====================//
  Widget _buildDoctorCard({
    required int index,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(kRadius),
      onTap: () => Get.to(
        () => DoctorDetailsScreen(
          index: index,
          doctorModel: DoctorModel(
              name: 'Dr. Maria John',
              specialization: 'Neuro Surgeon',
              hospital: 'MIMS',
              experience: 5,
              totalPatients: 108,
              totalReviews: 85,
              description:
                  'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet.'),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 14.w(),
          vertical: 16.h(),
        ),
        decoration: BoxDecoration(
          color: themeColor.withAlpha(10),
          borderRadius: BorderRadius.circular(kRadius),
          border: Border.all(
            color: Colors.black.withAlpha(40),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 70.w(),
                  height: 70.w(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(kRadius),
                    child: Hero(
                      tag: 'doctor_avatar$index',
                      child: Image.asset(
                        'assets/images/doctor_avatar.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w()),
                //--------------------Name and Details--------------------//
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      'Dr. Maria John',
                      style: subtitleTextStyle(),
                    ),
                    SizedBox(height: 8.h()),
                    Row(
                      children: [
                        MyText(
                          'Cardiologist',
                          style: bodyTextStyle(),
                        ),
                        SizedBox(width: 20.w()),
                        MyText(
                          'MIMS Hospital',
                          style: bodyTextStyle(),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h()),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 24.w(),
                        ),
                        MyText(
                          '4.9',
                          style: bodyTextStyle(),
                        ),
                        SizedBox(width: 20.w()),
                        MyText(
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
                  size: 28.w(),
                  color: themeColor,
                )
              ],
            ),
            SizedBox(height: 25.h()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                    boxShadow: const [
                      BoxShadow(
                        color: themeColor,
                        offset: Offset(-.5, 1),
                      ),
                    ],
                  ),
                  child: MyText(
                    'Appointment',
                    style: subtitleTextStyle(),
                  ),
                ),
                MyText(
                  '\$35',
                  style: titleTextStyle(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
