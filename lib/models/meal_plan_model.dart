// To parse this JSON data, do
//
//     final mealPlan = mealPlanFromJson(jsonString);

import 'dart:convert';

import 'meal_model.dart';
import 'nutrients_model.dart';

MealPlan mealPlanFromJson(String str) => MealPlan.fromJson(json.decode(str));

String mealPlanToJson(MealPlan data) => json.encode(data.toJson());

class MealPlan {
  MealPlan({
    this.meals,
    this.nutrients,
  });

  List<Meal>? meals;
  Nutrients? nutrients;

  MealPlan copyWith({
    List<Meal>? meals,
    Nutrients? nutrients,
  }) =>
      MealPlan(
        meals: meals ?? this.meals,
        nutrients: nutrients ?? this.nutrients,
      );

  factory MealPlan.fromJson(Map<String, dynamic> json) => MealPlan(
        meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
        nutrients: Nutrients.fromJson(json["nutrients"]),
      );

  Map<String, dynamic> toJson() => {
        "meals": List<dynamic>.from(meals!.map((x) => x.toJson())),
        "nutrients": nutrients!.toJson(),
      };
}
