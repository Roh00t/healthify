import 'package:flutter/material.dart';
import 'package:healthify/models/recipe.api.dart';
import 'package:healthify/models/recipe.dart';
import 'package:healthify/widgets/recipe_card.dart';
class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List <Recipe> _recipes;
  bool _isLoading = true;
  
  @override
  void initState() {
    super.initState();
    getRecipies();
  }
  Future <void> getRecipies() async{
    _recipes = await RecipeApi.getRecipe();
    setState(() {
          _isLoading = false;
        });
        print(_recipes);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu),
              SizedBox(width: 10),
              Text('Food Recipes'),
            ],
          ),
        ),
        body: RecipeCard(
          title: 'My recipe',
          rating: '4.9',
          cookTime: '30 min',
          thumbnailUrl: 'https://lh3.googleusercontent.com/ei5eF1LRFkkcekhjdR_8XgOqgdjpomf-rda_vvh7jIauCgLlEWORINSKMRR6I6iTcxxZL9riJwFqKMvK0ixS0xwnRHGMY4I5Zw=s360',
        ));
  }
  }