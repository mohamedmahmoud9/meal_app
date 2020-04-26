import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsPage extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;
  CategoryMealsPage(this.availableMeals);

  @override
  _CategoryMealsPageState createState() => _CategoryMealsPageState();
}

class _CategoryMealsPageState extends State<CategoryMealsPage> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData=false;
  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routesArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routesArgs['title'];
      final categoryId = routesArgs['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData=true;
    }

    super.didChangeDependencies();
  }
  void _removeMeal(String mealId){
    setState(() {
      displayedMeals.removeWhere((meal)=>meal.id==mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
          //  removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
