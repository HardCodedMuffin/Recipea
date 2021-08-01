// To parse this JSON data, do
//
//     final recipe = recipeFromJson(jsonString);

import 'dart:convert';

Recipe recipeFromJson(String str) => Recipe.fromJson(json.decode(str));

String recipeToJson(Recipe data) => json.encode(data.toJson());

class Recipe {
  Recipe({
    this.id,
    this.title,
    this.image,
    this.imageType,
    this.servings,
    this.readyInMinutes,
    this.sourceName,
    this.healthScore,
    this.spoonacularScore,
    this.pricePerServing,
    this.analyzedInstructions,
    this.cuisines,
    this.diets,
    this.glutenFree,
    this.instructions,
    this.ketogenic,
    this.lowFodmap,
    this.occasions,
    this.sustainable,
    this.vegan,
    this.vegetarian,
    this.whole30,
    this.weightWatcherSmartPoints,
    this.dishTypes,
    this.extendedIngredients,
    this.summary,
  });

  final int? id;
  final String? title;
  final String? image;
  final String? imageType;
  final int? servings;
  final int? readyInMinutes;
  final String? sourceName;
  final double? healthScore;
  final double? spoonacularScore;
  final double? pricePerServing;
  final List<dynamic>? analyzedInstructions;
  final List<dynamic>? cuisines;
  final List<dynamic>? diets;
  final bool? glutenFree;
  final String? instructions;
  final bool? ketogenic;
  final bool? lowFodmap;
  final List<dynamic>? occasions;
  final bool? sustainable;
  final bool? vegan;
  final bool? vegetarian;
  final bool? whole30;
  final int? weightWatcherSmartPoints;
  final List<String>? dishTypes;
  final List<ExtendedIngredient>? extendedIngredients;
  final String? summary;

