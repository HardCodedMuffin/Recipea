class Meal {
  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      id: map['id'],
      title: map['title'],
      imageUrl: 'https://spoonacular.com/recipeImages/ ${map['image']}',
    );
  }

  Meal({
    this.id,
    this.title,
    this.imageUrl,
  });

  late final int? id;
  late final String? title;
  late final String? imageUrl;
}
