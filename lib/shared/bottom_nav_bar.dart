import 'package:flutter/material.dart';

class MenuBottomNavigation extends StatelessWidget {
  const MenuBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/');
              break;
            case 1:
              Navigator.pushNamed(context, '/bmi');
              break;
            case 2:
              Navigator.pushNamed(context, '/register');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.monitor_weight_rounded), label: 'BMI'),
          BottomNavigationBarItem(
              icon: Icon(Icons.app_registration_rounded), label: "Register")
        ]);
  }
}
