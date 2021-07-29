class Recipe {
  Recipe({
    this.vegetarian,
    this.vegan,
    this.glutenFree,
    this.dairyFree,
    this.veryHealthy,
    this.cheap,
    this.veryPopular,
    this.sustainable,
    this.weightWatcherSmartPoints,
    this.gaps,
    this.lowFodmap,
    this.aggregateLikes,
    this.spoonacularScore,
    this.healthScore,
    this.creditsText,
    this.license,
    this.sourceName,
    this.pricePerServing,
    this.extendedIngredients,
    this.id,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
    this.image,
    this.imageType,
    this.nutrition,
    this.summary,
    this.cuisines,
    this.dishTypes,
    this.diets,
    this.occasions,
    this.winePairing,
    this.instructions,
    this.analyzedInstructions,
    this.originalId,
    this.spoonacularSourceUrl,
  });

  bool? vegetarian;
  bool? vegan;
  bool? glutenFree;
  bool? dairyFree;
  bool? veryHealthy;
  bool? cheap;
  bool? veryPopular;
  bool? sustainable;
  int? weightWatcherSmartPoints;
  String? gaps;
  bool? lowFodmap;
  int? aggregateLikes;
  double? spoonacularScore;
  double? healthScore;
  String? creditsText;
  String? license;
  String? sourceName;
  double? pricePerServing;
  List<ExtendedIngredient>? extendedIngredients;
  int? id;
  String? title;
  int? readyInMinutes;
  int? servings;
  String? sourceUrl;
  String? image;
  String? imageType;
  Nutrition? nutrition;
  String? summary;
  List<dynamic>? cuisines;
  List<String>? dishTypes;
  List<dynamic>? diets;
  List<dynamic>? occasions;
  WinePairing? winePairing;
  String? instructions;
  List<dynamic>? analyzedInstructions;
  dynamic originalId;
  String? spoonacularSourceUrl;

  Recipe copyWith({
    bool? vegetarian,
    bool? vegan,
    bool? glutenFree,
    bool? dairyFree,
    bool? veryHealthy,
    bool? cheap,
    bool? veryPopular,
    bool? sustainable,
    int? weightWatcherSmartPoints,
    String? gaps,
    bool? lowFodmap,
    int? aggregateLikes,
    double? spoonacularScore,
    double? healthScore,
    String? creditsText,
    String? license,
    String? sourceName,
    double? pricePerServing,
    List<ExtendedIngredient>? extendedIngredients,
    int? id,
    String? title,
    int? readyInMinutes,
    int? servings,
    String? sourceUrl,
    String? image,
    String? imageType,
    Nutrition? nutrition,
    String? summary,
    List<dynamic>? cuisines,
    List<String>? dishTypes,
    List<dynamic>? diets,
    List<dynamic>? occasions,
    WinePairing? winePairing,
    String? instructions,
    List<dynamic>? analyzedInstructions,
    dynamic originalId,
    String? spoonacularSourceUrl,
  }) =>
      Recipe(
        vegetarian: vegetarian ?? this.vegetarian,
        vegan: vegan ?? this.vegan,
        glutenFree: glutenFree ?? this.glutenFree,
        dairyFree: dairyFree ?? this.dairyFree,
        veryHealthy: veryHealthy ?? this.veryHealthy,
        cheap: cheap ?? this.cheap,
        veryPopular: veryPopular ?? this.veryPopular,
        sustainable: sustainable ?? this.sustainable,
        weightWatcherSmartPoints:
        weightWatcherSmartPoints ?? this.weightWatcherSmartPoints,
        gaps: gaps ?? this.gaps,
        lowFodmap: lowFodmap ?? this.lowFodmap,
        aggregateLikes: aggregateLikes ?? this.aggregateLikes,
        spoonacularScore: spoonacularScore ?? this.spoonacularScore,
        healthScore: healthScore ?? this.healthScore,
        creditsText: creditsText ?? this.creditsText,
        license: license ?? this.license,
        sourceName: sourceName ?? this.sourceName,
        pricePerServing: pricePerServing ?? this.pricePerServing,
        extendedIngredients: extendedIngredients ?? this.extendedIngredients,
        id: id ?? this.id,
        title: title ?? this.title,
        readyInMinutes: readyInMinutes ?? this.readyInMinutes,
        servings: servings ?? this.servings,
        sourceUrl: sourceUrl ?? this.sourceUrl,
        image: image ?? this.image,
        imageType: imageType ?? this.imageType,
        nutrition: nutrition ?? this.nutrition,
        summary: summary ?? this.summary,
        cuisines: cuisines ?? this.cuisines,
        dishTypes: dishTypes ?? this.dishTypes,
        diets: diets ?? this.diets,
        occasions: occasions ?? this.occasions,
        winePairing: winePairing ?? this.winePairing,
        instructions: instructions ?? this.instructions,
        analyzedInstructions: analyzedInstructions ?? this.analyzedInstructions,
        originalId: originalId ?? this.originalId,
        spoonacularSourceUrl: spoonacularSourceUrl ?? this.spoonacularSourceUrl,
      );

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
    vegetarian: json["vegetarian"],
    vegan: json["vegan"],
    glutenFree: json["glutenFree"],
    dairyFree: json["dairyFree"],
    veryHealthy: json["veryHealthy"],
    cheap: json["cheap"],
    veryPopular: json["veryPopular"],
    sustainable: json["sustainable"],
    weightWatcherSmartPoints: json["weightWatcherSmartPoints"],
    gaps: json["gaps"],
    lowFodmap: json["lowFodmap"],
    aggregateLikes: json["aggregateLikes"],
    spoonacularScore: json["spoonacularScore"],
    healthScore: json["healthScore"],
    creditsText: json["creditsText"],
    license: json["license"],
    sourceName: json["sourceName"],
    pricePerServing: json["pricePerServing"].toDouble(),
    extendedIngredients: List<ExtendedIngredient>.from(
        json["extendedIngredients"]
            .map((x) => ExtendedIngredient.fromJson(x))),
    id: json["id"],
    title: json["title"],
    readyInMinutes: json["readyInMinutes"],
    servings: json["servings"],
    sourceUrl: json["sourceUrl"],
    image: json["image"],
    imageType: json["imageType"],
    nutrition: Nutrition.fromJson(json["nutrition"]),
    summary: json["summary"],
    cuisines: List<dynamic>.from(json["cuisines"].map((x) => x)),
    dishTypes: List<String>.from(json["dishTypes"].map((x) => x)),
    diets: List<dynamic>.from(json["diets"].map((x) => x)),
    occasions: List<dynamic>.from(json["occasions"].map((x) => x)),
    winePairing: WinePairing.fromJson(json["winePairing"]),
    instructions: json["instructions"],
    analyzedInstructions:
    List<dynamic>.from(json["analyzedInstructions"].map((x) => x)),
    originalId: json["originalId"],
    spoonacularSourceUrl: json["spoonacularSourceUrl"],
  );

  Map<String, dynamic> toJson() => {
    "vegetarian": vegetarian,
    "vegan": vegan,
    "glutenFree": glutenFree,
    "dairyFree": dairyFree,
    "veryHealthy": veryHealthy,
    "cheap": cheap,
    "veryPopular": veryPopular,
    "sustainable": sustainable,
    "weightWatcherSmartPoints": weightWatcherSmartPoints,
    "gaps": gaps,
    "lowFodmap": lowFodmap,
    "aggregateLikes": aggregateLikes,
    "spoonacularScore": spoonacularScore,
    "healthScore": healthScore,
    "creditsText": creditsText,
    "license": license,
    "sourceName": sourceName,
    "pricePerServing": pricePerServing,
    "extendedIngredients":
    List<dynamic>.from(extendedIngredients!.map((x) => x.toJson())),
    "id": id,
    "title": title,
    "readyInMinutes": readyInMinutes,
    "servings": servings,
    "sourceUrl": sourceUrl,
    "image": image,
    "imageType": imageType,
    "nutrition": nutrition!.toJson(),
    "summary": summary,
    "cuisines": List<dynamic>.from(cuisines!.map((x) => x)),
    "dishTypes": List<dynamic>.from(dishTypes!.map((x) => x)),
    "diets": List<dynamic>.from(diets!.map((x) => x)),
    "occasions": List<dynamic>.from(occasions!.map((x) => x)),
    "winePairing": winePairing!.toJson(),
    "instructions": instructions,
    "analyzedInstructions":
    List<dynamic>.from(analyzedInstructions!.map((x) => x)),
    "originalId": originalId,
    "spoonacularSourceUrl": spoonacularSourceUrl,
  };
}

