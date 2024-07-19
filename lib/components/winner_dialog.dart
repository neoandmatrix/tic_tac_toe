import 'package:flutter/material.dart';

void showWinnerDialog(BuildContext context, String text) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(text),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text('Play again'),
            )
          ],
        );
      });
}
