import 'package:flutter/material.dart';
import 'package:recipea/app/app.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with AppNavigationStateMixin {
  @override
  void onPageVisible() {
    AppNavigation.of(context)!.params =
        AppBarParams(title: const Text('Search'), backgroundColor: Colors.blue);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
