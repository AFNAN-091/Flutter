import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectAnswer, {super.key});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
        width: double.infinity,
        child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  currentQuestion.text,
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                ...currentQuestion.getShuffledAnswer().map((answer) {
                  return AnswerButton(
                    answerText: answer,
                    onTap: () => answerQuestion(answer),
                  );
                }),
              ],
            )));
  }
}
