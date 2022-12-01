import 'package:flutter/material.dart';
import 'package:weather_focus/shared/menu_drawer.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('D Fitness')),
      drawer: const MenuDrawer(),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: const Center(
          child: Text('Denis is coding'),
        ),
      )
    );
  }
}
