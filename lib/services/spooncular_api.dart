import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:recipea_app/app/utils/keys/keys.dart';
import 'package:recipea_app/models/models.dart';

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
      'apiKey': apiKey,
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
      print(uri);
      return mealPlan;
    } catch (err) {
      throw err.toString();
    }
  }

  // Recipe Info
  Future<Recipe> fetchRecipe(String id) async {
    Map<String, String> parameters = {
      'includeNutrition': 'false',
      'apiKey': apiKey,
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

  // Recipe Nutrients Info
  Future<Nutrients> fetchNutrients(String id) async {
    Map<String, String> parameters = {
      'apiKey': apiKey,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/recipes/$id/nutritionWidget.json',
      parameters,
    );
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    try {
      var response = await http.get(uri, headers: headers);
      Map<String, dynamic> data = json.decode(response.body);
      Nutrients nutrients = Nutrients.fromJson(data);
      return nutrients;
    } catch (err) {
      throw err.toString();
    }
  }

  // RecipeSource Info
  Future<RecipeSource> fetchRecipeSource(String id) async {
    Map<String, String> parameters = {
      'includeNutrition': 'false',
      'apiKey': apiKey,
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

  // Get RecipeList
  Future<RecipeList> fetchRecipes(int count) async {
    Map<String, String> parameters = {
      'limitLicense': 'true',
      'number': count.toString(),
      'apiKey': apiKey,
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

  // Get Popular RecipeList
  Future<Search> fetchPopularRecipes(int count) async {
    Map<String, String> parameters = {
      'addRecipeInformation': 'true',
      'sort': 'popularity',
      'sortDirection': 'desc',
      'number': count.toString(),
      'apiKey': apiKey,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/recipes/complexSearch',
      parameters,
    );
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    try {
      var response = await http.get(uri, headers: headers);
      Map<String, dynamic> data = json.decode(response.body);
      Search popular = Search.fromJson(data);
      print(uri);
      return popular;
    } catch (err) {
      throw err.toString();
    }
  }

  // Get Search Result
  Future<Search> fetchResult(int number, {String? query, String? cuisine, String? diet, String? intolerances, String? mealType}) async {
    Map<String, String?> parameters = {
      'addRecipeInformation': 'true',
      'query': query == null ? ' ' : query,
      'cuisine': cuisine == null ? ' ' : cuisine,
      'diet': diet == null ? ' ' : diet,
      'intolerances': intolerances == null ? ' ' : intolerances,
      'type': mealType == null ? ' ' : mealType,
      'number': number.toString(),
      'apiKey': apiKey,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/recipes/complexSearch',
      parameters,
    );

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    try {
      var response = await http.get(uri, headers: headers);
      Map<String, dynamic> data = json.decode(response.body);
      Search result = Search.fromJson(data);
      print(uri);
      return result;
    } catch (err) {
      throw err.toString();
    }
  }
}

