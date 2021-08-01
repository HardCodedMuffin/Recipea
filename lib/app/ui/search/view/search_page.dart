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
  const SearchPage({
    Key? key,
    this.query,
    this.cuisine,
    this.diet,
    this.intolerances,
    this.mealType,
  }) : super(key: key);

  final String? query;
  final String? cuisine;
  final String? diet;
  final String? intolerances;
  final String? mealType;

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
  String cuisine = "&cuisine=";
  String diet = "&diet=";
  String intolerances = "&intolerances=";
  String? mealType = "";
  String? dietType = "";
  String? cuisineType = "";
  String? intoleranceType = "";

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

  Future<Search> _fetchSearch() async {
    setState(() {
      if (mealType == null && dietType == null && intoleranceType == null && cuisineType == null)
        url =
            baseUrl + _controller.text + number + numberValue.toString() + key;
      else
        url = baseUrl +
            _controller.text +
            number +
            numberValue.toString() +
            cuisine +
            cuisineType! +
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
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
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
                    _fetchSearch();
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
                    prefixIcon: IconButton(
                        icon: Icon(Icons.arrow_back_ios_outlined),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    suffixIcon: IconButton(
                        icon: Icon(Icons.tune),
                        onPressed: () {
                          _showBottomSheet(context);
                        }),
                    hintText: 'Search...',
                    hintMaxLines: 1,
                    hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(.4), fontSize: 15),
                    fillColor: Colors.white,
                    filled: true,
                    alignLabelWithHint: true,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height - 122,
            padding: EdgeInsets.only(bottom: 40),
            width: double.infinity,
            child: FutureBuilder(
              future: _fetchSearch(),
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
                                leading: Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(search.baseUri! +
                                          search.result![index].image!),
                                      repeat: ImageRepeat.repeat,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                title: Text('${search.result![index].title}',
                                    overflow: TextOverflow.ellipsis),
                                subtitle: RichText(
                                  text: TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: ImageIcon(
                                            (AssetImage(
                                                'assets/icons/serving.png')),
                                            size: 18),
                                      ),
                                      TextSpan(
                                          text:
                                              ' ${search.result![index].servings} '
                                                  .toString(),
                                          style:
                                              TextStyle(color: Colors.black)),
                                      WidgetSpan(
                                        child: Icon(Icons.schedule, size: 18),
                                      ),
                                      TextSpan(
                                          text:
                                              ' ${search.result![index].readyInMinutes}'
                                                  .toString(),
                                          style:
                                              TextStyle(color: Colors.black)),
                                      TextSpan(
                                          text: ' min',
                                          style:
                                              TextStyle(color: Colors.black)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Divider(color: Colors.grey),
                            ),
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
