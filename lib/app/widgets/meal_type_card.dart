import 'package:flutter/material.dart';
import 'package:recipea_app/app/utils/constant/constants.dart';

class MealTypeCard extends StatelessWidget {
  MealTypeCard({Key? key}) : super(key: key);

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
