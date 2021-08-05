import 'package:flutter/material.dart';
import 'package:recipea_app/app/ui/recipe_manager/widgets/saved_item_list.dart';

class SavedItemScreen extends StatefulWidget {
  const SavedItemScreen({Key? key}) : super(key: key);

  @override
  _SavedItemScreenState createState() => _SavedItemScreenState();
}

class _SavedItemScreenState extends State<SavedItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('Saved Recipes'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: SavedItemListPage(),
        ),
      ),
    );
  }
}
