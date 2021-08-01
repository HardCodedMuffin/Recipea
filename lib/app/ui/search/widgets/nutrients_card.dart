import 'package:flutter/material.dart';
import 'package:recipea_app/app/utils/keys/keys.dart';
import 'package:recipea_app/models/nutrients_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class NutrientsCard extends StatefulWidget {
  final image;
  final int? id;
  final String? title;
  final isFindButton = true;
  const NutrientsCard({Key? key, this.image, this.id, this.title})
      : super(key: key);

  @override
  _NutrientsCardMainState createState() => _NutrientsCardMainState();
}

class _NutrientsCardMainState extends State<NutrientsCard> {
  String? title;
  String? url;
  String baseUrl2 = "https://api.spoonacular.com/recipes/";
  String keyID2 =
      "/nutritionWidget.json?apiKey=$apiKey3";
  String? url2;

  @override
  void initState() {
    super.initState();
  }

  Future<Nutrients> _fecthSearchNutrient() async {
    http.Response response =
    await http.get(Uri.parse(baseUrl2 + widget.id.toString() + keyID2));
    print('search nutrient: ${baseUrl2 + widget.id.toString() + keyID2}');
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return Nutrients.fromJson(json);
    } else {
      throw Exception('failed to load search nutrients recipe');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Detail Recipe')),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Stack(children: <Widget>[
                Text("ID: " + widget.id.toString(),
                    style: TextStyle(color: Colors.white)),
                Positioned(
                    top: 100,
                    child: Container(
                        padding: EdgeInsets.all(10),
                        height: 70,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(widget.title.toString(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.3)),
                        )))
              ]),
              Container(
                padding: EdgeInsets.all(10),
                height: MediaQuery
                    .of(context)
                    .size
                    .height + 110,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text('Nutrient information', style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 5,
                    ),
                    _getNutrientFactWiget(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget _getNutrientFactWiget() {
    return FutureBuilder(
        future: _fecthSearchNutrient(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Container(
              height: 50,
              child: new ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _buildNutrition(
                      color: Colors.red.shade200,
                      icon: Icons.pie_chart,
                      text: 'calories\n${snapshot.data.calories.toString()}'
                  ),
                  _buildNutrition(
                      color: Colors.deepOrange.shade200,
                      icon: Icons.spa,
                      text: 'carbs\n${snapshot.data.carbs.toString()}'
                  ),
                  _buildNutrition(
                      color: Colors.green.shade200,
                      icon: Icons.trip_origin,
                      text: 'fat\n${snapshot.data.fat.toString()}'
                  ),
                  _buildNutrition(
                      color: Colors.pink.shade200,
                      icon: Icons.tonality,
                      text: 'protein\n${snapshot.data.protein.toString()}'
                  ),
                ],
              ),
            );
          }
          return Center(child: Container(
            height: 20,
            width: 20,
            child: new CircularProgressIndicator(
              strokeWidth: 1,
            ),
          ));
        });
  }

  Widget _buildNutrition({required String text, IconData? icon, Color? color}) {
    return Container(
        height: 50,
        margin: EdgeInsets.only(right: 10),
        width: 125,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
            width: 1,

          )
          , borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 5,
            ),
            Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
                child: Center(child: Icon(icon, color: Colors.white))
            ),
            SizedBox(
              width: 10,
            ),
            Text(text, style: TextStyle(fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black54)),
          ],
        )
    );
  }
}