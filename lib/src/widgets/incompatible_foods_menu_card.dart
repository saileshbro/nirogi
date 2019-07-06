import 'package:flutter/material.dart';
import 'package:nirogi/src/models/incompatiblefoods.dart';
import '../screens/incompatibleFoodsPage.dart';

class FoodMenuBox extends StatelessWidget {
  final IncompatibleFoods thefood;
  final int indexNo;
  const FoodMenuBox({
    Key key,
    @required this.thefood,
    @required this.indexNo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        color: Colors.white.withOpacity(0.7),
        elevation: 2,
        child: Column(
          children: <Widget>[
            Container(
              width: 80,
              child: Image(
                image: AssetImage('assets/images/icons/foodtips.png'),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Color(0xFFA9A9A9),
              width: 200,
              height: 1,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(
                thefood.foodName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) {
            return IncompatibleFoodsPage(
              indexer: indexNo,
            );
          }),
        );
      },
    );
  }
}
