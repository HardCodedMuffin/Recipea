class Meal {
  Meal({
    required this.id,
    required this.title,
    this.imageType,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
  });

  int id;
  String title;
  String? imageType;
  int? readyInMinutes;
  int? servings;
  String? sourceUrl;

  Meal copyWith({
    int? id,
    String? title,
    String? imageType,
    int? readyInMinutes,
    int? servings,
    String? sourceUrl,
  }) =>
      Meal(
        id: id ?? this.id,
        title: title ?? this.title,
        imageType: imageType ?? this.imageType,
        readyInMinutes: readyInMinutes ?? this.readyInMinutes,
        servings: servings ?? this.servings,
        sourceUrl: sourceUrl ?? this.sourceUrl,
      );

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
    id: json["id"],
    title: json["title"],
    imageType: json["imageType"],
    readyInMinutes: json["readyInMinutes"],
    servings: json["servings"],
    sourceUrl: json["sourceUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "imageType": imageType,
    "readyInMinutes": readyInMinutes,
    "servings": servings,
    "sourceUrl": sourceUrl,
  };
}