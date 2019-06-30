import 'package:flutter/material.dart';
import 'package:nirogi/src/screens/calculateBMI.dart';
import 'package:nirogi/src/screens/incompatibleFoodsPage.dart';
import 'package:nirogi/src/screens/showDrugs.dart';
import 'package:nirogi/src/themes/scrollOverlay.dart';
import 'package:nirogi/src/widgets/drawer.dart';
import 'package:nirogi/src/widgets/tool_card.dart';
import 'calculateBMI.dart';
import 'foodTipsPage.dart';

class HealthToolsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Health Tools and Tips',
              style: Theme.of(context).textTheme.headline,
            ),
            SizedBox(
              width: 14,
            ),
            Image.asset(
              'assets/images/icons/tools.png',
              width: 30,
            ),
          ],
        ),
      ),
      body: ScrollConfiguration(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              ToolCard(
                imageUrl: "assets/images/icons/bmi.png",
                name: "BMI Calculator",
                onTapWidget: CalculateBMI(),
              ),
              ToolCard(
                imageUrl: "assets/images/icons/diet.png",
                name: "Food Tips",
                onTapWidget: FoodTipsPage(),
              ),
              ToolCard(
                imageUrl: "assets/images/icons/medicine.png",
                name: "Information on Common Drugs",
                onTapWidget: ShowDrugs(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        child: Card(
                          elevation: 5,
                          color: Colors.white70,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 25),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/images/icons/fish.png',
                                      width: 70,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Image.asset(
                                      'assets/images/icons/plus.png',
                                      width: 30,
                                      color: Colors.red[700],
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Image.asset('assets/images/icons/milk.png',
                                        width: 70),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Image.asset(
                                      'assets/images/icons/equal.png',
                                      width: 30,
                                      color: Colors.red[700],
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Image.asset('assets/images/icons/vomit.png',
                                        width: 70)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 5, top: 8, bottom: 8),
                                child: Text(
                                  "Incompatible Foods",
                                  style: Theme.of(context)
                                      .textTheme
                                      .body1
                                      .copyWith(
                                        fontSize: 22,
                                      ),
                                ),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return IncompatibleFoodsPage();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        behavior: RemoveEndOfListIndicator(),
      ),
    );
  }
}
