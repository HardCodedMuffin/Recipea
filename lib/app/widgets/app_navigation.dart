import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:recipea/home/home.dart';
import 'package:recipea/profile/profile.dart';
import 'package:recipea/search/search.dart';

class AppBarParams {
  AppBarParams({
    this.title,
    this.actions,
    this.backgroundColor,
  });

  final Widget? title;
  final List<Widget>? actions;
  final Color? backgroundColor;
}

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
  final List<GlobalKey<AppNavigationStateMixin>> _pageKeys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  PageController? _pageController;
  AppBarParams? _params;
  int? _page;

  set params(AppBarParams value) {
    setState(() => _params = value);
  }

  @override
  void initState() {
    super.initState();
    _page = widget.initialPage;
    _pageController = PageController(initialPage: _page!);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _pageKeys[0].currentState?.onPageVisible();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _params?.title,
        actions: _params?.actions,
        backgroundColor: _params?.backgroundColor,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: <Widget>[
          HomePage(key: _pageKeys[0]),
          SearchPage(key: _pageKeys[1]),
          ProfilePage(key: _pageKeys[2])
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _page!,
        height: 60.0,
        items: const <Widget>[
          Icon(Icons.home_outlined, size: 30),
          Icon(Icons.search_outlined, size: 30),
          Icon(Icons.perm_identity, size: 30),
        ],
        color: Colors.white,
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

  void _onPageChanged(int? page) {
    setState(() => _page = page);
    _pageKeys[_page!].currentState!.onPageVisible();
  }

  void _onBottomNavItemPressed(int index) {
    setState(() => _page = index);
    _pageController!.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.fastOutSlowIn,
    );
  }
}

mixin AppNavigationStateMixin<T extends StatefulWidget> on State<T> {
  void onPageVisible();
}
