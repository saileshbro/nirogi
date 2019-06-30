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
                imageUrl: "assets/images/icons/foodtips.png",
                name: "Food Tips",
                onTapWidget: FoodTipsPage(),
              ),
              ToolCard(
                imageUrl: "assets/images/icons/medicine.png",
                name: "Information on Common Drugs",
                onTapWidget: ShowDrugs(),
              ),
              ToolCard(
                imageUrl: "assets/images/icons/incompatible.png",
                name: "Incompatible Foods",
                onTapWidget: IncompatibleFoodsPage(),
              ),
            ],
          ),
        ),
        behavior: RemoveEndOfListIndicator(),
      ),
    );
  }
}
