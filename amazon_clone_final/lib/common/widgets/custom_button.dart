import 'package:flutter/material.dart';
import '/constants/global_variables.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color textColor;
  const CustomButton({
    required this.text,
    required this.onTap,
    this.backgroundColor= GlobalVariables.secondaryColor,
    this.textColor =GlobalVariables.backgroundColor,
    super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text(text,),
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity,50),
        ),
    );
  }
}
