// model/game_model.dart

class GameModel {
  List<List<String>> board;
  bool isPlayer1Turn;
  bool isGameOver;

  GameModel({
    required this.board,
    required this.isPlayer1Turn,
    required this.isGameOver,
  });
}
