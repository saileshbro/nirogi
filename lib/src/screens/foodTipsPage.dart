import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:nirogi/src/repository/repositories.dart';
import 'package:nirogi/src/screens/screens.dart';

class FoodTipsPage extends StatelessWidget {
  final FoodTipsRepository _repository = FoodTipsRepository();

  final FoodTips foodtips = FoodTips();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Food Tips', style: Theme.of(context).textTheme.headline),
              SizedBox(
                width: 14,
              ),
              Image.asset(
                'assets/images/icons/diet.png',
                width: 30,
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 10, left: 10, bottom: 10),
                child: FutureBuilder(
                    future: _repository.getFoodTipsDiseases(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return TipsName(disease: snapshot.data[index]);
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: 15.0,
                              );
                            },
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Container(
                            width: 0.32 * MediaQuery.of(context).size.width,
                            height: 0.32 * MediaQuery.of(context).size.width,
                            child: FlareActor(
                              'assets/animations/nointernet.flr',
                              animation: 'init',
                              fit: BoxFit.cover,
                              shouldClip: false,
                            ),
                          ),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.pink,
                          ),
                        );
                      }
                    }),
              ),
            ),
          ],
        ));
  }
}

class TipsName extends StatelessWidget {
  final Disease disease;
  TipsName({
    Key key,
    @required this.disease,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return ShowFoods(
                disease: disease.disease,
                diseaseId: disease.diseaseId,
              );
            },
          ),
        );
      },
      child: Material(
        borderRadius: BorderRadius.circular(5),
        elevation: 1.0,
        child: Container(
          height: 60.0,
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(5, 0, 13, 0),
                child: CircleAvatar(
                  radius: 23,
                  child: Text(
                    disease.disease[0],
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.lightBlue[400],
                ),
              ),
              Expanded(
                child: Text(
                  disease.disease,
                  style: Theme.of(context).textTheme.body1.copyWith(
                        fontSize: 20,
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
