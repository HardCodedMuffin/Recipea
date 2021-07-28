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
    this.license,
    this.sourceName,
    this.sourceUrl,
    this.spoonacularSourceUrl,
    this.aggregateLikes,
    this.healthScore,
    this.spoonacularScore,
    this.pricePerServing,
    this.analyzedInstructions,
    this.cheap,
    this.creditsText,
    this.cuisines,
    this.dairyFree,
    this.diets,
    this.gaps,
    this.glutenFree,
    this.instructions,
    this.ketogenic,
    this.lowFodmap,
    this.occasions,
    this.sustainable,
    this.vegan,
    this.vegetarian,
    this.veryHealthy,
    this.veryPopular,
    this.whole30,
    this.weightWatcherSmartPoints,
    this.dishTypes,
    this.extendedIngredients,
    this.summary,
    this.winePairing,
  });

  final int? id;
  final String? title;
  final String? image;
  final String? imageType;
  final int? servings;
  final int? readyInMinutes;
  final String? license;
  final String? sourceName;
  final String? sourceUrl;
  final String? spoonacularSourceUrl;
  final int? aggregateLikes;
  final double? healthScore;
  final double? spoonacularScore;
  final double? pricePerServing;
  final List<dynamic>? analyzedInstructions;
  final bool? cheap;
  final String? creditsText;
  final List<dynamic>? cuisines;
  final bool? dairyFree;
  final List<dynamic>? diets;
  final String? gaps;
  final bool? glutenFree;
  final String? instructions;
  final bool? ketogenic;
  final bool? lowFodmap;
  final List<dynamic>? occasions;
  final bool? sustainable;
  final bool? vegan;
  final bool? vegetarian;
  final bool? veryHealthy;
  final bool? veryPopular;
  final bool? whole30;
  final int? weightWatcherSmartPoints;
  final List<String>? dishTypes;
  final List<ExtendedIngredient>? extendedIngredients;
  final String? summary;
  final WinePairing? winePairing;

  Recipe copyWith({
    int? id,
    String? title,
    String? image,
    String? imageType,
    int? servings,
    int? readyInMinutes,
    String? license,
    String? sourceName,
    String? sourceUrl,
    String? spoonacularSourceUrl,
    int? aggregateLikes,
    double? healthScore,
    double? spoonacularScore,
    double? pricePerServing,
    List<dynamic>? analyzedInstructions,
    bool? cheap,
    String? creditsText,
    List<dynamic>? cuisines,
    bool? dairyFree,
    List<dynamic>? diets,
    String? gaps,
    bool? glutenFree,
    String? instructions,
    bool? ketogenic,
    bool? lowFodmap,
    List<dynamic>? occasions,
    bool? sustainable,
    bool? vegan,
    bool? vegetarian,
    bool? veryHealthy,
    bool? veryPopular,
    bool? whole30,
    int? weightWatcherSmartPoints,
    List<String>? dishTypes,
    List<ExtendedIngredient>? extendedIngredients,
    String? summary,
    WinePairing? winePairing,
  }) =>
      Recipe(
        id: id ?? this.id,
        title: title ?? this.title,
        image: image ?? this.image,
        imageType: imageType ?? this.imageType,
        servings: servings ?? this.servings,
        readyInMinutes: readyInMinutes ?? this.readyInMinutes,
        license: license ?? this.license,
        sourceName: sourceName ?? this.sourceName,
        sourceUrl: sourceUrl ?? this.sourceUrl,
        spoonacularSourceUrl: spoonacularSourceUrl ?? this.spoonacularSourceUrl,
        aggregateLikes: aggregateLikes ?? this.aggregateLikes,
        healthScore: healthScore ?? this.healthScore,
        spoonacularScore: spoonacularScore ?? this.spoonacularScore,
        pricePerServing: pricePerServing ?? this.pricePerServing,
        analyzedInstructions: analyzedInstructions ?? this.analyzedInstructions,
        cheap: cheap ?? this.cheap,
        creditsText: creditsText ?? this.creditsText,
        cuisines: cuisines ?? this.cuisines,
        dairyFree: dairyFree ?? this.dairyFree,
        diets: diets ?? this.diets,
        gaps: gaps ?? this.gaps,
        glutenFree: glutenFree ?? this.glutenFree,
        instructions: instructions ?? this.instructions,
        ketogenic: ketogenic ?? this.ketogenic,
        lowFodmap: lowFodmap ?? this.lowFodmap,
        occasions: occasions ?? this.occasions,
        sustainable: sustainable ?? this.sustainable,
        vegan: vegan ?? this.vegan,
        vegetarian: vegetarian ?? this.vegetarian,
        veryHealthy: veryHealthy ?? this.veryHealthy,
        veryPopular: veryPopular ?? this.veryPopular,
        whole30: whole30 ?? this.whole30,
        weightWatcherSmartPoints: weightWatcherSmartPoints ?? this.weightWatcherSmartPoints,
        dishTypes: dishTypes ?? this.dishTypes,
        extendedIngredients: extendedIngredients ?? this.extendedIngredients,
        summary: summary ?? this.summary,
        winePairing: winePairing ?? this.winePairing,
      );

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    image: json["image"] == null ? null : json["image"],
    imageType: json["imageType"] == null ? null : json["imageType"],
    servings: json["servings"] == null ? null : json["servings"],
    readyInMinutes: json["readyInMinutes"] == null ? null : json["readyInMinutes"],
    license: json["license"] == null ? null : json["license"],
    sourceName: json["sourceName"] == null ? null : json["sourceName"],
    sourceUrl: json["sourceUrl"] == null ? null : json["sourceUrl"],
    spoonacularSourceUrl: json["spoonacularSourceUrl"] == null ? null : json["spoonacularSourceUrl"],
    aggregateLikes: json["aggregateLikes"] == null ? null : json["aggregateLikes"],
    healthScore: json["healthScore"] == null ? null : json["healthScore"],
    spoonacularScore: json["spoonacularScore"] == null ? null : json["spoonacularScore"],
    pricePerServing: json["pricePerServing"] == null ? null : json["pricePerServing"].toDouble(),
    analyzedInstructions: json["analyzedInstructions"] == null ? null : List<dynamic>.from(json["analyzedInstructions"].map((x) => x)),
    cheap: json["cheap"] == null ? null : json["cheap"],
    creditsText: json["creditsText"] == null ? null : json["creditsText"],
    cuisines: json["cuisines"] == null ? null : List<dynamic>.from(json["cuisines"].map((x) => x)),
    dairyFree: json["dairyFree"] == null ? null : json["dairyFree"],
    diets: json["diets"] == null ? null : List<dynamic>.from(json["diets"].map((x) => x)),
    gaps: json["gaps"] == null ? null : json["gaps"],
    glutenFree: json["glutenFree"] == null ? null : json["glutenFree"],
    instructions: json["instructions"] == null ? null : json["instructions"],
    ketogenic: json["ketogenic"] == null ? null : json["ketogenic"],
    lowFodmap: json["lowFodmap"] == null ? null : json["lowFodmap"],
    occasions: json["occasions"] == null ? null : List<dynamic>.from(json["occasions"].map((x) => x)),
    sustainable: json["sustainable"] == null ? null : json["sustainable"],
    vegan: json["vegan"] == null ? null : json["vegan"],
    vegetarian: json["vegetarian"] == null ? null : json["vegetarian"],
    veryHealthy: json["veryHealthy"] == null ? null : json["veryHealthy"],
    veryPopular: json["veryPopular"] == null ? null : json["veryPopular"],
    whole30: json["whole30"] == null ? null : json["whole30"],
    weightWatcherSmartPoints: json["weightWatcherSmartPoints"] == null ? null : json["weightWatcherSmartPoints"],
    dishTypes: json["dishTypes"] == null ? null : List<String>.from(json["dishTypes"].map((x) => x)),
    extendedIngredients: json["extendedIngredients"] == null ? null : List<ExtendedIngredient>.from(json["extendedIngredients"].map((x) => ExtendedIngredient.fromJson(x))),
    summary: json["summary"] == null ? null : json["summary"],
    winePairing: json["winePairing"] == null ? null : WinePairing.fromJson(json["winePairing"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "image": image == null ? null : image,
    "imageType": imageType == null ? null : imageType,
    "servings": servings == null ? null : servings,
    "readyInMinutes": readyInMinutes == null ? null : readyInMinutes,
    "license": license == null ? null : license,
    "sourceName": sourceName == null ? null : sourceName,
    "sourceUrl": sourceUrl == null ? null : sourceUrl,
    "spoonacularSourceUrl": spoonacularSourceUrl == null ? null : spoonacularSourceUrl,
    "aggregateLikes": aggregateLikes == null ? null : aggregateLikes,
    "healthScore": healthScore == null ? null : healthScore,
    "spoonacularScore": spoonacularScore == null ? null : spoonacularScore,
    "pricePerServing": pricePerServing == null ? null : pricePerServing,
    "analyzedInstructions": analyzedInstructions == null ? null : List<dynamic>.from(analyzedInstructions!.map((x) => x)),
    "cheap": cheap == null ? null : cheap,
    "creditsText": creditsText == null ? null : creditsText,
    "cuisines": cuisines == null ? null : List<dynamic>.from(cuisines!.map((x) => x)),
    "dairyFree": dairyFree == null ? null : dairyFree,
    "diets": diets == null ? null : List<dynamic>.from(diets!.map((x) => x)),
    "gaps": gaps == null ? null : gaps,
    "glutenFree": glutenFree == null ? null : glutenFree,
    "instructions": instructions == null ? null : instructions,
    "ketogenic": ketogenic == null ? null : ketogenic,
    "lowFodmap": lowFodmap == null ? null : lowFodmap,
    "occasions": occasions == null ? null : List<dynamic>.from(occasions!.map((x) => x)),
    "sustainable": sustainable == null ? null : sustainable,
    "vegan": vegan == null ? null : vegan,
    "vegetarian": vegetarian == null ? null : vegetarian,
    "veryHealthy": veryHealthy == null ? null : veryHealthy,
    "veryPopular": veryPopular == null ? null : veryPopular,
    "whole30": whole30 == null ? null : whole30,
    "weightWatcherSmartPoints": weightWatcherSmartPoints == null ? null : weightWatcherSmartPoints,
    "dishTypes": dishTypes == null ? null : List<dynamic>.from(dishTypes!.map((x) => x)),
    "extendedIngredients": extendedIngredients == null ? null : List<dynamic>.from(extendedIngredients!.map((x) => x.toJson())),
    "summary": summary == null ? null : summary,
    "winePairing": winePairing == null ? null : winePairing!.toJson(),
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

  factory ExtendedIngredient.fromJson(Map<String, dynamic> json) => ExtendedIngredient(
    aisle: json["aisle"] == null ? null : json["aisle"],
    amount: json["amount"] == null ? null : json["amount"].toDouble(),
    consitency: json["consitency"] == null ? null : consitencyValues.map[json["consitency"]],
    id: json["id"] == null ? null : json["id"],
    image: json["image"] == null ? null : json["image"],
    measures: json["measures"] == null ? null : Measures.fromJson(json["measures"]),
    meta: json["meta"] == null ? null : List<String>.from(json["meta"].map((x) => x)),
    name: json["name"] == null ? null : json["name"],
    original: json["original"] == null ? null : json["original"],
    originalName: json["originalName"] == null ? null : json["originalName"],
    unit: json["unit"] == null ? null : json["unit"],
  );

  Map<String, dynamic> toJson() => {
    "aisle": aisle == null ? null : aisle,
    "amount": amount == null ? null : amount,
    "consitency": consitency == null ? null : consitencyValues.reverse![consitency!],
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

final consitencyValues = EnumValues({
  "liquid": Consitency.LIQUID,
  "solid": Consitency.SOLID
});

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

class WinePairing {
  WinePairing({
    this.pairedWines,
    this.pairingText,
    this.productMatches,
  });

  final List<String>? pairedWines;
  final String? pairingText;
  final List<ProductMatch>? productMatches;

  WinePairing copyWith({
    List<String>? pairedWines,
    String? pairingText,
    List<ProductMatch>? productMatches,
  }) =>
      WinePairing(
        pairedWines: pairedWines ?? this.pairedWines,
        pairingText: pairingText ?? this.pairingText,
        productMatches: productMatches ?? this.productMatches,
      );

  factory WinePairing.fromJson(Map<String, dynamic> json) => WinePairing(
    pairedWines: json["pairedWines"] == null ? null : List<String>.from(json["pairedWines"].map((x) => x)),
    pairingText: json["pairingText"] == null ? null : json["pairingText"],
    productMatches: json["productMatches"] == null ? null : List<ProductMatch>.from(json["productMatches"].map((x) => ProductMatch.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pairedWines": pairedWines == null ? null : List<dynamic>.from(pairedWines!.map((x) => x)),
    "pairingText": pairingText == null ? null : pairingText,
    "productMatches": productMatches == null ? null : List<dynamic>.from(productMatches!.map((x) => x.toJson())),
  };
}

class ProductMatch {
  ProductMatch({
    this.id,
    this.title,
    this.description,
    this.price,
    this.imageUrl,
    this.averageRating,
    this.ratingCount,
    this.score,
    this.link,
  });

  final int? id;
  final String? title;
  final String? description;
  final String? price;
  final String? imageUrl;
  final double? averageRating;
  final int? ratingCount;
  final double? score;
  final String? link;

  ProductMatch copyWith({
    int? id,
    String? title,
    String? description,
    String? price,
    String? imageUrl,
    double? averageRating,
    int? ratingCount,
    double? score,
    String? link,
  }) =>
      ProductMatch(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        price: price ?? this.price,
        imageUrl: imageUrl ?? this.imageUrl,
        averageRating: averageRating ?? this.averageRating,
        ratingCount: ratingCount ?? this.ratingCount,
        score: score ?? this.score,
        link: link ?? this.link,
      );

  factory ProductMatch.fromJson(Map<String, dynamic> json) => ProductMatch(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    description: json["description"] == null ? null : json["description"],
    price: json["price"] == null ? null : json["price"],
    imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
    averageRating: json["averageRating"] == null ? null : json["averageRating"].toDouble(),
    ratingCount: json["ratingCount"] == null ? null : json["ratingCount"],
    score: json["score"] == null ? null : json["score"].toDouble(),
    link: json["link"] == null ? null : json["link"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "description": description == null ? null : description,
    "price": price == null ? null : price,
    "imageUrl": imageUrl == null ? null : imageUrl,
    "averageRating": averageRating == null ? null : averageRating,
    "ratingCount": ratingCount == null ? null : ratingCount,
    "score": score == null ? null : score,
    "link": link == null ? null : link,
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
