import 'package:adv_tic_tac_toe/constants/colors.dart';
import 'package:adv_tic_tac_toe/provider/game_data_provider.dart';
import 'package:adv_tic_tac_toe/resources/socket_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  
  @override
  void initState() {
    super.initState();
    _socketMethods.tappedListner(context);
  }

  final SocketMethods _socketMethods = SocketMethods();

  void tapped(int index, GameDataProvider gameDataProvider) {
    _socketMethods.tapGrid(index, gameDataProvider.gameData['id'],
        gameDataProvider.player1.playerType, gameDataProvider.displayElements);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    GameDataProvider gameDataProvider = Provider.of<GameDataProvider>(context);
    int index = gameDataProvider.gameData['playerTurn'];

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: height * 0.7),
      child: Padding(
        padding: const EdgeInsets.only(left: 4, right: 4, top: 40),
        child: AbsorbPointer(
          // if the player taping socket id is not equal then absorbing property won't accept anything
          absorbing: gameDataProvider.gameData['players'][index].socketId !=
              _socketMethods.socketClient.id,
          child: GridView.builder(
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: GestureDetector(
                  onTap: () => tapped(index, gameDataProvider),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(13)),
                      border: Border.all(
                        width: 0.9,
                        color: Colors.purple.shade300,
                      ),
                    ),
                    child: Center(
                      child: AnimatedSize(
                        duration: const Duration(microseconds: 500),
                        child: Text(gameDataProvider.displayElements[index],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 70,
                                color: Colors.white,
                                shadows: [
                                  Shadow(blurRadius: 40, color: accentColor)
                                ])),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
