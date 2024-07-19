import 'package:adv_tic_tac_toe/components/show_error_snack_bar.dart';
import 'package:adv_tic_tac_toe/provider/game_data_provider.dart';
import 'package:adv_tic_tac_toe/resources/socket_client.dart';
import 'package:adv_tic_tac_toe/screens/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketMethods {
  final _socketClinet = SocketClient.instance.socket!;
  
  Socket get socketClient => _socketClinet;

  void createRoom(String nickname) {
    if (nickname.isNotEmpty) {
      _socketClinet.emit('createRoom', {'nickname': nickname});
    }
  }

  void tapGrid(int index, String gameId, String playerType,
      List<String> displayElements) {
    if (displayElements[index] == '') {
      _socketClinet.emit(
          'tap', {'index': index, 'gameId': gameId, 'playerType': playerType});
    }
  }

  void joinGame(String nickname, int gameId) {
    if (nickname.isNotEmpty) {
      _socketClinet.emit('joinRoom', {
        'nickname': nickname,
        'gameId': gameId,
      });
    }
  }

// here we need build context as we are performfing an action that requires
// access to current build structure of app ie navigator
  void createGameSuccessListner(BuildContext context) {
    _socketClinet.on('gameSuccessfullyCreated', (createdGame) {
      Provider.of<GameDataProvider>(context, listen: false)
          .updateGameData(createdGame);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }

// see if works or not
  void joinGameSuccessListner(BuildContext context) {
    _socketClinet.on('gameJoindedSuccessfully', (joinedGame) {
      Provider.of<GameDataProvider>(context, listen: false)
          .updateGameData(joinedGame);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }

  void onErrorOccured(BuildContext context) {
    _socketClinet.on('errorOccured', (data) {
      showSnackBar(context, data);
    });
  }

  void updatePlayerStateListner(BuildContext context) {
    _socketClinet.on('updatePlayers', (playerData) {
      Provider.of<GameDataProvider>(context, listen: false).updatePlayer1(
        playerData[0],
      );

      Provider.of<GameDataProvider>(context, listen: false).updatePlayer2(
        playerData[1],
      );
    });
  }

  void updateGameStateListner(BuildContext context) {
    _socketClinet.on('updateGame', (gameData) {
      Provider.of<GameDataProvider>(context, listen: false)
          .updateGameData(gameData);
    });
  }

  void tappedListner(BuildContext context) {
    _socketClinet.on('tapped', (updatedData) {
      Provider.of<GameDataProvider>(context, listen: false)
          .updateDisplayElements(
        updatedData['index'],
        updatedData['tappedChoice'],
      );

      Provider.of<GameDataProvider>(context).updateGameData(
        updatedData['afterTurn'],
      );
    });
  }
}
