import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipea_app/app/bloc/app_bloc.dart';
import 'package:recipea_app/app/utils/database.dart';

class CookBookList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder<QuerySnapshot>(
        stream: Database.readItems(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Nothing but the Whole by Emptiness..');
          } else if (snapshot.hasData || snapshot.data != null) {
            return ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 8.0),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var recipeInfo = snapshot.data!.docs[index].data();
                String docID = snapshot.data!.docs[index].id;
                String title = recipeInfo['title'];
                String summary = recipeInfo['summary'];
                String ingredients = recipeInfo['ingredients'];
                String instruction = recipeInfo['instructions'];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Ink(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Details(
                            currentTitle: title,
                            currentSummary: summary,
                            currentIngredient: ingredients,
                            currentInstruction: instruction,
                            documentId: docID,
                          ),
                        ),
                      ),
                      title: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        summary,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.grey,
              ),
            ),
          );
        },
      ),
    );
  }
}

class Details extends StatefulWidget {
  final String currentTitle;
  final String currentSummary;
  final String currentIngredient;
  final String currentInstruction;
  final String documentId;

  Details({
    Key? key,
    required this.currentTitle,
    required this.currentSummary,
    required this.currentIngredient,
    required this.currentInstruction,
    required this.documentId,
  });

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  RegExp re = RegExp(r'[^\.!\?]+[\.!\?]');

  List<String>? ingredients;
  List<String>? steps;

  @override
  void initState() {
    ingredients = _iterateSentence(widget.currentIngredient);
    steps = _iterateSentence(widget.currentInstruction);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
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
                                widget.currentTitle,
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
                        // Subtitle
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                'By ${user.name}',
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
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
                          widget.currentSummary,
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
                        _buildList(context, ingredients),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Steps',
                          style: GoogleFonts.roboto(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        _buildList(context, steps),
                        const SizedBox(
                          height: 30,
                        ),
                        // Steps
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

  Widget _buildList(BuildContext context, list) {
    var scrollController = ScrollController();
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.vertical,
        itemCount: list.length,
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
                list[index],
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

  List<String>? _iterateSentence(String str) {
    var steps = <String>[];

    Iterable matches = re.allMatches(str);

    for (Match m in matches) {
      var match = m.group(0);
      steps.add(match!);
    }
    return steps;
  }
}