class ExtendedIngredient {
  ExtendedIngredient({
    this.id,
    this.aisle,
    this.image,
    this.consistency,
    this.name,
    this.nameClean,
    this.original,
    this.originalString,
    this.originalName,
    this.amount,
    this.unit,
    this.meta,
    this.metaInformation,
    this.measures,
  });

  int? id;
  String? aisle;
  String? image;
  Consistency? consistency;
  String? name;
  String? nameClean;
  String? original;
  String? originalString;
  String? originalName;
  double? amount;
  String? unit;
  List<String>? meta;
  List<String>? metaInformation;
  Measures? measures;

  ExtendedIngredient copyWith({
    int? id,
    String? aisle,
    String? image,
    Consistency? consistency,
    String? name,
    String? nameClean,
    String? original,
    String? originalString,
    String? originalName,
    double? amount,
    String? unit,
    List<String>? meta,
    List<String>? metaInformation,
    Measures? measures,
  }) =>
      ExtendedIngredient(
        id: id ?? this.id,
        aisle: aisle ?? this.aisle,
        image: image ?? this.image,
        consistency: consistency ?? this.consistency,
        name: name ?? this.name,
        nameClean: nameClean ?? this.nameClean,
        original: original ?? this.original,
        originalString: originalString ?? this.originalString,
        originalName: originalName ?? this.originalName,
        amount: amount ?? this.amount,
        unit: unit ?? this.unit,
        meta: meta ?? this.meta,
        metaInformation: metaInformation ?? this.metaInformation,
        measures: measures ?? this.measures,
      );

