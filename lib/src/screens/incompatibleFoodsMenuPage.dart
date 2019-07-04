import 'package:flutter/material.dart';
import 'package:nirogi/src/models/incompatiblefoods.dart';
import 'incompatibleFoodsPage.dart';

class IncompatibleFoodsMenuPage extends StatelessWidget {
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
              width: 14,
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
                        color: Colors.white70,
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Incompatible Foods to Eat With:',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
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
                            indexNo: index,
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
  final int indexNo;
  const FoodBox({
    Key key,
    this.thefood, this.indexNo,
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