import 'package:flutter/material.dart';
import 'package:recipea_app/app/ui/recipe_manager/view/recipe_details_page.dart';
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
  bool _isLoading = true;

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
                            //ToDo
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

  // _showBottomSheet(BuildContext context) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (context) {
  //         return Container(
  //           height: MediaQuery.of(context).size.height / 2,
  //           child: GridView.builder(
  //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //                 crossAxisCount: 3, mainAxisSpacing: 0, crossAxisSpacing: 0, childAspectRatio: 5/3),
  //             shrinkWrap: true,
  //             scrollDirection: Axis.vertical,
  //             padding: EdgeInsets.zero,
  //             itemCount: mealTypes.length,
  //             itemBuilder: (context, index) {
  //               return GestureDetector(
  //                 onTap: () {
  //                   setState(() {
  //                     widget.mealType = mealTypes[index];
  //                     _focusNode.unfocus();
  //                     getRecipes(
  //                         widget.count,
  //                         widget.query,
  //                         widget.cuisine,
  //                         widget.diet,
  //                         widget.intolerances,
  //                         widget.mealType);
  //                   });
  //                 },
  //                 child: Container(
  //                   margin: EdgeInsets.zero,
  //                   child: Text(mealTypes[index]),
  //                 ),
  //               );
  //             },
  //           ),
  //         );
  //       });
  // }

  _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      context: context,
      builder: (context) {
        return Container(
          height: 350.0,
          color: Colors.transparent,
          child: ListView(
            children: [
              Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _titleContainer("Meal Type"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Wrap(
                          spacing: 5.0,
                          runSpacing: 5.0,
                          children: <Widget>[
                            FilterChipWidget(chipName: 'Appetizer'),
                            FilterChipWidget(chipName: 'Beverage'),
                            FilterChipWidget(chipName: 'Bread'),
                            FilterChipWidget(chipName: 'Breakfast'),
                            FilterChipWidget(chipName: 'Dessert'),
                            FilterChipWidget(chipName: 'Drink'),
                            FilterChipWidget(chipName: 'Finger food'),
                            FilterChipWidget(chipName: 'Main course'),
                            FilterChipWidget(chipName: 'Marinade'),
                            FilterChipWidget(chipName: 'Salad'),
                            FilterChipWidget(chipName: 'Sauce'),
                            FilterChipWidget(chipName: 'Side dish'),
                            FilterChipWidget(chipName: 'Snack'),
                            FilterChipWidget(chipName: 'Soup'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Divider(
                      color: Colors.grey,
                      height: 10.0,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _titleContainer('Intolerances'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Wrap(
                          spacing: 5.0,
                          runSpacing: 5.0,
                          children: <Widget>[
                            FilterChipWidget(chipName: 'Dairy'),
                            FilterChipWidget(chipName: 'Egg'),
                            FilterChipWidget(chipName: 'Gluten'),
                            FilterChipWidget(chipName: 'Grain'),
                            FilterChipWidget(chipName: 'Peanut'),
                            FilterChipWidget(chipName: 'Seafood'),
                            FilterChipWidget(chipName: 'Sesame'),
                            FilterChipWidget(chipName: 'Shellfish'),
                            FilterChipWidget(chipName: 'Soy'),
                            FilterChipWidget(chipName: 'Sulfite'),
                            FilterChipWidget(chipName: 'Tree Nut'),
                            FilterChipWidget(chipName: 'Wheat'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Divider(
                      color: Colors.grey,
                      height: 10.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _titleContainer(String myTitle) {
    return Text(
      myTitle,
      style: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5),
    );
  }
}

class FilterChipWidget extends StatefulWidget {
  final String chipName;

  FilterChipWidget({Key? key, required this.chipName}) : super(key: key);

  @override
  _FilterChipWidgetState createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
  var _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return buildFilterChip(context);
  }

  FilterChip buildFilterChip(BuildContext context) {
    return FilterChip(
    label: Text(widget.chipName),
    labelStyle: TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 14.0,
        fontWeight: FontWeight.w500),
    selected: _isSelected,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    onSelected: (isSelected) {
      setState(() {
        _isSelected = isSelected;
      });
    },
    selectedColor: Color(0xfffddfed),
  );
  }
}