  factory ExtendedIngredient.fromJson(Map<String, dynamic> json) =>
      ExtendedIngredient(
        id: json["id"],
        aisle: json["aisle"],
        image: json["image"],
        consistency: consistencyValues.map[json["consistency"]],
        name: json["name"],
        nameClean: json["nameClean"],
        original: json["original"],
        originalString: json["originalString"],
        originalName: json["originalName"],
        amount: json["amount"].toDouble(),
        unit: json["unit"],
        meta: List<String>.from(json["meta"].map((x) => x)),
        metaInformation:
        List<String>.from(json["metaInformation"].map((x) => x)),
        measures: Measures.fromJson(json["measures"]),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "aisle": aisle,
    "image": image,
    "consistency": consistencyValues.reverse![consistency!],
    "name": name,
    "nameClean": nameClean,
    "original": original,
    "originalString": originalString,
    "originalName": originalName,
    "amount": amount,
    "unit": unit,
    "meta": List<dynamic>.from(meta!.map((x) => x)),
    "metaInformation": List<dynamic>.from(metaInformation!.map((x) => x)),
    "measures": measures!.toJson(),
  };
}

enum Consistency { SOLID, LIQUID }

final consistencyValues =
EnumValues({"liquid": Consistency.LIQUID, "solid": Consistency.SOLID});

class Measures {
  Measures({
    this.us,
    this.metric,
  });

  Metric? us;
  Metric? metric;

  Measures copyWith({
    Metric? us,
    Metric? metric,
  }) =>
      Measures(
        us: us ?? this.us,
        metric: metric ?? this.metric,
      );

  factory Measures.fromJson(Map<String, dynamic> json) => Measures(
    us: Metric.fromJson(json["us"]),
    metric: Metric.fromJson(json["metric"]),
  );

  Map<String, dynamic> toJson() => {
    "us": us!.toJson(),
    "metric": metric!.toJson(),
  };
}

class Metric {
  Metric({
    this.amount,
    this.unitShort,
    this.unitLong,
  });

