import 'package:adv_tic_tac_toe/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final TextEditingController controller;
  final String text;
  const CustomTextField({super.key, required this.controller, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white,fontSize: 20,shadows: [
        Shadow(
          blurRadius: 20,
          color: accentColor
        )
      ]),
      controller: controller,
      decoration: InputDecoration(
        hintStyle: const TextStyle(shadows:[Shadow(
          blurRadius: 20,
          color: accentColor
        )],color: Colors.white),
        fillColor: bgColor,
        filled: true,
        hintText: text,
      )
      
    );
  }
}