import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipea_app/app/app.dart';
import 'package:recipea_app/app/widgets/meal_type_card.dart';
import 'package:recipea_app/app/widgets/recipe_feed.dart';
import 'package:recipea_app/app/widgets/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recipea',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 24,
            color: Theme.of(context).primaryColor,
            letterSpacing: 0.5,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Good Morning, \n${user.name!}',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(user.photo!))
                        ],
                      ),
                    ),
                    SearchBar(),
                    SizedBox(
                      height: 110,
                      child: MealTypeCard(),
                    ),
                  ],
                ),
              ),
            ];
          },
          // You tab view goes here
          body: Column(
            children: <Widget>[
              TabBar(
                tabs: [
                  Tab(
                      child: Text(
                    'Popular Recipes',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  )),
                  Tab(
                      child: Text(
                    'Get Inspired',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  )),
                ],
              ),
               Expanded(
                child: TabBarView(
                  children: [
                    RecipeFeed(),
                    RecipeFeed(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
