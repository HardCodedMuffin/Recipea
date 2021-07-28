class Meal {
  Meal({
    this.id,
    this.imageType,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
  });

  int? id;
  String? imageType;
  String? title;
  int? readyInMinutes;
  int? servings;
  String? sourceUrl;

  Meal copyWith({
    int? id,
    String? imageType,
    String? title,
    int? readyInMinutes,
    int? servings,
    String? sourceUrl,
  }) =>
      Meal(
        id: id ?? this.id,
        imageType: imageType ?? this.imageType,
        title: title ?? this.title,
        readyInMinutes: readyInMinutes ?? this.readyInMinutes,
        servings: servings ?? this.servings,
        sourceUrl: sourceUrl ?? this.sourceUrl,
      );

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        id: json["id"],
        imageType: json["imageType"],
        title: json["title"],
        readyInMinutes: json["readyInMinutes"],
        servings: json["servings"],
        sourceUrl: json["sourceUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imageType": imageType,
        "title": title,
        "readyInMinutes": readyInMinutes,
        "servings": servings,
        "sourceUrl": sourceUrl,
      };
}
