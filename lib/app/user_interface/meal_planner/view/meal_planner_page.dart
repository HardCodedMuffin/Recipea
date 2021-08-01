import 'package:flutter/material.dart';
import 'package:recipea/services/spooncular_api.dart';

import 'meal_list_page.dart';

class MealPlannerPage extends StatefulWidget {
  const MealPlannerPage({Key? key}) : super(key: key);

  @override
  _MealPlannerPageState createState() => _MealPlannerPageState();
}

class _MealPlannerPageState extends State<MealPlannerPage> {
  final List<String> _diets = [
    'None',
    'Gluten Free',
    'Ketogenic',
    'Lacto-Vegetarian',
    'Ovo-Vegetarian',
    'Vegan',
    'Pescetarian',
    'Paleo',
    'Primal',
    'Whole30',
  ];

  double _targetCalories = 2250;
  String? _diet = 'None';

  Future<void> _searchMealPlan() async {
    var mealPlan = await APIService.instance.generateMealPlan(
      targetCalories: _targetCalories.toInt(),
      diet: _diet,
    );
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MealListPage(mealPlan: mealPlan),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1498837167922-ddd27525d352?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            height: MediaQuery.of(context).size.height * 0.50,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Daily Meal Planner',
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
                const SizedBox(height: 20.0),
                RichText(
                  text: TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 25),
                    children: [
                      TextSpan(
                        text: _targetCalories.truncate().toString(),
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(
                        text: ' cal',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbColor: Theme.of(context).primaryColor,
                    activeTrackColor: Theme.of(context).primaryColor,
                    inactiveTrackColor: Colors.lightBlue[100],
                    trackHeight: 6.0,
                  ),
                  child: Slider(
                    min: 0.0,
                    max: 4500.0,
                    value: _targetCalories,
                    onChanged: (value) => setState(() {
                      _targetCalories = value.round().toDouble();
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: DropdownButtonFormField(
                    items: _diets.map((String priority) {
                      return DropdownMenuItem(
                        value: priority,
                        child: Text(
                          priority,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                        ),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      labelText: 'Diet',
                      labelStyle: TextStyle(fontSize: 18.0),
                    ),
                    onChanged: (dynamic value) {
                      setState(() {
                        _diet = value;
                      });
                    },
                    value: _diet,
                  ),
                ),
                const SizedBox(height: 30.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60.0,
                      vertical: 8.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    primary: Theme.of(context).primaryColor,
                  ),
                  onPressed: _searchMealPlan,
                  child: const Text(
                    'Search',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
