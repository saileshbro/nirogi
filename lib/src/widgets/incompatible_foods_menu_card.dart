import 'package:flutter/material.dart';
import 'package:nirogi/src/models/incompatiblefoods.dart';
import '../screens/incompatibleFoodsPage.dart';

class FoodMenuBox extends StatelessWidget {
  final IncompatibleFoods thefood;
  final int indexNo;
  const FoodMenuBox({
    Key key,
    this.thefood,
    this.indexNo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        color: Colors.white70,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage('assets/images/icons/foodtips.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                color: Color(0xFFA9A9A9),
                width: 1,
                height: 100,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 2,
                child: Text(
                  thefood.foodName,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
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
