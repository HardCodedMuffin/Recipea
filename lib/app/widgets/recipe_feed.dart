import 'package:flutter/material.dart';
import 'package:recipea_app/app/widgets/recipe_card.dart';
import 'package:recipea_app/models/models.dart';
import 'package:recipea_app/services/spooncular_api.dart';

class RecipeFeed extends StatefulWidget {
  const RecipeFeed({Key? key}) : super(key: key);

  @override
  _RecipeFeedState createState() => _RecipeFeedState();
}

class _RecipeFeedState extends State<RecipeFeed> {
  late Search _recipeList;
  bool _isLoading = true;
  late final int _count = 10;

  @override
  void initState() {
    super.initState();
    getRecipes(_count);
  }

  Future<void> getRecipes(int count) async {
    _recipeList = await APIService.instance.fetchPopularRecipes(count);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.grey))
          : ListView.builder(
        itemCount: _recipeList.result!.length,
        itemBuilder: (context, index) {
          return RecipeCard(
              id: _recipeList.result![index].id!,
              title: _recipeList.result![index].title!,
              cookTime:
              _recipeList.result![index].readyInMinutes.toString(),
              rating:
              _recipeList.result![index].spoonacularScore!,
              thumbnailUrl: _recipeList.result![index].image!);
        },
      ),
    );
  }
}

