class Nutrients {
  Nutrients({
    this.calories,
    this.carbohydrates,
    this.fat,
    this.protein,
  });

  double? calories;
  double? carbohydrates;
  double? fat;
  double? protein;

  Nutrients copyWith({
    double? calories,
    double? carbohydrates,
    double? fat,
    double? protein,
  }) =>
      Nutrients(
        calories: calories ?? this.calories,
        carbohydrates: carbohydrates ?? this.carbohydrates,
        fat: fat ?? this.fat,
        protein: protein ?? this.protein,
      );

  factory Nutrients.fromJson(Map<String, dynamic> json) => Nutrients(
        calories: json["calories"].toDouble(),
        carbohydrates: json["carbohydrates"].toDouble(),
        fat: json["fat"].toDouble(),
        protein: json["protein"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "calories": calories,
        "carbohydrates": carbohydrates,
        "fat": fat,
        "protein": protein,
      };
}
