import 'package:flutter/material.dart';
import 'package:recipea_app/app/widgets/recipe_card.dart';
import 'package:recipea_app/models/models.dart';
import 'package:recipea_app/services/spooncular_api.dart';

class SearchPage extends StatefulWidget {
  const SearchPage(
      {Key? key,
      this.query,
      this.cuisine,
      this.diet,
      this.intolerances,
      this.mealType,
      required this.count})
      : super(key: key);

  final String? query;
  final String? cuisine;
  final String? diet;
  final String? intolerances;
  final String? mealType;
  final int? count;

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchQueryController = TextEditingController();
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _isSearching ? const BackButton() : Container(),
        title: _buildSearchField(),
        actions: _buildActions(),
      ),
      body: Center(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator(color: Colors.grey))
            : ListView.builder(
                itemCount: _recipeList.result!.length,
                itemBuilder: (context, index) {
                  return CustomCard(
                    id: _recipeList.result![index].id!,
                    cookTime:
                        _recipeList.result![index].readyInMinutes!.toString(),
                    rating: _recipeList.result![index].spoonacularScore!,
                    title: _recipeList.result![index].title!,
                    thumbnailUrl: _recipeList.result![index].image!,
                  );
                },
              ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchQueryController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Search Data...",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white30),
      ),
      style: TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: (query) => updateSearchQuery(query),
    );
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (_searchQueryController == null ||
                _searchQueryController.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            _clearSearchQuery();
          },
        ),
      ];
    }

    return <Widget>[
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: _startSearch,
      ),
    ];
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery;
    });
  }

  void _stopSearching() {
    _clearSearchQuery();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    setState(() {
      _searchQueryController.clear();
      updateSearchQuery("");
    });
  }
}
