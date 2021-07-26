import 'package:flutter/material.dart';
import 'package:recipea/app/app.dart';
import 'package:recipea/app/user_interface/home/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AppNavigationStateMixin {
  @override
  void onPageVisible() {
    AppNavigation.of(context)!.params = AppBarParams(
      title: const Text('Home'),
      backgroundColor: Colors.blue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const CustomCard(
      title: 'My recipe',
      rating: '4.9',
      cookTime: '30 min',
      thumbnailUrl:
          'https://lh3.googleusercontent.com/ei5eF1LRFkkcekhjdR_8XgOqgdjpomf-rda_vvh7jIauCgLlEWORINSKMRR6I6iTcxxZL9riJwFqKMvK0ixS0xwnRHGMY4I5Zw=s360',
    );
  }
}
