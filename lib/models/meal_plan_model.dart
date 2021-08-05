// To parse this JSON data, do
//
//     final mealPlan = mealPlanFromJson(jsonString);

import 'dart:convert';

import 'meal_model.dart';

MealPlan mealPlanFromJson(String str) => MealPlan.fromJson(json.decode(str));

String mealPlanToJson(MealPlan data) => json.encode(data.toJson());

class MealPlan {
  MealPlan({
    this.meals,
    this.nutrients,
  });

  List<Meal>? meals;
  MealNutrients? nutrients;

  MealPlan copyWith({
    List<Meal>? meals,
    MealNutrients? nutrients,
  }) =>
      MealPlan(
        meals: meals ?? this.meals,
        nutrients: nutrients ?? this.nutrients,
      );

  factory MealPlan.fromJson(Map<String, dynamic> json) => MealPlan(
        meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
        nutrients: MealNutrients.fromJson(json["nutrients"]),
      );

  Map<String, dynamic> toJson() => {
        "meals": List<dynamic>.from(meals!.map((x) => x.toJson())),
        "nutrients": nutrients!.toJson(),
      };
}

class MealNutrients {
  MealNutrients({
    this.calories,
    this.protein,
    this.fat,
    this.carbohydrates,
  });

  double? calories;
  double? protein;
  double? fat;
  double? carbohydrates;

  MealNutrients copyWith({
    double? calories,
    double? protein,
    double? fat,
    double? carbohydrates,
  }) =>
      MealNutrients(
        calories: calories ?? this.calories,
        protein: protein ?? this.protein,
        fat: fat ?? this.fat,
        carbohydrates: carbohydrates ?? this.carbohydrates,
      );

  factory MealNutrients.fromJson(Map<String, dynamic> json) => MealNutrients(
    calories: json["calories"].toDouble(),
    protein: json["protein"].toDouble(),
    fat: json["fat"].toDouble(),
    carbohydrates: json["carbohydrates"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "calories": calories,
    "protein": protein,
    "fat": fat,
    "carbohydrates": carbohydrates,
  };
}