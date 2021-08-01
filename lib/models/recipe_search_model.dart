// To parse this JSON data, do
//
//     final recipe = recipeFromJson(jsonString);

import 'dart:convert';

import 'package:recipea_app/models/recipe_model.dart';

class Search {
  final List<Recipe>? result;
  final String? baseUri;
  final int? totalResults;

  Search({this.result, this.baseUri, this.totalResults});

  factory Search.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;

    List<Recipe> listResult =
        list.map((f) => Recipe.fromJson(f)).toList();

    return Search(
        result: listResult,
        baseUri: json['baseUri'],
        totalResults: json['totalResults']);
  }
}

RecipeSource recipeSourceFromJson(String str) =>
    RecipeSource.fromJson(json.decode(str));

String recipeSourceToJson(RecipeSource data) => json.encode(data.toJson());

class RecipeSource {
  factory RecipeSource.fromJson(Map<String, dynamic> json) => RecipeSource(
        id: json['id'],
        title: json['title'],
        readyInMinutes: json['readyInMinutes'],
        servings: json['servings'],
        image: json['image'],
        sourceName: json['sourceName'],
        sourceUrl: json['sourceUrl'],
        spoonacularSourceUrl:
            json['spoonacularSourceUrl'] == null ? null : json['sourceUrl'],
      );

  RecipeSource({
    this.id,
    this.title,
    this.image,
    this.readyInMinutes,
    this.spoonacularScore,
    this.servings,
    this.sourceName,
    this.sourceUrl,
    this.spoonacularSourceUrl,
  });

  final int? id;
  final String? title;
  final int? readyInMinutes;
  final double? spoonacularScore;
  final int? servings;
  final String? image;
  final String? sourceName;
  final String? sourceUrl;
  final String? spoonacularSourceUrl;

  RecipeSource copyWith({
    int? id,
    String? title,
    String? image,
    int? servings,
    int? readyInMinutes,
    double? spoonacularScore,
    String? sourceName,
    String? sourceUrl,
    String? spoonacularSourceUrl,
  }) =>
      RecipeSource(
        id: id ?? this.id,
        title: title ?? this.title,
        servings: servings ?? this.servings,
        readyInMinutes: readyInMinutes ?? this.readyInMinutes,
        spoonacularScore: spoonacularScore ?? this.spoonacularScore,
        image: image ?? this.image,
        sourceName: sourceName ?? this.sourceName,
        sourceUrl: sourceUrl ?? this.sourceUrl,
        spoonacularSourceUrl: spoonacularSourceUrl ?? this.spoonacularSourceUrl,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'servings': servings,
        'readyInMinutes': readyInMinutes,
        'spoonacularScore': spoonacularScore,
        'image': image,
        'sourceName': sourceName,
        'sourceUrl': sourceUrl,
        'spoonacularSourceUrl': spoonacularSourceUrl,
      };
}
