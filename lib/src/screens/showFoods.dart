import 'package:flutter/material.dart';
import 'package:nirogi/src/models/foodtips.dart';

class ShowFoods extends StatelessWidget {
  final FoodTips foodTips;
  ShowFoods({
    Key key,
    @required this.foodTips,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(foodTips.diseaseName,
                style: Theme.of(context).textTheme.headline),
            SizedBox(
              width: 35,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            TipsBox(
              foodTips: foodTips.toEat,
              heading: 'Foods To Eat: ',
              headingBackground: Colors.green[200],
              background: Colors.green[100],
              foodBackground: Colors.greenAccent,
            ),
            TipsBox(
              foodTips: foodTips.toAvoid,
              heading: 'Foods To Avoid: ',
              headingBackground: Colors.redAccent,
              background: Colors.red[100],
              foodBackground: Colors.red[200],
            ),
          ],
        ),
      ),
    );
  }
}

class TipsBox extends StatelessWidget {
  const TipsBox({
    Key key,
    @required this.foodTips,
    @required this.heading,
    this.headingBackground, this.background, this.foodBackground,
  }) : super(key: key);

  final List <String> foodTips;
  final String heading;
  final Color background;
  final Color headingBackground;
  final Color foodBackground;
 // final List eat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 15, 8, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: headingBackground,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      heading,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            color: background,
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: foodTips.length,
              itemBuilder: (BuildContext context, int index) {
                return Material(
                  color: foodBackground,
                  borderRadius: BorderRadius.circular(5),
                  elevation: 0.3,
                  child: Container(
                    height: 45.0,
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          foodTips[index],
                          style: TextStyle(
                            fontSize: 17.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 5.0,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
