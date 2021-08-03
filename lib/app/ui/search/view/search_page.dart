import 'package:flutter/material.dart';
import 'package:recipea_app/app/ui/recipe_manager/view/recipe_details_page.dart';
import 'package:recipea_app/app/utils/constant/constants.dart';
import 'package:recipea_app/models/models.dart';
import 'package:recipea_app/services/spooncular_api.dart';

class SearchPage extends StatefulWidget {
  SearchPage(
      {Key? key,
      this.query,
      this.cuisine,
      this.diet,
      this.intolerances,
      this.mealType,
      required this.count})
      : super(key: key);

  late String? query;
  late String? cuisine;
  late String? diet;
  late String? intolerances;
  late String? mealType;
  final int? count;

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchQueryController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  late FocusNode _focusNode;
  String searchQuery = "Search query";
  late Search _recipeList;
  late final int _count = 10;
  bool _isLoading = true;
  bool _isSearching = false;

  Future<void> getRecipes(
      count, query, cuisine, diet, intolerances, mealType) async {
    _recipeList = await APIService.instance.fetchResult(count,
        query: query,
        cuisine: cuisine,
        diet: diet,
        intolerances: intolerances,
        mealType: mealType);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    getRecipes(widget.count, widget.query, widget.cuisine, widget.diet,
        widget.intolerances, widget.mealType);
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: [
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
                      cursorColor: Colors.black,
                      focusNode: _focusNode,
                      onChanged: (text) {
                        getRecipes(widget.count, widget.query, widget.cuisine,
                            widget.diet, widget.intolerances, widget.mealType);
                        setState(() {
                          widget.query = _searchQueryController.text;
                        });
                      },
                      controller: _searchQueryController,
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.center,
                      autocorrect: false,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        focusColor: Theme.of(context).highlightColor,
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: 'Search...',
                        hintMaxLines: 1,
                        hintStyle: TextStyle(
                            color: Colors.grey.withOpacity(.4), fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios_outlined),
                          onPressed: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            Navigator.pop(context);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.tune),
                          onPressed: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            _showBottomSheet(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height - 122,
            padding: EdgeInsets.only(bottom: 40),
            width: double.infinity,
            child: _isLoading
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.grey))
                : ListView.builder(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    controller: _scrollController,
                    physics: BouncingScrollPhysics(),
                    itemCount: _recipeList.result!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          var recipe = await APIService.instance.fetchRecipe(
                              _recipeList.result![index].id.toString());
                          var nutrients = await APIService.instance
                              .fetchNutrients(
                                  _recipeList.result![index].id.toString());
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
                                image: NetworkImage(
                                    _recipeList.result![index].image!),
                                repeat: ImageRepeat.repeat,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text('${_recipeList.result![index].title}',
                              overflow: TextOverflow.ellipsis),
                          subtitle: RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: ImageIcon(
                                      (AssetImage('assets/icons/serving.png')),
                                      size: 18),
                                ),
                                TextSpan(
                                    text:
                                        ' ${_recipeList.result![index].servings} '
                                            .toString(),
                                    style: TextStyle(color: Colors.black)),
                                WidgetSpan(
                                  child: Icon(Icons.schedule, size: 18),
                                ),
                                TextSpan(
                                    text:
                                        ' ${_recipeList.result![index].readyInMinutes}'
                                            .toString(),
                                    style: TextStyle(color: Colors.black)),
                                TextSpan(
                                    text: ' min',
                                    style: TextStyle(color: Colors.black)),
                              ],
                            ),
                          ),
                        ),
                      );
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
          return Container(
            width: 10,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: mealTypes.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.mealType = mealTypes[index];
                      _focusNode.unfocus();
                    });
                    print(widget.mealType);
                  },
                  child: Chip(
                    label: Text(mealTypes[index]),
                  ),
                );
              },
            ),
          );
        });
  }
}
