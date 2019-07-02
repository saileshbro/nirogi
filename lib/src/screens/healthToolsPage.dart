import 'package:flutter/material.dart';
import 'package:nirogi/src/screens/screens.dart';
import 'package:nirogi/src/themes/scrollOverlay.dart';
import 'package:nirogi/src/widgets/widgets.dart';

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
              'assets/images/icons/healthtool.png',
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
                imageUrl: "assets/images/icons/diet.png",
                name: "Food Tips",
                onTapWidget: FoodTipsPage(),
              ),
              ToolCard(
                imageUrl: "assets/images/icons/medicine.png",
                name: "Information on Common Drugs",
                onTapWidget: ShowDrugs(),
              ),
              ToolCard(
                imageUrl: "assets/images/icons/firstaid.png",
                name: "First Aid",
                onTapWidget: FirstAidPage(),
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
                                    horizontal: 10, vertical: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Stack(
                                      children: <Widget>[
                                        Image.asset(
                                          'assets/images/icons/breakfast.png',
                                          width: 120,
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: Image.asset(
                                            'assets/images/icons/close.png',
                                            width: 40,
                                            color: Colors.red[700],
                                          ),
                                        ),
                                      ],
                                    )
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
              ),
              ToolCard(
                imageUrl: "assets/images/icons/bmi.png",
                name: "BMI Calculator",
                onTapWidget: CalculateBMI(),
              ),
              ToolCard(
                imageUrl: "assets/images/icons/blooddonation.png",
                name: "Blood Donation Date",
                onTapWidget: BloodDonation(),
              ),
            ],
          ),
        ),
        behavior: RemoveEndOfListIndicator(),
      ),
    );
  }
}
