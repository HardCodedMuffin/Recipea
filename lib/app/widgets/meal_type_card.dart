import 'package:flutter/material.dart';

class MealTypeCard extends StatelessWidget {
  MealTypeCard({Key? key}) : super(key: key);

  final icons = const [
    (AssetImage('assets/icons/appetizer.png')),
    (AssetImage('assets/icons/beverage.png')),
    (AssetImage('assets/icons/bread.png')),
    (AssetImage('assets/icons/breakfast.png')),
    (AssetImage('assets/icons/dessert.png')),
    (AssetImage('assets/icons/drink.png')),
    (AssetImage('assets/icons/finger_food.png')),
    (AssetImage('assets/icons/main_course.png')),
    (AssetImage('assets/icons/marinade.png')),
    (AssetImage('assets/icons/salad.png')),
    (AssetImage('assets/icons/sauce.png')),
    (AssetImage('assets/icons/side_dish.png')),
    (AssetImage('assets/icons/snack.png')),
    (AssetImage('assets/icons/soup.png')),
  ];
  final mealTypes = [
    'Appetizer',
    'Beverage',
    'Bread',
    'Breakfast',
    'Dessert',
    'Drink',
    'Finger food',
    'Main course',
    'Marinade',
    'Salad',
    'Sauce',
    'Side dish',
    'Snack',
    'Soup',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: mealTypes.length,
      itemBuilder: (context, index) {
        final itemMeal = mealTypes[index];
        final itemIcon = icons[index];
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          color: Colors.white,
          width: 100.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ImageIcon(itemIcon,
                  color: Theme.of(context).primaryColor, size: 50),
              Text(itemMeal,
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        );
      },
    );
  }
}
