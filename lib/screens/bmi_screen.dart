import 'package:flutter/material.dart';

import '../shared/bottom_nav_bar.dart';
import '../shared/menu_drawer.dart';

class BmiScreen extends StatelessWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('BMI')),
        drawer: const MenuDrawer(),
        bottomNavigationBar: const MenuBottomNavigation(),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: const Center(
            child: Text('BMI = 56'),
          ),
        )
    );
  }
}
