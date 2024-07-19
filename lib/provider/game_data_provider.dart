import 'package:adv_tic_tac_toe/models/player.dart';
import 'package:flutter/material.dart';

class GameDataProvider extends ChangeNotifier {
  Map<String, dynamic> _gameData = {};
  List<String> _dispalyElement = ['', '', '', '', '', '', '', '', ''];
  
  int filledBoxes = 0;

  Player _player1 = Player(
    nickname: '',
    playerType: 'X',
    socketId: '',
    points: 0,
  );

  Player _player2 = Player(
    nickname: '',
    playerType: 'O',
    socketId: '',
    points: 0,
  );

// getters
  Map<String, dynamic> get gameData => _gameData;
  List<String> get displayElements => _dispalyElement;
  Player get player1 => _player1;
  Player get player2 => _player2;

  // now we have to make sure that whatever is passed to our crated game data is storred in the private created vaarible

  void updateGameData(Map<String, dynamic> data) {
    _gameData = data;
    notifyListeners();
  }

  void updatePlayer1(Map<String, dynamic> playerData) {
    _player1 = Player.fromMap(playerData);
    notifyListeners();
  }

  void updatePlayer2(Map<String, dynamic> playerData) {
    _player2 = Player.fromMap(playerData);
    notifyListeners();
  }

  void updateDisplayElements(int index, String choice) {
    _dispalyElement[index] = choice;
    filledBoxes++;
    notifyListeners();
  }
}
