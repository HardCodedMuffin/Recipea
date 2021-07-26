import 'package:recipea/models/meal_model.dart';

class MealPlan {
  factory MealPlan.fromMap(Map<String, dynamic> json) {
    var meals = <Meal>[];
    json['meals'].forEach((mealMap) => meals.add(Meal.fromMap(mealMap)));
    return MealPlan(
      meals: meals,
      calories: json['nutrients']['calories'],
      carbs: json['nutrients']['carbohydrates'],
      fat: json['nutrients']['fat'],
      protein: json['nutrients']['protein'],
    );
  }

  MealPlan({
    this.meals,
    this.calories,
    this.carbs,
    this.fat,
    this.protein,
  });

  final List<Meal>? meals;
  final double? calories;
  final double? carbs;
  final double? fat;
  final double? protein;
}
