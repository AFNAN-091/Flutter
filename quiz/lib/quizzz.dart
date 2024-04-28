import 'package:flutter/material.dart';
import 'package:quiz/questions_screen.dart';
import 'package:quiz/start_screen.dart';
import 'package:quiz/data/questions.dart';

class Quizzz extends StatefulWidget {
  const Quizzz({super.key});

  @override
  State<Quizzz> createState() {
    return _QuizzzState();
  }
}

class _QuizzzState extends State<Quizzz> {

  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

   void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(chooseAnswer);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 27, 6, 129),
                Color(0xFF20BDFF),
                Color(0xFFA5FECB),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
