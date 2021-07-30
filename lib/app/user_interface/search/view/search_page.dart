import 'package:flutter/material.dart';
import 'package:recipea/app/app.dart';
import 'package:recipea/models/models.dart';
import 'package:recipea/services/spooncular_api.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Inspired'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.bookmark_add_outlined),
          ),
        ],
      ),
      body: _isLoading
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

