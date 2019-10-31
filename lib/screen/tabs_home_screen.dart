import 'package:flutter/material.dart';
import 'package:sukamakan/model/meals_model.dart';
import 'package:sukamakan/screen/category_screen.dart';
import 'package:sukamakan/screen/favorite_screen.dart';
import 'package:sukamakan/widget/drawer_item.dart';

class TabsHomeScreen extends StatefulWidget {
  final List<MealsModel> favoriteMeals;

  TabsHomeScreen(this.favoriteMeals);

  @override
  _TabsHomeScreenState createState() => _TabsHomeScreenState();
}

class _TabsHomeScreenState extends State<TabsHomeScreen> {
   List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  void _selectedIndex(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
    {
      'pages' :  CategoriesScreen(),
      'title' : 'Categories'
    },
     {
      'pages' :  FavoriteScreen(widget.favoriteMeals),
      'title' : 'Favorites'
    }
  ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: DrawerItem(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        onTap: _selectedIndex,
      ),
      body: _pages[_selectedPageIndex]['pages'],
    );
  }
}
