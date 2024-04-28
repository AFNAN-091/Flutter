import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
              opacity: 0.3,
              child: Image.asset('assets/images/icon.png', width: 200)),
          const SizedBox(height: 50),
          const Text(
            'QUIZ APP',
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              shape: const StadiumBorder(),
              side: const BorderSide(width: 2, color: Colors.white),
              foregroundColor: const Color.fromARGB(255, 237, 223, 252),
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              'START QUIZ',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
