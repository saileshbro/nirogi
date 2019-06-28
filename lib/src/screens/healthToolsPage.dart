import 'package:flutter/material.dart';
import 'package:nirogi/src/screens/showDrugs.dart';
import 'package:nirogi/src/widgets/tool_card.dart';
import 'package:nirogi/src/widgets/drawer.dart';

import 'calculateBMI.dart';

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
              'Health Tools',
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
      body: Column(
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
            imageUrl: "assets/images/icons/medicine.png",
            name: "Drugs Information",
            onTapWidget: ShowDrugs(),
          ),
        ],
      ),
    );
  }
}
