import 'package:flutter/material.dart';
import 'package:recipea/models/recipe_webview_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({Key? key, this.mealType, this.recipeSource})
      : super(key: key);

  final String? mealType;
  final RecipeSource? recipeSource;

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(widget.mealType!),
      ),
      body: WebView(
        initialUrl: widget.recipeSource!.spoonacularSourceUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
