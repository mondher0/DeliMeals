import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final List<Meal> availableMeals;
  // CategoryMealsScreen(this.availableMeals);
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String? categoryTitle = routeArgs['title'];
    final String? categooryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where(((meal) {
      return meal.categories.contains(categooryId);
    })).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: ListView.builder(
          itemBuilder: ((ctx, index) {
            return MealItem(
                id: categoryMeals[index].id,
                title: categoryMeals[index].title,
                imageURl: categoryMeals[index].imageUrl,
                duration: categoryMeals[index].duration,
                complexity: categoryMeals[index].complexity,
                affordability: categoryMeals[index].affordability);
          }),
          itemCount: categoryMeals.length,
        ));
  }
}
