import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersPage extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilter;
  FiltersPage(this.currentFilter, this.saveFilters);

  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;
  @override
  initState() {
    _glutenFree=widget.currentFilter['gluten'];
    _vegan=widget.currentFilter['vegan'];
    _lactoseFree=widget.currentFilter['lactose'];
    _vegetarian=widget.currentFilter['vegeterian'];
    super.initState();
  }

  Widget buildSwitchBuildTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final _selectedFilter = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegeterian': _vegetarian,
              };
              widget.saveFilters(_selectedFilter);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchBuildTile('Gluten-free',
                    'Only include Gluten-free meals', _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                buildSwitchBuildTile(
                    'Lactose-free',
                    'Only include Lactose-free meals',
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                buildSwitchBuildTile(
                    'Vegan', 'Only include Vegan meals', _vegan, (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
                buildSwitchBuildTile(
                    'Vegetarian', 'Only include Vegetarian meals', _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
