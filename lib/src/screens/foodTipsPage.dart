import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:nirogi/src/models/foodtips.dart';
import 'package:nirogi/src/screens/showFoods.dart';
import 'package:nirogi/src/widgets/drawer.dart';
import 'package:nirogi/src/widgets/search_box_for_foodtips.dart';

//Shows the list of diseases

class FoodTipsPage extends StatelessWidget {
  Future<List<Disease>> fetchPost() async {
    final response =
        await http.get('http://192.168.0.5:8000/api/tips/diseases');
    if (response.statusCode == 200) {
      return Diseases.fromJson(jsonDecode(response.body)).diseases;
    } else {
      throw Exception('Failed to load post');
    }
  }

  final FoodTips foodtips = FoodTips();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Food Tips', style: Theme.of(context).textTheme.headline),
              SizedBox(
                width: 14,
              ),
              Image.asset(
                'assets/images/icons/foodtips.png',
                width: 30,
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SearchBoxf(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 10, left: 10, bottom: 10),
                child: FutureBuilder(
                    future: fetchPost(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return TipsName(foodtips: snapshot.data[index]);
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: 15.0,
                              );
                            },
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text("Error"),
                        );
                      } else {
                        return Container();
                      }
                    }),
              ),
            ),
          ],
        ));
  }
}

class TipsName extends StatelessWidget {
  Disease foodtips;
  TipsName({
    Key key,
    @required this.foodtips,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (BuildContext context) {
        //       return ShowFoods(
        //         foodTips: foodtips,
        //       );
        //     },
        //   ),
        // );
      },
      child: Material(
        borderRadius: BorderRadius.circular(5),
        elevation: 1.0,
        child: Container(
          height: 60.0,
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(5, 0, 13, 0),
                child: CircleAvatar(
                  radius: 23,
                  child: Text(
                    foodtips.disease[0],
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.lightBlue[400],
                ),
              ),
              Expanded(
                child: Text(
                  foodtips.disease,
                  style: Theme.of(context).textTheme.body1.copyWith(
                        fontSize: 20,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Diseases {
  List<Disease> diseases;

  Diseases({this.diseases});

  Diseases.fromJson(Map<String, dynamic> json) {
    if (json['diseases'] != null) {
      diseases = new List<Disease>();
      json['diseases'].forEach((v) {
        diseases.add(new Disease.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.diseases != null) {
      data['diseases'] = this.diseases.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Disease {
  int diseaseId;
  String disease;
  String imageUrl;

  Disease({this.diseaseId, this.disease, this.imageUrl});

  Disease.fromJson(Map<String, dynamic> json) {
    diseaseId = json['disease_id'];
    disease = json['disease'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['disease_id'] = this.diseaseId;
    data['disease'] = this.disease;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
