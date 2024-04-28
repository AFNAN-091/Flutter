import 'package:meal/data/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:meal/models/category.dart';
import 'package:meal/widgets/category_grid_item.dart';
import 'package:meal/screens/meals.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  

  void selectCategory(BuildContext context, Category category) {

    final filteredMeals = dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();

    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(title: category.title, meals: filteredMeals)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryItem(category:category,
                onSelectCategory: () => {
                      selectCategory(context,category),
                    })
        ],
      ),
    );
  }
}
