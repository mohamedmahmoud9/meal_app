import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './categories_page.dart';
import './favorite_page.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;
  @override
  void initState() {
    _pages = [
      {'page': CategoriesPage(), 'title': 'Categories'},
      {'page': FavoritePage(widget.favoriteMeals), 'title': 'Your Favorite'}
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.shifting,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.favorite),
            title: Text('Favorite'),
          )
        ],
      ),
    );
  }
}
