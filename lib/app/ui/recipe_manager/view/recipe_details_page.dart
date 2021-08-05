import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/parser.dart';
import 'package:recipea_app/app/utils/database.dart';
import 'package:recipea_app/models/instructions_model.dart';
import 'package:recipea_app/models/nutrients_model.dart';
import 'package:recipea_app/models/recipe_model.dart';

class RecipeDetails extends StatefulWidget {
  const RecipeDetails(
      {Key? key,
      required this.recipe,
      required this.nutrients,
      this.analyzedInstructions})
      : super(key: key);

  final Recipe recipe;
  final Nutrients nutrients;
  final AnalyzedInstructions? analyzedInstructions;

  @override
  _RecipeDetailsState createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  RegExp re = RegExp(r'[^\.!\?]+[\.!\?]');
  String? parsedSummary;
  String? parsedInstructions;
  List<String>? steps;

  bool isSaved = false;

  @override
  void initState() {
    isSaved = false;
    parsedSummary = _parseHtmlString(widget.recipe.summary!);
    parsedInstructions = _parseHtmlString(widget.recipe.instructions!);
    steps = _iterateSteps(parsedInstructions!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            // Recipe Image
            Hero(
              tag: NetworkImage(widget.recipe.image!),
              child: SizedBox(
                height: size.height * 0.50,
                child: Image.network(
                  widget.recipe.image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Previous Page Button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
                decoration: const BoxDecoration(
                    color: Colors.white30, shape: BoxShape.circle),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_outlined,
                      color: Colors.black),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
            DraggableScrollableSheet(
              maxChildSize: 1,
              initialChildSize: 0.6,
              minChildSize: 0.6,
              builder: (context, controller) {
                return SingleChildScrollView(
                  controller: controller,
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Title
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                widget.recipe.title!,
                                overflow: TextOverflow.visible,
                                style: GoogleFonts.roboto(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.bookmark_add_outlined),
                              color: isSaved ? Colors.black : Colors.red,
                              onPressed: () async {
                                isSaved = !isSaved;
                                if (isSaved == true) {
                                  await Database.savedItem(
                                    id: widget.recipe.id.toString(),
                                    title: widget.recipe.title!,
                                    imageUrl: widget.recipe.image!,
                                  );
                                }
                              },
                              iconSize: 30.0,
                            ),
                          ],
                        ),
                        // Subtitle
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                'By ${widget.recipe.sourceName}',
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                'Health Score',
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Rating
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RatingBarIndicator(
                              rating: widget.recipe.spoonacularScore! / 20,
                              itemBuilder: (context, index) => const Icon(
                                Icons.favorite,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 15,
                              direction: Axis.horizontal,
                            ),
                            RatingBarIndicator(
                              rating: widget.recipe.healthScore! / 20,
                              itemBuilder: (context, index) => const Icon(
                                Icons.health_and_safety,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 15,
                              direction: Axis.horizontal,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        // Container for food information
                        Row(children: <Widget>[
                          buildTiles(
                              'Calories', '${widget.nutrients.calories}'),
                          const SizedBox(
                            width: 10,
                          ),
                          buildTiles('Servings', '${widget.recipe.servings}'),
                          const SizedBox(
                            width: 10,
                          ),
                          buildTiles(
                              'Time', '${widget.recipe.readyInMinutes} min'),
                        ]),
                        Row(children: [
                          buildTiles('Carbs', '${widget.nutrients.carbs}'),
                          const SizedBox(
                            width: 10,
                          ),
                          buildTiles('Fat', '${widget.nutrients.fat}'),
                          const SizedBox(
                            width: 10,
                          ),
                          buildTiles('Protein', '${widget.nutrients.protein}'),
                        ]),
                        const SizedBox(
                          height: 30,
                        ),
                        // About Recipe
                        Text(
                          'About Recipe',
                          style: GoogleFonts.roboto(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Summary
                        Text(
                          parsedSummary!,
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w300, color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Ingredients',
                          style: GoogleFonts.roboto(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        _ingredients(context),
                        const SizedBox(
                          height: 30,
                        ),
                        // Steps
                        Text(
                          'Steps',
                          style: GoogleFonts.roboto(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        _steps(context),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final parsedString = parse(document.body!.text).documentElement!.text;

    return parsedString;
  }

  List<String>? _iterateSteps(String str) {
    var _str = _parseHtmlString(str);
    var steps = <String>[];

    Iterable matches = re.allMatches(_str);

    for (Match m in matches) {
      var match = m.group(0);
      steps.add(match!);
    }
    return steps;
  }

  Expanded buildTiles(String title, String body) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey[200]!)),
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: <Widget>[
            Text(
              title,
              style: GoogleFonts.roboto(color: Colors.grey),
            ),
            Text(
              body,
              style: GoogleFonts.roboto(
                  color: Colors.grey[900], fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _steps(BuildContext context) {
    var scrollController = ScrollController();
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.vertical,
        itemCount: steps!.length,
        itemBuilder: (context, index) {
          return Align(
            alignment: Alignment.topLeft,
            child: ListTile(
              leading: Container(
                decoration: const BoxDecoration(
                    color: Colors.white30, shape: BoxShape.circle),
                child: Text('${index + 1}',
                    style: TextStyle(color: Theme.of(context).primaryColor)),
              ),
              title: Text(
                steps![index],
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w300, color: Colors.grey),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _ingredients(BuildContext context) {
    var scrollController = ScrollController();
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.vertical,
        itemCount: widget.recipe.extendedIngredients!.length,
        itemBuilder: (context, index) {
          return Align(
            alignment: Alignment.topLeft,
            child: ListTile(
              onTap: () {},
              leading: const Icon(Icons.circle),
              title: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text:
                            '${double.parse((widget.recipe.extendedIngredients![index].amount)!.toStringAsFixed(2))} '
                            '${widget.recipe.extendedIngredients![index].unit}',
                        style: TextStyle(
                            color: Theme.of(context).primaryColorDark,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            ' ${widget.recipe.extendedIngredients![index].name} ',
                        style: const TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w300)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
