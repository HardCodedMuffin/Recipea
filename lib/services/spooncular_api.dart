import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:recipea/app/utilities/keys/spooncular_api.dart';
import 'package:recipea/models/models.dart';

class APIService {
  APIService._instantiate();

  static final APIService instance = APIService._instantiate();

  final String _baseUrl = 'api.spoonacular.com';

  Future<MealPlan> generateMealPlan(
      {required int targetCalories, required String diet}) async {
    if (diet == 'None') diet = '';
    var parameters = <String, String>{
      'timeFrame': 'day',
      'targetCalories': targetCalories.toString(),
      'diet': diet,
      'apiKey': apiKey,
    };
    var uri = Uri.https(
      _baseUrl,
      '/recipes/mealplans/generate',
      parameters,
    );
    var headers = <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    try {
      var response = await http.get(uri, headers: headers);
      Map<String, dynamic> data = json.decode(response.body);
      var mealPlan = MealPlan.fromMap(data);
      return mealPlan;
    } catch (err) {
      rethrow;
    }
  }

  Future<Recipe> fetchRecipe(String id) async {
    var parameters = <String, String>{
      'includeNutrition': 'false',
      'apiKey': apiKey,
    };
    var uri = Uri.https(
      _baseUrl,
      '/recipes/$id/information',
      parameters,
    );
    var headers = <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    try {
      var response = await http.get(uri, headers: headers);
      Map<String, dynamic> data = json.decode(response.body);
      var recipe = Recipe.fromMap(data);
      return recipe;
    } catch (err) {
        rethrow;
    }
  }
}