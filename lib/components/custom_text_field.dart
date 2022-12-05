import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    this.inputFormatters,
    this.validator,
    this.obscureText,
  }) : super(key: key);

  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {

    bool isObscured = (obscureText == null) ? false : true;

    return Container(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          inputFormatters: inputFormatters,
          validator: validator,
          obscureText: isObscured,
          decoration: InputDecoration(
              border: const OutlineInputBorder(), labelText: hintText),
        ));
  }
}