  double? amount;
  String? unitShort;
  String? unitLong;

  Metric copyWith({
    double? amount,
    String? unitShort,
    String? unitLong,
  }) =>
      Metric(
        amount: amount ?? this.amount,
        unitShort: unitShort ?? this.unitShort,
        unitLong: unitLong ?? this.unitLong,
      );

  factory Metric.fromJson(Map<String, dynamic> json) => Metric(
    amount: json["amount"].toDouble(),
    unitShort: json["unitShort"],
    unitLong: json["unitLong"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "unitShort": unitShort,
    "unitLong": unitLong,
  };
}

class Nutrition {
  Nutrition({
    this.nutrients,
    this.properties,
    this.flavonoids,
    this.ingredients,
    this.caloricBreakdown,
    this.weightPerServing,
  });

  List<Flavonoid>? nutrients;
  List<Flavonoid>? properties;
  List<Flavonoid>? flavonoids;
  List<Ingredient>? ingredients;
  CaloricBreakdown? caloricBreakdown;
  WeightPerServing? weightPerServing;

  Nutrition copyWith({
    List<Flavonoid>? nutrients,
    List<Flavonoid>? properties,
    List<Flavonoid>? flavonoids,
    List<Ingredient>? ingredients,
    CaloricBreakdown? caloricBreakdown,
    WeightPerServing? weightPerServing,
  }) =>
      Nutrition(
        nutrients: nutrients ?? this.nutrients,
        properties: properties ?? this.properties,
        flavonoids: flavonoids ?? this.flavonoids,
        ingredients: ingredients ?? this.ingredients,
        caloricBreakdown: caloricBreakdown ?? this.caloricBreakdown,
        weightPerServing: weightPerServing ?? this.weightPerServing,
      );

  factory Nutrition.fromJson(Map<String, dynamic> json) => Nutrition(
    nutrients: List<Flavonoid>.from(
        json["nutrients"].map((x) => Flavonoid.fromJson(x))),
    properties: List<Flavonoid>.from(
        json["properties"].map((x) => Flavonoid.fromJson(x))),
    flavonoids: List<Flavonoid>.from(
        json["flavonoids"].map((x) => Flavonoid.fromJson(x))),
    ingredients: List<Ingredient>.from(
        json["ingredients"].map((x) => Ingredient.fromJson(x))),
    caloricBreakdown: CaloricBreakdown.fromJson(json["caloricBreakdown"]),
    weightPerServing: WeightPerServing.fromJson(json["weightPerServing"]),
  );

  Map<String, dynamic> toJson() => {
    "nutrients": List<dynamic>.from(nutrients!.map((x) => x.toJson())),
    "properties": List<dynamic>.from(properties!.map((x) => x.toJson())),
    "flavonoids": List<dynamic>.from(flavonoids!.map((x) => x.toJson())),
    "ingredients": List<dynamic>.from(ingredients!.map((x) => x.toJson())),
    "caloricBreakdown": caloricBreakdown!.toJson(),
    "weightPerServing": weightPerServing!.toJson(),
  };
}

class CaloricBreakdown {
  CaloricBreakdown({
    this.percentProtein,
    this.percentFat,
    this.percentCarbs,
  });

  double? percentProtein;
  double? percentFat;
  double? percentCarbs;

  CaloricBreakdown copyWith({
    double? percentProtein,
    double? percentFat,
    double? percentCarbs,
  }) =>
      CaloricBreakdown(
        percentProtein: percentProtein ?? this.percentProtein,
        percentFat: percentFat ?? this.percentFat,
        percentCarbs: percentCarbs ?? this.percentCarbs,
      );

  factory CaloricBreakdown.fromJson(Map<String, dynamic> json) =>
      CaloricBreakdown(
        percentProtein: json["percentProtein"].toDouble(),
        percentFat: json["percentFat"].toDouble(),
        percentCarbs: json["percentCarbs"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
    "percentProtein": percentProtein,
    "percentFat": percentFat,
    "percentCarbs": percentCarbs,
  };
}

class Flavonoid {
  Flavonoid({
    this.name,
    this.title,
    this.amount,
    this.unit,
    this.percentOfDailyNeeds,
  });

