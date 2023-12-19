import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/provider/game_provider.dart';
import 'package:tic_tac_toe/view/game_screen.dart';
import 'package:tic_tac_toe/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic Tac Toe',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/game': (context) => ChangeNotifierProvider(
              create: (context) => GameProvider(),
              child: const GameScreen(),
            ),
      },
    );
  }
}