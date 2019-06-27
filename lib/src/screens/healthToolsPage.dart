import 'package:flutter/material.dart';
import 'package:nirogi/src/screens/calculateBMI.dart';
import 'package:nirogi/src/widgets/drawer.dart';

class HealthToolsPage extends StatelessWidget {
  final double elevations = 5;
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
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    child: Card(
                      elevation: elevations,
                      color: Colors.white70,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(8),
                            child: Image.asset(
                              'assets/images/icons/bmi.png',
                              height: 100,
                              width: 100,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'BMI Calculator',
                              style: Theme.of(context).textTheme.body1.copyWith(
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
                          builder: (BuildContext context){
                            return CalculateBMI();
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
