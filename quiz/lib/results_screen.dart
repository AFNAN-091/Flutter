import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';

class ResultsScreen extends StatelessWidget {

  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final void Function() onRestart;
  final List<String> chosenAnswers;

  List<Map<String , Object> > getSummaryData(){
    final List<Map<String, Object>> summary = [];

    for(var i=0; i<chosenAnswers.length; i++)
    {
        summary.add({
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],

        },
      );
    }

    return summary;

  }

  @override
  Widget build(BuildContext context){

    final summayData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summayData.where((answer) {

    return answer['correct_answer'] == answer['user_answer'];
    }).length;

  


    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Score $numCorrectQuestions out of $numTotalQuestions questions correctly',
               style: const TextStyle(color: Colors.white, fontSize: 24),
                textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
        
            const SizedBox(
              height: 30,
            ),
          ]
        )
      )
    );
  }
  
}