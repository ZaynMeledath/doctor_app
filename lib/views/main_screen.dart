import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:doctor_app/constants/constants.dart';
import 'package:doctor_app/views/home_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeScreen(),
      bottomNavigationBar: CurvedNavigationBar(
        items: const [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.add,
            color: Colors.white,
          ),
          Icon(
            Icons.calendar_month,
            color: Colors.white,
          ),
        ],
        backgroundColor: Colors.white,
        color: themeColor,
        animationDuration: const Duration(milliseconds: 400),
      ),
    );
  }
}
