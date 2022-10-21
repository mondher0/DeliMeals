import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  final Function toggleFavorite;
  final Function isFavoriteMeal;
  MealDetailsScreen(this.toggleFavorite, this.isFavoriteMeal);
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectMEal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectMEal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectMEal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Ingrediants',
                style: TextStyle(
                    fontFamily: 'RobotoCondensed',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                height: 200,
                width: 300,
                child: ListView.builder(
                  itemBuilder: ((ctx, index) {
                    return Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          selectMEal.ingredients[index],
                        ),
                      ),
                    );
                  }),
                  itemCount: selectMEal.ingredients.length,
                )),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Steps',
                style: TextStyle(
                    fontFamily: 'RobotoCondensed',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                height: 200,
                width: 300,
                child: ListView.builder(
                  itemBuilder: ((ctx, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(child: Text('#${index + 1}')),
                          title: Text(selectMEal.steps[index]),
                        ),
                        Divider()
                      ],
                    );
                  }),
                  itemCount: selectMEal.steps.length,
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavoriteMeal(mealId) ? Icons.star : Icons.star_border),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
