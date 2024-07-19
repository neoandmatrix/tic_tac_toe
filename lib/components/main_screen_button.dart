import 'package:adv_tic_tac_toe/constants/colors.dart';
import 'package:flutter/material.dart';

class MainScreenButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const MainScreenButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 18,
            spreadRadius: 1,
            color: accentColor
          )
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(minimumSize: Size(width / 1.3, 50)),
        child: Text(
          buttonText,
          style:  TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            shadows: [
              Shadow(
                blurRadius: 10,
                color: Colors.purple.shade300
              )
            ]
          ),
        ),
      ),
    );
  }
}
