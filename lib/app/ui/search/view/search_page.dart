import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:recipea_app/app/ui/recipe_manager/view/recipe_details_page.dart';
import 'package:recipea_app/app/utils/constant/constants.dart';
import 'package:recipea_app/models/recipe_search_model.dart';
import 'package:recipea_app/services/spooncular_api.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = TextEditingController();
  final _controllerScroll = new ScrollController();

  //url
  String query = "";
  int itemSize = 100;
  int offset = 0;

  final String baseUrl = 'https://api.spoonacular.com/recipes/search?query=';
  final String key = "&apiKey=29a5a1b2275545d7b607db2725e81016";
  String url = "";
  String number = "&number=";
  String type = "&type=";
  String? mealType = "";
  String? cuisine = "";
  String? intolerance = "";

  int numberValue = 10;

  bool isEndScroll = true;

  //is find button to change gradient color
  bool isFindButton = true;

  // count total result after change textfield
  bool isClickable = true;

  //dialog title value
  String? _dialogValue;

  //focus node to hide/show keyboard
  final focusNode = FocusNode();

  int? totalResult = 10;
  Future<Search>? futureSearch;

  @override
  void initState() {
    print('init State');
    totalResult = 10;
    focusNode.unfocus();
    super.initState();
  }

  Future<Search> _fecthSearch() async {
    setState(() {
      if (mealType == null)
        url =
            baseUrl + _controller.text + number + numberValue.toString() + key;
      else
        url = baseUrl +
            _controller.text +
            number +
            numberValue.toString() +
            type +
            mealType! +
            key;
    });

    print('url search: $url');
    print('total Search: $totalResult');
    print('clickable: $isClickable');

    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return Search.fromJson(json);
    } else {
      throw Exception('failed to load search recipe');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width - 50 - 10 - 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      border: Border.all(
                        color: Colors.grey.withOpacity(.4),
                        width: 1,
                      )),
                  child: TextField(
                      onChanged: (text) {
                        _fecthSearch();
                        setState(() {
                          query = _controller.text;
                          setState(() {
                            numberValue = 10;
                            url = baseUrl +
                                query +
                                number +
                                numberValue.toString() +
                                key;
                          });
                        });
                      },
                      controller: _controller,
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.center,
                      autocorrect: false,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                              icon: Icon(Icons.tune),
                              onPressed: () {
                                _showBottomSheet(context);
                              }),
                          // helperText: 'Search Recipe',
                          hintText: 'Search Recipe here',
                          hintMaxLines: 1,
                          hintStyle: TextStyle(
                              color: Colors.grey.withOpacity(.4),
                              fontSize: 15)))),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height - 122,
            padding: EdgeInsets.only(bottom: 40),
            width: double.infinity,
            child: FutureBuilder(
              future: _fecthSearch(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  Search search = snapshot.data;
                  totalResult = search.totalResults;

                  return ListView.builder(
                      itemCount: search.result!.length,
                      controller: _controllerScroll,
                      //ToDo put own card widget
                      itemBuilder: (context, index) {
                        return Column(
                          children: <Widget>[
                            InkWell(
                              splashColor: Colors.blue,
                              onTap: () async {
                                var recipe = await APIService.instance
                                    .fetchRecipe(
                                    search.result![index].id.toString());
                                var nutrients = await APIService.instance
                                    .fetchNutrients(
                                    search.result![index].id.toString());
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => RecipeDetails(
                                      recipe: recipe,
                                      nutrients: nutrients,
                                      // analyzedInstructions: instructions,
                                    ),
                                  ),
                                );
                              },
                              child: ListTile(
                                  //hero
                                  leading: Hero(
                                    tag: search.baseUri! +
                                        search.result![index].image!,
                                    child: Container(
                                        height: 50,
                                        width: 50,
                                        child: Image.network(search.baseUri! +
                                            search.result![index].image!)),
                                  ),
                                  subtitle: Text(
                                      'Servings: ${search.result![index].servings}    ReadyInMinutes: ${search.result![index].readyInMinutes} min'),
                                  title: Text(
                                      '-ID: ${search.result![index].id} - ${search.result![index].title} - ${search.totalResults.toString()}')),
                            ),
                            Divider(color: Colors.blue.shade400),
                          ],
                        );
                      });
                } else if (snapshot.hasError) {
                  return Center(
                      child: Text('An error ocur: ${snapshot.error}'));
                }
                return Center(child: Container());
              },
            ),
          ),
        ],
      ),
    );
  }

  _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: MediaQuery.of(context).size.height * 0.05,
            ),
            itemCount: mealTypes.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _dialogValue = mealTypes[index];
                    focusNode.unfocus();

                    //set for controller
                    mealType = _dialogValue!;
                  });
                  print(
                      'dialog value title: $_dialogValue dialog value controller text: ${_controller.text}');
                },
                child: Chip(
                  label: Text(mealTypes[index]),
                ),
              );
            },
          );
        });
    print(mealType);
  }
}
