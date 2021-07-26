import 'package:flutter/material.dart';
import 'package:recipea/models/recipe_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecipeDetails extends StatefulWidget {
  const RecipeDetails({Key? key, required this.mealType, required this.recipe})
      : super(key: key);

  final String mealType;
  final Recipe recipe;

  @override
  _RecipeDetailsState createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mealType),
      ),
      body: WebView(
        initialUrl: widget.recipe.spoonacularSourceUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}