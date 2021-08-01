import 'package:flutter/material.dart';
import 'package:recipea/app/app.dart';
import 'package:recipea/models/models.dart';
import 'package:recipea/services/spooncular_api.dart';

class RecipeFeed extends StatefulWidget {
  const RecipeFeed({Key? key}) : super(key: key);

  @override
  _RecipeFeedState createState() => _RecipeFeedState();
}

class _RecipeFeedState extends State<RecipeFeed> {
  late RecipeList _recipeList;
  bool _isLoading = true;
  late final int _count = 10;

  @override
  void initState() {
    super.initState();
    getRecipes(_count);
  }

  Future<void> getRecipes(int count) async {
    _recipeList = await APIService.instance.fetchRecipes(count);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _recipeList.recipes!.length,
        itemBuilder: (context, index) {
          return CustomCard(
              id: _recipeList.recipes![index].id!,
              title: _recipeList.recipes![index].title!,
              cookTime:
              _recipeList.recipes![index].readyInMinutes.toString(),
              rating:
              _recipeList.recipes![index].spoonacularScore.toString(),
              thumbnailUrl: _recipeList.recipes![index].image!);
        },
      ),
    );
  }
}

