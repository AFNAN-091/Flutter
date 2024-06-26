import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/screens/meal_details.dart';
import 'package:meal/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});

  final Meal meal;

  String get complexity{
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
  }

  String get affordability{
    return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);
  }

  void selectImage(BuildContext context){

    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> MeadDetails(meal: meal)));

  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap:() => {selectImage(context)},

        child: Stack(
          children: [
            FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl)),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(meal.title,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    maxLines:2,
                    overflow: TextOverflow.ellipsis,
                    style:const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      MealItemTrait(icon: Icons.schedule, label: '${meal.duration} min'),
                      const SizedBox(width: 8),
                      MealItemTrait(icon: Icons.work, label: complexity),
                      const SizedBox(width: 8),
                      MealItemTrait(icon: Icons.attach_money, label: affordability),

                    ],)
                  ],
                )
              )
            ),
          ],
        ),
      ),
    );
  }
}
