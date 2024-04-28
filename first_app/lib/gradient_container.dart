import 'package:first_app/dice_roller.dart';
import 'package:flutter/material.dart';

const startAlignment = Alignment.topLeft;


class GradientContainer extends StatelessWidget{

  GradientContainer(this.color1, this.color2,{super.key});
 
  final Color color1;
  final Color color2;
  
  @override
  Widget build(context){ 
    return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color1, color2], 
              begin: startAlignment,
              end: Alignment.bottomRight,
            ),
          ),

          
          child: const Center(
            child: DiceRoller(),
          ),
          
          
        );
  }
}


// class GradientContainer extends StatelessWidget{
//   const GradientContainer(this.colors,{super.key});
 
//   final List<Color> colors;

//   @override
//   Widget build(context){
//     return Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: colors, 
//               begin: startAlignment,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           child: const Center(
//             child: StyledText('Hello AFnaN')
              
//               ),
//           );
//   }
// }