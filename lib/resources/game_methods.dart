import 'package:adv_tic_tac_toe/provider/game_data_provider.dart';
import 'package:adv_tic_tac_toe/resources/socket_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckWinner {
  void declareWinner(BuildContext context, GameDataProvider provider) {
    final GameDataProvider gameDataProvider = Provider.of<GameDataProvider>(
      context,
      listen: false,
    );

    String winner = '';
    // checking for first row
    if (gameDataProvider.displayElements[0] ==
            gameDataProvider.displayElements[1] &&
        gameDataProvider.displayElements[0] ==
            gameDataProvider.displayElements[2] &&
        gameDataProvider.displayElements[0] != '') {
      winner = gameDataProvider.displayElements[0];
    } else if (gameDataProvider.displayElements[3] ==
            gameDataProvider.displayElements[4] &&
        gameDataProvider.displayElements[3] ==
            gameDataProvider.displayElements[5] &&
        gameDataProvider.displayElements[3] != '') {
      winner = gameDataProvider.displayElements[3];
    } else if (gameDataProvider.displayElements[6] ==
            gameDataProvider.displayElements[7] &&
        gameDataProvider.displayElements[6] ==
            gameDataProvider.displayElements[8] &&
        gameDataProvider.displayElements[6] != '') {
      winner = gameDataProvider.displayElements[6];
    } else if (gameDataProvider.displayElements[0] ==
            gameDataProvider.displayElements[3] &&
        gameDataProvider.displayElements[0] ==
            gameDataProvider.displayElements[6] &&
        gameDataProvider.displayElements[0] != '') {
      winner = gameDataProvider.displayElements[0];
    } else if (gameDataProvider.displayElements[1] ==
            gameDataProvider.displayElements[4] &&
        gameDataProvider.displayElements[1] ==
            gameDataProvider.displayElements[7] &&
        gameDataProvider.displayElements[1] != '') {
      winner = gameDataProvider.displayElements[1];
    } else if (gameDataProvider.displayElements[2] ==
            gameDataProvider.displayElements[5] &&
        gameDataProvider.displayElements[2] ==
            gameDataProvider.displayElements[8] &&
        gameDataProvider.displayElements[2] != '') {
      winner = gameDataProvider.displayElements[2];
    } else if (gameDataProvider.displayElements[0] ==
            gameDataProvider.displayElements[4] &&
        gameDataProvider.displayElements[0] ==
            gameDataProvider.displayElements[8] &&
        gameDataProvider.displayElements[0] != '') {
      winner = gameDataProvider.displayElements[0];
    } else if (gameDataProvider.displayElements[2] ==
            gameDataProvider.displayElements[4] &&
        gameDataProvider.displayElements[2] ==
            gameDataProvider.displayElements[6] &&
        gameDataProvider.displayElements[2] != '') {
      winner = gameDataProvider.displayElements[2];
    } else if (gameDataProvider.filledBoxes == 9) {
      winner = '';
      // display dialog box
    }

    if (winner == gameDataProvider.player1.playerType) {
      // display winner is player 1
      SocketMethods().socketClient.emit('winner',{
        'winnerSocketId' : gameDataProvider.player1.socketId,
        'roomId' : gameDataProvider.gameData['id']
      });
    }

    if (winner == gameDataProvider.player2.playerType) {
      // display winner is player 1
      SocketMethods().socketClient.emit('winner',{
        'winnerSocketId' : gameDataProvider.player2.socketId,
        'roomId' : gameDataProvider.gameData['id']
      });
    }
  }
}
