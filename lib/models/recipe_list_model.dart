// To parse this JSON data, do
//
//     final recipeList = recipeListFromJson(jsonString);

import 'dart:convert';

import 'package:recipea/models/recipe_model.dart';

RecipeList recipeListFromJson(String str) =>
    RecipeList.fromJson(json.decode(str));

String recipeListToJson(RecipeList data) => json.encode(data.toJson());

class RecipeList {
  RecipeList({
    this.recipes,
  });

  List<Recipe>? recipes;

  RecipeList copyWith({
    List<Recipe>? recipes,
  }) =>
      RecipeList(
        recipes: recipes ?? this.recipes,
      );

  factory RecipeList.fromJson(Map<String, dynamic> json) => RecipeList(
        recipes:
            List<Recipe>.from(json["recipes"].map((x) => Recipe.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "recipes": List<dynamic>.from(recipes!.map((x) => x.toJson())),
      };
}
