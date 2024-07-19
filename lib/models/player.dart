class Player {
  final String nickname;
  final String playerType;
  final String socketId;
  final double points;

  Player({
    required this.nickname,
    required this.playerType,
    required this.socketId,
    required this.points,
  });

  Map<String, dynamic> toMap() {
    return {
      'nickname': nickname,
      'socketId': socketId,
      'points': points,
      'playerType': playerType,
    };
  }

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      nickname: map['nickname'] ?? '',
      playerType: map['playerType'] ?? '',
      socketId: map['socketId'] ?? '',
      points: map['points'] ?? '',
    );
  }

  Player copyWith({
    String? nickname,
    String? socketId,
    double? points,
    String? playerType,
  }) {
    return Player(
        nickname: nickname ?? this.nickname,
        playerType: playerType ?? this.playerType,
        socketId: socketId ?? this.socketId,
        points: points ?? this.points);
  }
}
