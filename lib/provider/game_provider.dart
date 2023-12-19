// provider/game_provider.dart

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/model/game_model.dart';

class GameProvider extends ChangeNotifier {
  late GameModel gameModel;

  GameProvider() {
    initializeGame();
  }

  void initializeGame() {
    gameModel = GameModel(
      board: List.generate(3, (_) => List.filled(3, '')),
      isPlayer1Turn: true,
      isGameOver: false,
    );
  }

  void makeMove(int row, int col) {
    if (!gameModel.isGameOver && gameModel.board[row][col].isEmpty) {
      gameModel.board[row][col] = gameModel.isPlayer1Turn ? 'X' : 'O';
      checkWinner(row, col);
      gameModel.isPlayer1Turn = !gameModel.isPlayer1Turn;
      notifyListeners();
    }
  }

  void checkWinner(int row, int col) {
    // Check rows and columns
    for (int i = 0; i < 3; i++) {
      if (gameModel.board[row][i] != gameModel.board[row][col] ||
          gameModel.board[i][col] != gameModel.board[row][col]) {
        return;
      }
    }

    // Check diagonals
    if ((row == col || row + col == 2) &&
        (gameModel.board[0][0] == gameModel.board[row][col] &&
            gameModel.board[1][1] == gameModel.board[row][col] &&
            gameModel.board[2][2] == gameModel.board[row][col]) ||
        (gameModel.board[0][2] == gameModel.board[row][col] &&
            gameModel.board[1][1] == gameModel.board[row][col] &&
            gameModel.board[2][0] == gameModel.board[row][col])) {
      gameModel.isGameOver = true;
    }

    // Check if the board is full
    bool isBoardFull = true;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (gameModel.board[i][j].isEmpty) {
          isBoardFull = false;
          break;
        }
      }
    }

    if (isBoardFull) {
      gameModel.isGameOver = true;
    }
  }

  void restartGame() {
    initializeGame();
    notifyListeners();
  }
}
