// view/splash_screen.dart

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/game');
    });

    return const Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(
        child: Text(
          'Tic Tac Toe Game \n              By \n     ItsElexender',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}
