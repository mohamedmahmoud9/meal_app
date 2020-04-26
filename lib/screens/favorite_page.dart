import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
class FavoritePage extends StatefulWidget {
  final List<Meal> favoriteMeals;
  FavoritePage(this.favoriteMeals);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    if(widget.favoriteMeals.isEmpty){
    return Center(
      child: Text('You have no favorite yet - start adding some!'),
    );}
    else{
     return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: widget.favoriteMeals[index].id,
            title: widget.favoriteMeals[index].title,
            imageUrl: widget.favoriteMeals[index].imageUrl,
            duration: widget.favoriteMeals[index].duration,
            complexity: widget.favoriteMeals[index].complexity,
            affordability: widget.favoriteMeals[index].affordability,
          );
        },
        itemCount: widget.favoriteMeals.length,
      );
    }
  }
}