  String? name;
  String? title;
  double? amount;
  Unit? unit;
  double? percentOfDailyNeeds;

  Flavonoid copyWith({
    String? name,
    String? title,
    double? amount,
    Unit? unit,
    double? percentOfDailyNeeds,
  }) =>
      Flavonoid(
        name: name ?? this.name,
        title: title ?? this.title,
        amount: amount ?? this.amount,
        unit: unit ?? this.unit,
        percentOfDailyNeeds: percentOfDailyNeeds ?? this.percentOfDailyNeeds,
      );

  factory Flavonoid.fromJson(Map<String, dynamic> json) => Flavonoid(
    name: json["name"],
    title: json["title"],
    amount: json["amount"].toDouble(),
    unit: unitValues.map[json["unit"]],
    percentOfDailyNeeds: json["percentOfDailyNeeds"] == null
        ? null
        : json["percentOfDailyNeeds"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "title": title,
    "amount": amount,
    "unit": unitValues.reverse![unit!],
    "percentOfDailyNeeds":
    percentOfDailyNeeds == null ? null : percentOfDailyNeeds,
  };
}

enum Unit { MG, EMPTY, G, UNIT_G, KCAL, IU }

final unitValues = EnumValues({
  "": Unit.EMPTY,
  "g": Unit.G,
  "IU": Unit.IU,
  "kcal": Unit.KCAL,
  "mg": Unit.MG,
  "µg": Unit.UNIT_G
});

class Ingredient {
  Ingredient({
    this.id,
    this.name,
    this.amount,
    this.unit,
    this.nutrients,
  });

  int? id;
  String? name;
  double? amount;
  String? unit;
  List<Flavonoid>? nutrients;

  Ingredient copyWith({
    int? id,
    String? name,
    double? amount,
    String? unit,
    List<Flavonoid>? nutrients,
  }) =>
      Ingredient(
        id: id ?? this.id,
        name: name ?? this.name,
        amount: amount ?? this.amount,
        unit: unit ?? this.unit,
        nutrients: nutrients ?? this.nutrients,
      );

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
    id: json["id"],
    name: json["name"],
    amount: json["amount"].toDouble(),
    unit: json["unit"],
    nutrients: List<Flavonoid>.from(
        json["nutrients"].map((x) => Flavonoid.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "amount": amount,
    "unit": unit,
    "nutrients": List<dynamic>.from(nutrients!.map((x) => x.toJson())),
  };
}

class WeightPerServing {
  WeightPerServing({
    this.amount,
    this.unit,
  });

  int? amount;
  Unit? unit;

  WeightPerServing copyWith({
    int? amount,
    Unit? unit,
  }) =>
      WeightPerServing(
        amount: amount ?? this.amount,
        unit: unit ?? this.unit,
      );

  factory WeightPerServing.fromJson(Map<String, dynamic> json) =>
      WeightPerServing(
        amount: json["amount"],
        unit: unitValues.map[json["unit"]],
      );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "unit": unitValues.reverse![unit!],
  };
}

class WinePairing {
  WinePairing({
    this.pairedWines,
    this.pairingText,
    this.productMatches,
  });

  List<dynamic>? pairedWines;
  String? pairingText;
  List<dynamic>? productMatches;

  WinePairing copyWith({
    List<dynamic>? pairedWines,
    String? pairingText,
    List<dynamic>? productMatches,
  }) =>
      WinePairing(
        pairedWines: pairedWines ?? this.pairedWines,
        pairingText: pairingText ?? this.pairingText,
        productMatches: productMatches ?? this.productMatches,
      );

  factory WinePairing.fromJson(Map<String, dynamic> json) => WinePairing(
    pairedWines: List<dynamic>.from(json["pairedWines"].map((x) => x)),
    pairingText: json["pairingText"],
    productMatches:
    List<dynamic>.from(json["productMatches"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "pairedWines": List<dynamic>.from(pairedWines!.map((x) => x)),
    "pairingText": pairingText,
    "productMatches": List<dynamic>.from(productMatches!.map((x) => x)),
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
