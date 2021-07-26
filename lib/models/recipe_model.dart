class Recipe {
  factory Recipe.fromMap(Map<String, dynamic> json) {
    return Recipe(
      spoonacularSourceUrl: json['spoonacularSourceUrl'],
    );
  }

  Recipe({
    required this.spoonacularSourceUrl,
  });

  final String spoonacularSourceUrl;
// Equipment
// Ingredients
// Steps
// etc.
}