  Recipe copyWith({
    int? id,
    String? title,
    String? image,
    String? imageType,
    int? servings,
    int? readyInMinutes,
    String? sourceName,
    double? healthScore,
    double? spoonacularScore,
    List<dynamic>? analyzedInstructions,
    List<dynamic>? cuisines,
    bool? dairyFree,
    List<dynamic>? diets,
    bool? glutenFree,
    String? instructions,
    bool? ketogenic,
    bool? lowFodmap,
    List<dynamic>? occasions,
    bool? sustainable,
    bool? vegan,
    bool? vegetarian,
    bool? whole30,
    int? weightWatcherSmartPoints,
    List<String>? dishTypes,
    List<ExtendedIngredient>? extendedIngredients,
    String? summary,
  }) =>
      Recipe(
        id: id ?? this.id,
        title: title ?? this.title,
        image: image ?? this.image,
        imageType: imageType ?? this.imageType,
        servings: servings ?? this.servings,
        readyInMinutes: readyInMinutes ?? this.readyInMinutes,
        sourceName: sourceName ?? this.sourceName,
        healthScore: healthScore ?? this.healthScore,
        spoonacularScore: spoonacularScore ?? this.spoonacularScore,
        analyzedInstructions: analyzedInstructions ?? this.analyzedInstructions,
        cuisines: cuisines ?? this.cuisines,
        diets: diets ?? this.diets,
        glutenFree: glutenFree ?? this.glutenFree,
        instructions: instructions ?? this.instructions,
        ketogenic: ketogenic ?? this.ketogenic,
        lowFodmap: lowFodmap ?? this.lowFodmap,
        occasions: occasions ?? this.occasions,
        sustainable: sustainable ?? this.sustainable,
        vegan: vegan ?? this.vegan,
        vegetarian: vegetarian ?? this.vegetarian,
        whole30: whole30 ?? this.whole30,
        weightWatcherSmartPoints:
            weightWatcherSmartPoints ?? this.weightWatcherSmartPoints,
        dishTypes: dishTypes ?? this.dishTypes,
        extendedIngredients: extendedIngredients ?? this.extendedIngredients,
        summary: summary ?? this.summary,
      );

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        image: json["image"] == null ? null : json["image"],
        imageType: json["imageType"] == null ? null : json["imageType"],
        servings: json["servings"] == null ? null : json["servings"],
        readyInMinutes:
            json["readyInMinutes"] == null ? null : json["readyInMinutes"],
        sourceName: json["sourceName"] == null ? null : json["sourceName"],
        healthScore: json["healthScore"] == null ? null : json["healthScore"],
        spoonacularScore:
            json["spoonacularScore"] == null ? null : json["spoonacularScore"],
        analyzedInstructions: json["analyzedInstructions"] == null
            ? null
            : List<dynamic>.from(json["analyzedInstructions"].map((x) => x)),
        cuisines: json["cuisines"] == null
            ? null
            : List<dynamic>.from(json["cuisines"].map((x) => x)),
        diets: json["diets"] == null
            ? null
            : List<dynamic>.from(json["diets"].map((x) => x)),
        glutenFree: json["glutenFree"] == null ? null : json["glutenFree"],
        instructions:
            json["instructions"] == null ? null : json["instructions"],
        ketogenic: json["ketogenic"] == null ? null : json["ketogenic"],
        lowFodmap: json["lowFodmap"] == null ? null : json["lowFodmap"],
        occasions: json["occasions"] == null
            ? null
            : List<dynamic>.from(json["occasions"].map((x) => x)),
        sustainable: json["sustainable"] == null ? null : json["sustainable"],
        vegan: json["vegan"] == null ? null : json["vegan"],
        vegetarian: json["vegetarian"] == null ? null : json["vegetarian"],
        whole30: json["whole30"] == null ? null : json["whole30"],
        weightWatcherSmartPoints: json["weightWatcherSmartPoints"] == null
            ? null
            : json["weightWatcherSmartPoints"],
        dishTypes: json["dishTypes"] == null
            ? null
            : List<String>.from(json["dishTypes"].map((x) => x)),
        extendedIngredients: json["extendedIngredients"] == null
            ? null
            : List<ExtendedIngredient>.from(json["extendedIngredients"]
                .map((x) => ExtendedIngredient.fromJson(x))),
        summary: json["summary"] == null ? null : json["summary"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "image": image == null ? null : image,
        "imageType": imageType == null ? null : imageType,
        "servings": servings == null ? null : servings,
        "readyInMinutes": readyInMinutes == null ? null : readyInMinutes,
        "sourceName": sourceName == null ? null : sourceName,
        "healthScore": healthScore == null ? null : healthScore,
        "spoonacularScore": spoonacularScore == null ? null : spoonacularScore,
        "pricePerServing": pricePerServing == null ? null : pricePerServing,
        "analyzedInstructions": analyzedInstructions == null
            ? null
            : List<dynamic>.from(analyzedInstructions!.map((x) => x)),
        "cuisines": cuisines == null
            ? null
            : List<dynamic>.from(cuisines!.map((x) => x)),
        "diets":
            diets == null ? null : List<dynamic>.from(diets!.map((x) => x)),
        "glutenFree": glutenFree == null ? null : glutenFree,
        "instructions": instructions == null ? null : instructions,
        "ketogenic": ketogenic == null ? null : ketogenic,
        "lowFodmap": lowFodmap == null ? null : lowFodmap,
        "occasions": occasions == null
            ? null
            : List<dynamic>.from(occasions!.map((x) => x)),
        "sustainable": sustainable == null ? null : sustainable,
        "vegan": vegan == null ? null : vegan,
        "vegetarian": vegetarian == null ? null : vegetarian,
        "whole30": whole30 == null ? null : whole30,
        "weightWatcherSmartPoints":
            weightWatcherSmartPoints == null ? null : weightWatcherSmartPoints,
        "dishTypes": dishTypes == null
            ? null
            : List<dynamic>.from(dishTypes!.map((x) => x)),
        "extendedIngredients": extendedIngredients == null
            ? null
            : List<dynamic>.from(extendedIngredients!.map((x) => x.toJson())),
        "summary": summary == null ? null : summary,
      };
}

class ExtendedIngredient {
  ExtendedIngredient({
    this.aisle,
    this.amount,
    this.consitency,
    this.id,
    this.image,
    this.measures,
    this.meta,
    this.name,
    this.original,
    this.originalName,
    this.unit,
  });

