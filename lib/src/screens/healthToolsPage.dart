import 'package:flutter/material.dart';
import 'package:nirogi/src/screens/calculateBMI.dart';
import 'package:nirogi/src/screens/incompatibleFoodsPage.dart';
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
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      child: Toolcard(
                        elevations: elevations,
                        image: 'assets/images/icons/bmi.png',
                        title: 'BMI Calculator',
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      child: Toolcard(
                        elevations: elevations,
                        image: 'assets/images/icons/incompatible.png',
                        title: 'Incompatible Foods',
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
          ],
        ),
      ),
    );
  }
}

class Toolcard extends StatelessWidget {
  const Toolcard({
    Key key,
    @required this.elevations, this.image, this.title,
  }) : super(key: key);

  final double elevations;
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevations,
      color: Colors.white70,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(8),
            child: Image.asset(
              image,
              height: 100,
              width: 100,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.body1.copyWith(
                    fontSize: 22,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
