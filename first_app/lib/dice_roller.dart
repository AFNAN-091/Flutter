import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget{
    const DiceRoller({super.key});

    @override
    State<DiceRoller> createState(){
      return _DiceRollerState();
    }

}



class _DiceRollerState extends State<DiceRoller>{


  var currentDiceRoll = 1;

  void rollDice(){
      setState(() {
        currentDiceRoll = Random().nextInt(6) + 1;
      });
  }

  @override
  Widget build(context){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
      Image.asset(
        'assets/images/dice-$currentDiceRoll.png',
        width: 200
        ),

        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF858585),
            backgroundColor: Colors.white,
            textStyle: const TextStyle(
            fontSize: 28,
            ),
          ),  
          child: const Text('Roll Dice'),
        )
     ],
    );
  }
}