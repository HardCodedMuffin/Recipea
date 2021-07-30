import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:recipea/app/utilities/keys/spooncular_api.dart';
import 'package:recipea/models/models.dart';

class APIService {
  APIService._instantiate();

  static final APIService instance = APIService._instantiate();

  final String _baseUrl = 'api.spoonacular.com';

  // Generate Meal Plan
  Future<MealPlan> generateMealPlan({int? targetCalories, String? diet}) async {
    if (diet == 'None') diet = '';
    var parameters = <String, String?>{
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
      var mealPlan = MealPlan.fromJson(data);
      return mealPlan;
    } catch (err) {
      rethrow;
    }
  }

  // Recipe Info
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
      var recipe = Recipe.fromJson(data);
      return recipe;
    } catch (err) {
      rethrow;
    }
  }

  // Recipe Source
  Future<RecipeSource> fetchRecipeSource(String id) async {
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
      var recipeSource = RecipeSource.fromJson(data);
      return recipeSource;
    } catch (err) {
      rethrow;
    }
  }

  Future<RecipeList> fetchRecipes(int count) async {
    var parameters = <String, String>{
      'limitLicense': 'true',
      'number': count.toString(),
      'apiKey': apiKey,
    };
    var uri = Uri.https(
      _baseUrl,
      '/recipes/random',
      parameters,
    );
    var headers = <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    try {
      var response = await http.get(uri, headers: headers);
      Map<String, dynamic> data = json.decode(response.body);
      var recipes = RecipeList.fromJson(data);
      return recipes;
    } catch (err) {
      rethrow;
    }
  }

  // Recipe Instructions
  Future<AnalyzedInstructions> fetchRecipeInstructions(String id) async {
    var parameters = <String, String>{
      'apiKey': apiKey,
    };
    var uri = Uri.https(
      _baseUrl,
      '/recipes/$id/analyzedInstructions',
      parameters,
    );
    var headers = <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    try {
      var response = await http.get(uri, headers: headers);
      Map<String, dynamic> data = json.decode(response.body);
      var instructions = AnalyzedInstructions.fromJson(data);
      return instructions;
    } catch (err) {
      rethrow;

    }

  }
}