  final String? aisle;
  final double? amount;
  final Consitency? consitency;
  final int? id;
  final String? image;
  final Measures? measures;
  final List<String>? meta;
  final String? name;
  final String? original;
  final String? originalName;
  final String? unit;

  ExtendedIngredient copyWith({
    String? aisle,
    double? amount,
    Consitency? consitency,
    int? id,
    String? image,
    Measures? measures,
    List<String>? meta,
    String? name,
    String? original,
    String? originalName,
    String? unit,
  }) =>
      ExtendedIngredient(
        aisle: aisle ?? this.aisle,
        amount: amount ?? this.amount,
        consitency: consitency ?? this.consitency,
        id: id ?? this.id,
        image: image ?? this.image,
        measures: measures ?? this.measures,
        meta: meta ?? this.meta,
        name: name ?? this.name,
        original: original ?? this.original,
        originalName: originalName ?? this.originalName,
        unit: unit ?? this.unit,
      );

  factory ExtendedIngredient.fromJson(Map<String, dynamic> json) =>
      ExtendedIngredient(
        aisle: json["aisle"] == null ? null : json["aisle"],
        amount: json["amount"] == null ? null : json["amount"].toDouble(),
        consitency: json["consitency"] == null
            ? null
            : consitencyValues.map[json["consitency"]],
        id: json["id"] == null ? null : json["id"],
        image: json["image"] == null ? null : json["image"],
        measures: json["measures"] == null
            ? null
            : Measures.fromJson(json["measures"]),
        meta: json["meta"] == null
            ? null
            : List<String>.from(json["meta"].map((x) => x)),
        name: json["name"] == null ? null : json["name"],
        original: json["original"] == null ? null : json["original"],
        originalName:
            json["originalName"] == null ? null : json["originalName"],
        unit: json["unit"] == null ? null : json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "aisle": aisle == null ? null : aisle,
        "amount": amount == null ? null : amount,
        "consitency":
            consitency == null ? null : consitencyValues.reverse![consitency!],
        "id": id == null ? null : id,
        "image": image == null ? null : image,
        "measures": measures == null ? null : measures!.toJson(),
        "meta": meta == null ? null : List<dynamic>.from(meta!.map((x) => x)),
        "name": name == null ? null : name,
        "original": original == null ? null : original,
        "originalName": originalName == null ? null : originalName,
        "unit": unit == null ? null : unit,
      };
}

enum Consitency { SOLID, LIQUID }

final consitencyValues =
    EnumValues({"liquid": Consitency.LIQUID, "solid": Consitency.SOLID});

class Measures {
  Measures({
    this.metric,
    this.us,
  });

  final Metric? metric;
  final Metric? us;

  Measures copyWith({
    Metric? metric,
    Metric? us,
  }) =>
      Measures(
        metric: metric ?? this.metric,
        us: us ?? this.us,
      );

  factory Measures.fromJson(Map<String, dynamic> json) => Measures(
        metric: json["metric"] == null ? null : Metric.fromJson(json["metric"]),
        us: json["us"] == null ? null : Metric.fromJson(json["us"]),
      );

  Map<String, dynamic> toJson() => {
        "metric": metric == null ? null : metric!.toJson(),
        "us": us == null ? null : us!.toJson(),
      };
}

class Metric {
  Metric({
    this.amount,
    this.unitLong,
    this.unitShort,
  });

  final double? amount;
  final String? unitLong;
  final String? unitShort;

  Metric copyWith({
    double? amount,
    String? unitLong,
    String? unitShort,
  }) =>
      Metric(
        amount: amount ?? this.amount,
        unitLong: unitLong ?? this.unitLong,
        unitShort: unitShort ?? this.unitShort,
      );

  factory Metric.fromJson(Map<String, dynamic> json) => Metric(
        amount: json["amount"] == null ? null : json["amount"].toDouble(),
        unitLong: json["unitLong"] == null ? null : json["unitLong"],
        unitShort: json["unitShort"] == null ? null : json["unitShort"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount == null ? null : amount,
        "unitLong": unitLong == null ? null : unitLong,
        "unitShort": unitShort == null ? null : unitShort,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
