import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:recipea/models/models.dart';

import '../app/utilities/keys/spooncular_api.dart';

class APIService {
  APIService._instantiate();

  static final APIService instance = APIService._instantiate();

  final String _baseUrl = 'api.spoonacular.com';

  // Generate Meal Plan
  Future<MealPlan> generateMealPlan({int? targetCalories, String? diet}) async {
    if (diet == 'None') diet = '';
    Map<String, String?> parameters = {
      'timeFrame': 'day',
      'targetCalories': targetCalories.toString(),
      'diet': diet,
      'apiKey': apiKey3,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/recipes/mealplans/generate',
      parameters,
    );
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    try {
      var response = await http.get(uri, headers: headers);
      Map<String, dynamic> data = json.decode(response.body);
      MealPlan mealPlan = MealPlan.fromJson(data);
      return mealPlan;
    } catch (err) {
      throw err.toString();
    }
  }

  // Recipe Info
  Future<Recipe> fetchRecipe(String id) async {
    Map<String, String> parameters = {
      'includeNutrition': 'true',
      'apiKey': apiKey3,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/recipes/$id/information',
      parameters,
    );
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    try {
      var response = await http.get(uri, headers: headers);
      Map<String, dynamic> data = json.decode(response.body);
      Recipe recipe = Recipe.fromJson(data);
      return recipe;
    } catch (err) {
      throw err.toString();
    }
  }

  // Recipe Info
  Future<RecipeSource> fetchRecipeSource(String id) async {
    Map<String, String> parameters = {
      'includeNutrition': 'false',
      'apiKey': apiKey3,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/recipes/$id/information',
      parameters,
    );
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    try {
      var response = await http.get(uri, headers: headers);
      Map<String, dynamic> data = json.decode(response.body);
      RecipeSource recipeSource = RecipeSource.fromJson(data);
      return recipeSource;
    } catch (err) {
      throw err.toString();
    }
  }

  Future<RecipeList> fetchRecipes(int count) async {
    Map<String, String> parameters = {
      'limitLicense': 'true',
      'number': count.toString(),
      'apiKey': apiKey3,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/recipes/random',
      parameters,
    );
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    try {
      var response = await http.get(uri, headers: headers);
      Map<String, dynamic> data = json.decode(response.body);
      RecipeList recipes = RecipeList.fromJson(data);
      return recipes;
    } catch (err) {
      throw err.toString();
    }
  }
}
