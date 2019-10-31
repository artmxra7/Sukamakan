import 'package:flutter/material.dart';
import 'package:sukamakan/data/dummy_data.dart';
import 'package:sukamakan/model/meals_model.dart';
import 'package:sukamakan/screen/category_meals_screen.dart';
import 'package:sukamakan/screen/filters_screen.dart';
import 'package:sukamakan/screen/meals_detail_screen.dart';
import 'package:sukamakan/screen/tabs_home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<MealsModel> _availableMeals = DUMMY_MEALS;
  List<MealsModel> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorites(String mealsId) {
    final existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealsId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealsId),
        );
      });
    }
  }

  bool _isMealFavorite (String id){
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'sukamakan',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 20, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 20, 51, 1)),
              title: TextStyle(
                fontFamily: 'RobotoConsended',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      routes: {
        '/': (BuildContext ctx) => TabsHomeScreen(_favoriteMeals),
        '/category-meals': (BuildContext ctx) =>
            CategoryMealsScreen(_availableMeals),
        '/meals-detail': (BuildContext ctx) => MealsDetail(_toggleFavorites, _isMealFavorite),
        '/filters': (BuildContext ctx) => FilterScreens(_setFilters, _filters),
      },
      initialRoute: '/',
    );
  }
}
