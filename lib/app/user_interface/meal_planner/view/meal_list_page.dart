import 'package:flutter/material.dart';
import 'package:recipea/models/models.dart';
import 'package:recipea/services/spooncular_api.dart';

import 'recipe_details_page.dart';

class MealListPage extends StatefulWidget {
  const MealListPage({Key? key, this.mealPlan}) : super(key: key);
  final MealPlan? mealPlan;

  @override
  _MealListPageState createState() => _MealListPageState();
}

class _MealListPageState extends State<MealListPage> {
  Container _buildTotalNutrientsCard() {
    return Container(
      height: 140.0,
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 10.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Total Nutrients',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Calories: '
                '${widget.mealPlan!.nutrients!.calories.toString()} cal',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Protein: ${widget.mealPlan!.nutrients!.protein.toString()} g',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Fat: ${widget.mealPlan!.nutrients!.fat.toString()} g',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Carbs: '
                '${widget.mealPlan!.nutrients!.carbohydrates.toString()} g',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  GestureDetector _buildMealCard(Meal meal, int index) {
    var mealType = _mealType(index);
    return GestureDetector(
      onTap: () async {
        var recipeSource =
            await APIService.instance.fetchRecipeSource(meal.id.toString());
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => RecipePage(
              mealType: mealType,
              recipeSource: recipeSource,
            ),
          ),
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: 220.0,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 10.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: NetworkImage(
                    'https://spoonacular.com/recipeImages/${meal.id}-636x393.${meal.imageType}'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 2),
                  blurRadius: 6.0,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(60.0),
            padding: const EdgeInsets.all(10.0),
            color: Colors.white70,
            child: Column(
              children: <Widget>[
                Text(
                  mealType,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  meal.title!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _mealType(int index) {
    switch (index) {
      case 0:
        return 'Breakfast';
      case 1:
        return 'Lunch';
      case 2:
        return 'Dinner';
      default:
        return 'Breakfast';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Your Meal Plan'),
      ),
      body: ListView.builder(
        itemCount: 1 + widget.mealPlan!.meals!.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return _buildTotalNutrientsCard();
          }
          var meal = widget.mealPlan!.meals![index - 1];
          return _buildMealCard(meal, index - 1);
        },
      ),
    );
  }
}
