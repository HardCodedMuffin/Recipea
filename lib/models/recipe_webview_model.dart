// To parse this JSON data, do
//
//     final recipe = recipeFromJson(jsonString);

import 'dart:convert';

RecipeSource recipeSourceFromJson(String str) =>
    RecipeSource.fromJson(json.decode(str));

String recipeSourceToJson(RecipeSource data) => json.encode(data.toJson());

class RecipeSource {
  factory RecipeSource.fromJson(Map<String, dynamic> json) => RecipeSource(
        id: json['id'],
        title: json['title'],
        sourceName: json['sourceName'],
        sourceUrl: json['sourceUrl'],
        spoonacularSourceUrl:
            json['spoonacularSourceUrl'] == null ? null : json['sourceUrl'],
      );

  RecipeSource({
    this.id,
    this.title,
    this.sourceName,
    this.sourceUrl,
    this.spoonacularSourceUrl,
  });

  final int? id;
  final String? title;
  final String? sourceName;
  final String? sourceUrl;
  final String? spoonacularSourceUrl;

  RecipeSource copyWith({
    int? id,
    String? title,
    String? image,
    String? imageType,
    int? servings,
    int? readyInMinutes,
    String? license,
    String? sourceName,
    String? sourceUrl,
    String? spoonacularSourceUrl,
  }) =>
      RecipeSource(
        id: id ?? this.id,
        title: title ?? this.title,
        sourceName: sourceName ?? this.sourceName,
        sourceUrl: sourceUrl ?? this.sourceUrl,
        spoonacularSourceUrl: spoonacularSourceUrl ?? this.spoonacularSourceUrl,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'sourceName': sourceName,
        'sourceUrl': sourceUrl,
        'spoonacularSourceUrl': spoonacularSourceUrl,
      };
}
