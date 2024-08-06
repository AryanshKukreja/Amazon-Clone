import 'dart:math';

import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  const CustomTextfield({super.key,
    required this.controller,
    required this.hintText,
    this.maxLines=1,});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color:Colors.black38,
          ),
        ),
        hintText: hintText,
        enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
      color:Colors.black38,
          ),
        ),
      ),
      validator: (val) {
        if(val== null || val.isEmpty) {
          return 'Enter your $hintText';
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}
