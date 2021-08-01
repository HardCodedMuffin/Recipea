class Nutrients {
  final String? calories;
  final String? carbs;
  final String? fat;
  final String? protein;

  Nutrients({
    this.calories,
    this.carbs,
    this.fat,
    this.protein,
  });

  factory Nutrients.fromJson(Map<String, dynamic> json) {
    return Nutrients(
      calories: json['calories'],
      carbs: json['carbs'],
      fat: json['fat'],
      protein: json['protein'],
    );
  }

  Map<String, dynamic> toJson() => {
        "calories": calories,
        "carbs": carbs,
        "fat": fat,
        "protein": protein,
      };

  Nutrients copyWith({
    String? calories,
    String? carbs,
    String? fat,
    String? protein,
  }) =>
      Nutrients(
        calories: calories ?? this.calories,
        carbs: carbs ?? this.carbs,
        protein: protein ?? this.protein,
        fat: fat ?? this.fat,
      );
}
