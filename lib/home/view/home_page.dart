import 'package:flutter/material.dart';
import 'package:recipea/app/app.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AppNavigationStateMixin {
  @override
  void onPageVisible() {
    AppNavigation.of(context)!.params =
        AppBarParams(title: const Text('Home'), backgroundColor: Colors.blue);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
