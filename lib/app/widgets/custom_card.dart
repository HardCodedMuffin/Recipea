import 'package:flutter/material.dart';
import 'package:recipea/app/user_interface/recipe_manager/recipe_manager.dart';
import 'package:recipea/services/spooncular_api.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.id,
    required this.title,
    required this.author,
    required this.cookTime,
    required this.rating,
    required this.thumbnailUrl,
  }) : super(key: key);

  final int id;
  final String title;
  final String author;
  final String rating;
  final String cookTime;
  final String thumbnailUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var recipe = await APIService.instance
            .fetchRecipe(
           id.toString());
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => RecipeManager(
              recipe: recipe,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              offset: const Offset(
                0.0,
                10.0,
              ),
              blurRadius: 10.0,
              spreadRadius: -6.0,
            ),
          ],
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.multiply,
            ),
            image: NetworkImage(thumbnailUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: <Widget>[
                        const SizedBox(width: 7),
                        Text(
                          author,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.bookmark),
                        color: Theme.of(context).scaffoldBackgroundColor,
                        onPressed: () {},
                        iconSize: 18.0,
                      ),
                      const SizedBox(width: 7),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: Theme.of(context).highlightColor,
                          size: 18,
                        ),
                        const SizedBox(width: 7),
                        Text(
                          rating,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.schedule,
                          color: Theme.of(context).highlightColor,
                          size: 18,
                        ),
                        const SizedBox(width: 7),
                        Text(
                          cookTime,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
