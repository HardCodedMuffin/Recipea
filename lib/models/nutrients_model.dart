class Nutrients {
  Nutrients({
    this.calories,
    this.protein,
    this.fat,
    this.carbohydrates,
  });

  double? calories;
  double? protein;
  double? fat;
  double? carbohydrates;

  Nutrients copyWith({
    double? calories,
    double? protein,
    double? fat,
    double? carbohydrates,
  }) =>
      Nutrients(
        calories: calories ?? this.calories,
        protein: protein ?? this.protein,
        fat: fat ?? this.fat,
        carbohydrates: carbohydrates ?? this.carbohydrates,
      );

  factory Nutrients.fromJson(Map<String, dynamic> json) => Nutrients(
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
