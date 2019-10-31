import 'package:flutter/material.dart';
import 'package:sukamakan/model/meals_model.dart';
import 'package:sukamakan/widget/meals_item.dart';

class FavoriteScreen extends StatelessWidget {

  final List<MealsModel> favoriteMeals;

  FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
      child: Text(
      'Favorites'
      )
    );
    } else {
      return ListView.builder(
          itemCount: favoriteMeals.length,
          itemBuilder: (ctx, index) {
            return MealsItem(
              id: favoriteMeals[index].id,
              title: favoriteMeals[index].title,
              complexity: favoriteMeals[index].complexity,
              affordability: favoriteMeals[index].affordability,
              duration: favoriteMeals[index].duration,
              imageUrl: favoriteMeals[index].imageUrl,
            );
          },
        );
    }
    
  }
}