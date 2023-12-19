// view/game_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/provider/game_provider.dart';
import 'package:tic_tac_toe/utils/constants.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent.shade100,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('Tic Tac Toe'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Consumer<GameProvider>(
        builder: (context, gameProvider, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 3; i++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int j = 0; j < 3; j++)
                      GestureDetector(
                        onTap: () => gameProvider.makeMove(i, j),
                        child: Container(
                          width: Constants.buttonSize,
                          height: Constants.buttonSize,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                          child: Center(
                            child: Text(
                              gameProvider.gameModel.board[i][j],
                              style: const TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: const ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  backgroundColor: MaterialStatePropertyAll(Colors.deepOrange)),
                onPressed: gameProvider.restartGame,
                child: const Text('Restart Game'),
              ),
            ],
          );
        },
      ),
    );
  }
}
