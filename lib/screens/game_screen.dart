import 'package:adv_tic_tac_toe/components/game_board.dart';
import 'package:adv_tic_tac_toe/components/scoreboard.dart';
import 'package:adv_tic_tac_toe/provider/game_data_provider.dart';
import 'package:adv_tic_tac_toe/resources/socket_methods.dart';
import 'package:adv_tic_tac_toe/screens/waiting_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  static String routeName = '/game';
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.updateGameStateListner(context);
    _socketMethods.updatePlayerStateListner(context);
  }

  @override
  Widget build(BuildContext context) {
    GameDataProvider gameDataProvider = Provider.of<GameDataProvider>(context);
    int index = gameDataProvider.gameData['playerTurn'];

    return  Scaffold(
      body: SafeArea(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ScoreBoard(),
                const GameBoard(),
                Text('${gameDataProvider.gameData['players'][index].nickname}\'s turn')
              ],
            )),
    );
  }
}
