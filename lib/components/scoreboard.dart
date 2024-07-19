import 'package:adv_tic_tac_toe/components/custom_text.dart';
import 'package:adv_tic_tac_toe/constants/colors.dart';
import 'package:adv_tic_tac_toe/models/player.dart';
import 'package:adv_tic_tac_toe/provider/game_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({super.key});

  @override
  Widget build(BuildContext context) {
    Player player1 = Provider.of<GameDataProvider>(context).player1;
    Player player2 = Provider.of<GameDataProvider>(context).player2;
    final width = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: EdgeInsets.only(left: width/9.3),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(25.0),
            child: Column(
              children: [
                CustomText(
                    shadows: [Shadow(blurRadius: 10, color: accentColor)],
                    text: 'name 2',
                    fontSize: 20),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                    shadows: [Shadow(blurRadius: 10, color: accentColor)],
                    text: 'name 2',
                    fontSize: 15),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(25.0),
            child: Column(
              children: [
                CustomText(
                  shadows: [Shadow(blurRadius: 10, color: accentColor)],
                  text: 'some name',
                  fontSize: 20,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                    shadows: [Shadow(blurRadius: 10, color: accentColor)],
                    text: 'name 2',
                    fontSize: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
