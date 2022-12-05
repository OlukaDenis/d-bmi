import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_focus/components/custom_text_field.dart';

import '../components/custom_image_field.dart';
import '../shared/bottom_nav_bar.dart';
import '../shared/menu_drawer.dart';
import '../utils/string_extensions.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Register')),
        drawer: const MenuDrawer(),
        bottomNavigationBar: const MenuBottomNavigation(),
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  CustomTextField(
                    hintText: 'Name',
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]+|\s"))
                    ],
                    validator: (val) {
                      if (val == null) return null;
                      if (!val.isValidName) {
                        debugPrint('Enter valid name');
                        return 'Enter valid name';
                      }
                    },
                  ),
                  CustomTextField(
                    hintText: 'Phone',
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r"[0-9]"))
                    ],
                    validator: (val) {
                      if (val == null) return null;
                      if (!val.isValidPhone) {
                        return 'Enter valid phone number';
                      }
                    },
                  ),
                  CustomTextField(
                    hintText: 'Email',
                    validator: (val) {
                      if (val == null) return null;
                      if (!val.isValidEmail) {
                        return 'Enter valid email';
                      }
                    },
                  ),
                  CustomTextField(
                    hintText: 'Password',
                    obscureText: true,
                    validator: (val) {
                      if (val == null) return null;
                      if (!val.isValidPassword) {
                        return 'Enter valid password';
                      }
                    },
                  ),

                  CustomImageFormField(
                    validator: (val) {
                      if (val == null) return 'Pick a picture';
                    },
                    onChanged: (file) {},
                  ),

                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          debugPrint('Form validated');
                        } else {
                          debugPrint('Errors found');
                        }
                      },
                      child: const Text('Submit'))
                ],
              ),
            ),
          ),
        ));
  }
}
