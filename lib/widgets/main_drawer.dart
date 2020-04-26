import 'package:flutter/material.dart';
// import 'package:meal_app/screens/categories_page.dart';
import '../screens/filters_page.dart';
// import 'package:meal_app/screens/tabs_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon,Function handler) {
    return ListTile(
      onTap:handler,
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.bottomLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up !',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meals',Icons.restaurant,(){
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filters',Icons.settings,(){
            Navigator.of(context).pushReplacementNamed(FiltersPage.routeName);
          }),
        ],
      ),
    );
  }
}
