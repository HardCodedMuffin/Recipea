import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:recipea_app/app/ui/home/home.dart';
import 'package:recipea_app/app/ui/meal_planner/meal_planner.dart';
import 'package:recipea_app/app/ui/profile/profile.dart';
import 'package:recipea_app/app/ui/search/search.dart';
import 'package:recipea_app/app/ui/search/view/search_by_cuisine.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({
    Key? key,
    this.initialPage = 0,
  }) : super(key: key);

  static Page page() => const MaterialPage<void>(child: AppNavigation());

  final int initialPage;

  @override
  AppNavigationState createState() => AppNavigationState();

  static AppNavigationState? of(BuildContext context) {
    return context.findAncestorStateOfType<AppNavigationState>();
  }
}

class AppNavigationState extends State<AppNavigation> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final List<GlobalKey> _pageKeys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

 late PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _page = widget.initialPage;
    _pageController = PageController(initialPage: _page);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _pageKeys[0].currentState!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: <Widget>[
          HomePage(key: _pageKeys[0]),
          SearchByCuisine(key: _pageKeys[1]),
          SearchPage(key: _pageKeys[2], count: null),
          MealPlannerPage(key: _pageKeys[3]),
          ProfilePage(key: _pageKeys[4])
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _page,
        height: 60.0,
        items: const <Widget>[
          Icon(Icons.home_outlined, size: 30),
          ImageIcon(AssetImage('assets/icons/chef.png'), size: 30),
          Icon(Icons.add, size: 30),
          Icon(Icons.restaurant_menu_outlined, size: 30),
          Icon(Icons.perm_identity, size: 30),
        ],
        color: Theme.of(context).bottomAppBarColor,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: _onBottomNavItemPressed,
        letIndexChange: (index) => true,
      ),
    );
  }

  @override
  void reassemble() {
    super.reassemble();
    _onPageChanged(_page);
  }

  void _onPageChanged(int page) {
    setState(() => _page = page);
    _pageKeys[_page].currentState!;
  }

  void _onBottomNavItemPressed(int index) {
    setState(() => _page = index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.fastOutSlowIn,
    );
  }
}
