import 'package:adv_tic_tac_toe/components/custom_text.dart';
import 'package:adv_tic_tac_toe/constants/colors.dart';
import 'package:adv_tic_tac_toe/provider/game_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WaitingLobby extends StatefulWidget {
  const WaitingLobby({super.key});

  @override
  State<WaitingLobby> createState() => _WaitingLobbyState();
}

class _WaitingLobbyState extends State<WaitingLobby> {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final gameId =
        Provider.of<GameDataProvider>(context, listen: false).gameData['id'];

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomText(
            shadows: [Shadow(blurRadius: 50, color: accentColor)],
            text: 'waiting for other player to join',
            fontSize: 65,
          ),
          SizedBox(
            height: height / 35,
          ),

          CustomText(
            shadows:const [Shadow(blurRadius: 50, color: accentColor)],
            text: 'room id ${gameId.toString()}',
            fontSize: 35,
          ),
        ],
      ),
    );
  }
}
