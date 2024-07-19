import 'package:adv_tic_tac_toe/components/main_screen_button.dart';
import 'package:adv_tic_tac_toe/screens/create_game_screen.dart';
import 'package:adv_tic_tac_toe/screens/join_game_screen.dart';
import 'package:flutter/material.dart';

class MainMenueScreen extends StatelessWidget {
  void createGame(BuildContext context) {
    Navigator.pushNamed(context, CreateGamePage.routeName);
  }

  void joinGame(BuildContext context) {
    Navigator.pushNamed(context, JoinGamePage.routeName);
  }

  static String routeName = '/main-menue';

  const MainMenueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MainScreenButton(
              onPressed: () => createGame(context),
              buttonText: "Create Game",
            ),
             SizedBox(
              height: screenHeight/21,
            ),
            MainScreenButton(
              onPressed: () => joinGame(context),
              buttonText: "Join Game",
            ),
          ],
        ),
      ),
    );
  }
}
