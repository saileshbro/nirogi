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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.only(bottom: 15),
            crossAxisSpacing: 10.0,
            crossAxisCount: 2,
            mainAxisSpacing: 0.8,
            children: <Widget>[
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
              IncompatibleFoods(),
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
              ToolCard(
                imageUrl: "assets/images/icons/water.png",
                name: "Daily Water Requirement",
                onTapWidget: DailyWater(),
              ),
            ],
          ),
        ),
        behavior: RemoveEndOfListIndicator(),
      ),
    );
  }
}

class IncompatibleFoods extends StatelessWidget {
  const IncompatibleFoods({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 180,
            child: InkWell(
              child: Card(
                elevation: 5,
                color: Colors.white70,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Image.asset(
                                'assets/images/icons/breakfast.png',
                                width: 90,
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Image.asset(
                                  'assets/images/icons/close.png',
                                  width: 30,
                                  color: Colors.red[700],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Text(
                      "Incompatible Foods",
                      style: Theme.of(context).textTheme.body1.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return IncompatibleFoodsMenuPage();
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
