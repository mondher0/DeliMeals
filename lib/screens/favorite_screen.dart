import 'package:flutter/material.dart';
import 'package:p3/models/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeal;
  FavoriteScreen(this.favoriteMeal);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
      return Center(
        child: Text('No Favorite Added Yet! Try to add some! '),
      );
    } else {
      return ListView.builder(
        itemBuilder: ((ctx, index) {
          return MealItem(
              id: favoriteMeal[index].id,
              title: favoriteMeal[index].title,
              imageURl: favoriteMeal[index].imageUrl,
              duration: favoriteMeal[index].duration,
              complexity: favoriteMeal[index].complexity,
              affordability: favoriteMeal[index].affordability);
        }),
        itemCount: favoriteMeal.length,
      );
    }
  }
}
