import 'package:flutter/material.dart';

import './dummy_data.dart';
import './models/meal.dart';
import './screens/settings_screen.dart';
import './screens/tabs_screens.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_details_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _favoritesMeal = [];
  void _toggleFavorite(String mealID) {
    final existingInfex =
        _favoritesMeal.indexWhere((meal) => meal.id == mealID);
    if (existingInfex >= 0) {
      setState(() {
        _favoritesMeal.removeAt(existingInfex);
      });
    } else {
      setState(() {
        _favoritesMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealID));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoritesMeal.any((meal) => meal.id == id);
  }
  // Map<String, bool> _filters = {
  //   'gluten': false,
  //   'lactose': false,
  //   'vegan': false,
  //   'vegetarian': false
  // };
  // List<Meal> _availableMeals = DUMMY_MEALS;
  //   void _setFilters(Map<String, bool> filterData) {
  //   setState(() {
  //     _filters = filterData;

  //     _availableMeals = DUMMY_MEALS.where((meal) {
  //       if (_filters['gluten']! && !meal.isGlutenFree) {
  //         return false;
  //       }
  //       if (_filters['lactose']! && !meal.isLactoseFree) {
  //         return false;
  //       }
  //       if (_filters['vegan']! && !meal.isVegan) {
  //         return false;
  //       }
  //       if (_filters['vegetarian']! && !meal.isVegetarian) {
  //         return false;
  //       }
  //       return true;
  //     }).toList();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
      ),
      routes: {
        "/": (context) => TabsScreen(_favoritesMeal),
        '/category-meals-screen': (context) => CategoryMealsScreen(),
        '/meal-details-screen': (context) =>
            MealDetailsScreen(_toggleFavorite, _isMealFavorite),
        '/settings-screen': (context) => SettingsScreen()
      },
    );
  }
}
