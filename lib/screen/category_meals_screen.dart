import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sukamakan/model/meals_model.dart';
import '../widget/meals_item.dart';

class CategoryMealsScreen extends StatefulWidget {

  final List <MealsModel> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();

}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<MealsModel> categoryMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (! _loadedInitData) {
      final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    categoryMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    }
    
    _loadedInitData = true;
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    // CategoryMealsScreen(this.title);
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (ctx, index) {
            return MealsItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
              duration: categoryMeals[index].duration,
              imageUrl: categoryMeals[index].imageUrl,
            
            );
          },
        ));
  }
}
