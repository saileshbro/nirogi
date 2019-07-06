import 'package:flutter/material.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:nirogi/src/repository/repositories.dart';

class ShowFoods extends StatelessWidget {
  final FoodTipsRepository _foodTipsRepository = FoodTipsRepository();
  final int diseaseId;
  final String disease;
  ShowFoods({Key key, @required this.diseaseId, @required this.disease})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(disease, style: Theme.of(context).textTheme.headline),
      ),
      body: FutureBuilder<FoodTips>(
        future: _foodTipsRepository.getFoodTipsForDisease(diseaseId: diseaseId),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TipsBox(
                    foods: snapshot.data.toeat,
                    heading: 'Foods To Eat: ',
                    headingColor: Colors.green[600],
                    lineColor: Colors.green,
                    backgroundColor: Colors.green[100],
                    tipIcon: Icons.check,
                  ),
                  TipsBox(
                    foods: snapshot.data.toavoid,
                    heading: 'Foods To Avoid: ',
                    headingColor: Colors.redAccent,
                    lineColor: Colors.red,
                    backgroundColor: Colors.red[100],
                    tipIcon: Icons.close,
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("error"),
            );
          } else
            return Center(
              child: CircularProgressIndicator(),
            );
        },
      ),
    );
  }
}

class TipsBox extends StatelessWidget {
  const TipsBox({
    Key key,
    @required this.foods,
    @required this.heading,
    this.headingColor,
    this.lineColor,
    this.tipIcon,
    this.backgroundColor,
  }) : super(key: key);

  final List<dynamic> foods;
  final String heading;
  final Color lineColor;
  final Color headingColor;
  final Color backgroundColor;
  final IconData tipIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 2),
            child: Text(
              heading,
              style: TextStyle(
                  fontFamily: Theme.of(context).textTheme.headline.fontFamily,
                  color: headingColor,
                  fontSize: 22),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 2.0,
                color: lineColor,
                width: 100,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
                child: Icon(
                  tipIcon,
                  color: lineColor,
                ),
              ),
              Container(
                height: 2.0,
                color: lineColor,
                width: 100,
              ),
            ],
          ),
          SizedBox(
            height: 3.0,
          ),
          Container(
            height: 200,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: foods.length,
              itemBuilder: (BuildContext context, int index) {
                return FoodCard(
                  foods: foods[index].name,
                  backgroundColor: backgroundColor,
                  imageUrl: foods[index].imageUrl,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 13.0,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  const FoodCard({
    Key key,
    @required this.foods,
    @required this.imageUrl,
    this.backgroundColor,
  }) : super(key: key);

  final String foods;
  final String imageUrl;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: backgroundColor,
        height: 45.0,
        child: Stack(
          overflow: Overflow.clip,
          children: <Widget>[
            Container(
              height: 260,
              width: 160,
              child: FadeInImage.assetNetwork(
                image: imageUrl,
                placeholder: "assets/gifs/ripple.gif",
                width: 30,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 0.0,
              bottom: 0.0,
              height: 290,
              width: 160,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0)
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                ),
              ),
            ),
            Positioned(
              bottom: 7,
              left: 10,
              child: Text(
                foods,
                style: TextStyle(
                    fontFamily: Theme.of(context).textTheme.headline.fontFamily,
                    color: Colors.white,
                    fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
