import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{

  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context){
    return ElevatedButton(
     onPressed: onTap,
      style: ElevatedButton.styleFrom(
        
        padding: const EdgeInsets.symmetric(horizontal: 40,
        vertical: 10,
        ),
        backgroundColor: Colors.pink[100],
        shape: const StadiumBorder(),
       
      ),
      child: Text(
        answerText,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.black,  
          
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}