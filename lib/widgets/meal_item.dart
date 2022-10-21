import 'package:flutter/material.dart';
import '../models/meal.dart';


class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageURl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  MealItem(
      {required this.id,
      required this.title,
      required this.imageURl,
      required this.duration,
      required this.complexity,
      required this.affordability});
  get complexityText {
    if (complexity == Complexity.Simple) {
      return 'simple';
    }
    if (complexity == Complexity.Challenging) {
      return 'challenging';
    }
    if (complexity == Complexity.Hard) {
      return 'hard';
    }
  }

  get affordabilityText {
    if (affordability == Affordability.Affordable) {
      return 'affordable';
    }
    if (affordability == Affordability.Luxurious) {
      return 'luxurious';
    }
    if (affordability == Affordability.Pricey) {
      return 'pricey';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed('/meal-details-screen', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  imageURl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 26),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ))
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.schedule),
                    SizedBox(
                      width: 6,
                    ),
                    Text('$duration min')
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.work),
                    SizedBox(
                      width: 6,
                    ),
                    Text(complexityText)
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.attach_money),
                    SizedBox(
                      width: 6,
                    ),
                    Text(affordabilityText)
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
