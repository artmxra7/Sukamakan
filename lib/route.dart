import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sukamakan/screen/category_meals_screen.dart';
import 'package:sukamakan/screen/meals_detail_screen.dart';
import 'package:sukamakan/screen/tabs_home_screen.dart';

class RoutesProvider {

  static final routes = <String, WidgetBuilder>{
    '/': (BuildContext ctx) => TabsHomeScreen(),
    '/category-meals': (BuildContext ctx) =>
        CategoryMealsScreen(),
    '/meals-detail': (BuildContext ctx) => MealsDetail(),
  };
}
