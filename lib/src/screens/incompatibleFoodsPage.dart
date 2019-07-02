import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:nirogi/src/themes/scrollOverlay.dart';

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
                width: 14,
              ),
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Swiper(
                    viewportFraction: 0.85,
                    scale: 0.5,
                    itemBuilder: (BuildContext context, int index) {
                      return FoodBox(
                        thefood: foodData[index],
                      );
                    },
                    itemCount: foodData.length,
                    control: SwiperControl(color: Colors.pinkAccent[100]),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ));
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
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(100),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(4)),
      child: Card(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Don\'t Eat:',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        thefood.foodName,
                        style: TextStyle(
                          fontSize: 40,
                          fontFamily: 'Karla',
                        ),
                      ),
                      Expanded(
                          child:
                              Image.asset('assets/images/icons/foodtips.png'))
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'With:',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                TheList(thefood: thefood),
              ],
            ),
          ),
          color: Theme.of(context).canvasColor,
        ),
      ),
    );
  }
}

class TheList extends StatelessWidget {
  const TheList({
    Key key,
    @required this.thefood,
  }) : super(key: key);

  final IncompatibleFoods thefood;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              child: Center(
                child: ScrollConfiguration(
                  behavior: RemoveEndOfListIndicator(),
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
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
                ),
              ),
            ),
          ),
        ],
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
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
