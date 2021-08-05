import 'package:flutter/material.dart';
import 'package:recipea_app/app/ui/search/view/search_page.dart';
import 'package:recipea_app/app/utils/constant/constants.dart';

class SearchByCuisine extends StatefulWidget {
  const SearchByCuisine({Key? key}) : super(key: key);

  @override
  _SearchByCuisineState createState() => _SearchByCuisineState();
}

class _SearchByCuisineState extends State<SearchByCuisine> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cuisine',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 65.0),
            itemCount: cuisines.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildCuisineCards(
                  context, imgSrc[index], cuisines[index]);
            }),
      ),
    );
  }

  Widget _buildCuisineCards(BuildContext context, String imgSrc, String title) {
    return InkWell(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => SearchPage(
              query: null,
              cuisine: title, count: 10,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(imgSrc, fit: BoxFit.cover),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.grey.shade900.withOpacity(0.15),
                      Colors.grey.shade900,
                    ],
                  ),
                ),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
