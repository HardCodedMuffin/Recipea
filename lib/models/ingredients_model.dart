class Ingredients{
  List<Ingredient>? ingredients;

  Ingredients({this.ingredients});

  factory Ingredients.fromJson(Map<String,dynamic> json){
    var list = json['ingredients'] as List;
    List<Ingredient> imagesList = list.map((i) => Ingredient.fromJson(i)).toList();
    return Ingredients(
        ingredients: imagesList
    );
  }
}

class Ingredient{
  final String? name;
  final String? image;
  final Amount? amount;

  Ingredient({this.name, this.image, this.amount});
  factory Ingredient.fromJson(Map<String,dynamic> json){


    return Ingredient(
      name:json['name'],
      image:json['image'],
      amount: Amount.fromJson(json['amount']),
    );
  }

}
class Amount{
  final Metric? metric;
  final US? us;

  Amount({this.metric, this.us});
  factory Amount.fromJson(Map<String,dynamic> json){
    return Amount(
        metric:Metric.fromJson(json['metric']),
        us:US.fromJson(json['us'])
    );
  }
}

class Metric{
  final double? value;
  final String? unit;

  Metric({this.value, this.unit});
  factory Metric.fromJson(Map<String,dynamic> json){
    return Metric(unit: json['unit'],value:json['value']);
  }
}
class US{
  final double? value;
  final String? unit;

  US({this.value, this.unit});
  factory US.fromJson(Map<String,dynamic> json){
    return US(unit: json['unit'],value:json['value']);
  }
}