import 'package:flutter/material.dart';
import 'package:sukamakan/widget/drawer_item.dart';

class FilterScreens extends StatefulWidget {
  final Function saveFilters;
  final Map<String, bool> currentFilter;
  FilterScreens(this.saveFilters, this.currentFilter);
  @override
  _FilterScreensState createState() => _FilterScreensState();
}

class _FilterScreensState extends State<FilterScreens> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() { 
    _glutenFree = widget.currentFilter['gluten'];
    _vegetarian = widget.currentFilter['vegetarian'];
    _vegan = widget.currentFilter['vegan'];
    _lactoseFree = widget.currentFilter['lactose'];
    super.initState();
    
  }

  Widget buildSwitchTile(
      String title, String description, bool currentValue, Function update,) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text('Only include glutten-free meals.'),
      onChanged: update,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Screen'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilter = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilter);
              })
        ],
      ),
      drawer: DrawerItem(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection!',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchTile(
                    'Glutten-free', 'Only Include Glutten-free ', _glutenFree,
                    (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                buildSwitchTile(
                    'Lactose-free', 'Only Include Lactose-free ', _lactoseFree,
                    (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                buildSwitchTile(
                    'Vegetarian', 'Only Include Vegetarian', _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                buildSwitchTile('Vegans', 'Only Include Vegan ', _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
