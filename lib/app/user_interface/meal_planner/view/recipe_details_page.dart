import 'package:flutter/material.dart';
import 'package:recipea/models/models.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({Key? key, this.mealType, this.recipe}) : super(key: key);

  final String? mealType;
  final Recipe? recipe;

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mealType!),
      ),
      body: WebView(
        initialUrl: widget.recipe!.spoonacularSourceUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
