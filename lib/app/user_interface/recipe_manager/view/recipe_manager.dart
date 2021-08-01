import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipea/models/recipe_model.dart';

class RecipeManager extends StatefulWidget {
  const RecipeManager({Key? key, required this.recipe}) : super(key: key);

  final Recipe recipe;

  @override
  _RecipeManagerState createState() => _RecipeManagerState();
}

class _RecipeManagerState extends State<RecipeManager> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
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
                              color: Colors.redAccent,
                              iconSize: 30,
                              onPressed: () {},
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                'By ${widget.recipe.sourceName!}',
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
                          height: 24,
                        ),

                        ///Container for food information
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border:
                                        Border.all(color: Colors.grey[200]!)),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'Calories',
                                      style: GoogleFonts.roboto(
                                          color: Colors.grey),
                                    ),
                                    Text(
                                      '174KCal',
                                      style: GoogleFonts.roboto(
                                          color: Colors.grey[900],
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border:
                                        Border.all(color: Colors.grey[200]!)),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'Servings',
                                      style: GoogleFonts.roboto(
                                          color: Colors.grey),
                                    ),
                                    Text(
                                      '${widget.recipe.servings!}',
                                      style: GoogleFonts.roboto(
                                          color: Colors.grey[900],
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border:
                                        Border.all(color: Colors.grey[200]!)),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'Time',
                                      style: GoogleFonts.roboto(
                                          color: Colors.grey),
                                    ),
                                    Text(
                                      '${widget.recipe.readyInMinutes!} min',
                                      style: GoogleFonts.roboto(
                                          color: Colors.grey[900],
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 24,
                        ),

                        Text(
                          'About Recipe',
                          style: GoogleFonts.roboto(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),

                        const SizedBox(
                          height: 4,
                        ),

                        Text(
                        widget.recipe.instructions!,
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w300, color: Colors.grey),
                        ),

                        const SizedBox(
                          height: 24,
                        ),

                        Text(
                          'Cooking Method',
                          style: GoogleFonts.roboto(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),

                        const SizedBox(
                          height: 4,
                        ),

                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam gravida mauris ut semper posuere. Fusce volutpat neque non elementum rutrum. Phasellus et lacus et lacus accumsan commodo ac quis felis. Proin quam lorem, pellentesque in pretium ac, convallis et massa. Donec in nisi magna. In rutrum, nibh id interdum auctor, nisl elit ultricies arcu, ut ullamcorper ipsum mauris quis eros. Aenean ex tortor, pretium eu vulputate a, consectetur vel diam. Cras nulla nisl, euismod eu purus ac, sagittis viverra elit. Duis pulvinar sem quis fermentum iaculis. Quisque pharetra turpis velit, ut hendrerit tortor finibus id. Sed eu pretium libero.Vestibulum semper justo eu purus suscipit scelerisque. Proin eget rhoncus ex. Nam eget egestas nisi. Morbi molestie imperdiet sapien, ut ornare est laoreet in. Nam fermentum venenatis lorem, et scelerisque ante fermentum eget. Vestibulum eget urna ullamcorper, consequat odio et, efficitur arcu. Ut molestie feugiat tristique. Ut lectus erat, malesuada eget elit et, laoreet commodo augue. Nullam at velit vel ipsum tristique rhoncus. Fusce euismod facilisis lorem nec consequat. Donec in turpis tellus. Nunc at massa et sapien hendrerit volutpat. Curabitur condimentum, nibh hendrerit fermentum suscipit, justo lacus pellentesque felis, vitae rhoncus mi est sit amet massa. Donec id hendrerit felis, at blandit ex. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w300, color: Colors.grey),
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
}
