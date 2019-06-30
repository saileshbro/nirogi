import 'package:flutter/material.dart';
import 'package:nirogi/src/models/incompatiblefoods.dart';

class IncompatibleFoodsPage extends StatelessWidget {
  final IncompatibleFoods data = IncompatibleFoods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Incompatible Foods',
                style: Theme.of(context).textTheme.headline),
            SizedBox(
              width: 39,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Column(
            children: <Widget>[
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        'Don\'t Eat:',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Container(
                        color: Color(0xFFA9A9A9),
                        width: 1,
                        height: 25,
                      ),
                      Text(
                        'With',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      ListView.separated(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: foodData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return FoodBox(
                            thefood: foodData[index],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 15.0,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodBox extends StatelessWidget {
  final IncompatibleFoods thefood;
  const FoodBox({
    Key key,
    this.thefood,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    thefood.foodName,
                    style: TextStyle(
                      fontSize: 21,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image(
                      image: AssetImage('assets/images/icons/foodtips.png'),
                      fit: BoxFit.contain,
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Color(0xFFA9A9A9),
              width: 1,
              height: 150,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: thefood.incompatibleFoods.length,
                        itemBuilder: (BuildContext context, int index) {
                          return FoodName(
                            foods: thefood.incompatibleFoods[index],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Container(
                            color: Color(0xFFA9A9A9),
                            width: 100,
                            height: 1.50,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class FoodName extends StatelessWidget {
  final String foods;
  const FoodName({
    Key key,
    this.foods,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    //  color: Colors.red[100],
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: <Widget>[
            Text(
              foods,
              style: TextStyle(
                fontSize: 19,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
