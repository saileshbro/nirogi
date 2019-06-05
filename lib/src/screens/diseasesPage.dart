import 'package:flutter/material.dart';
import 'package:nirogi/src/models/diseases.dart';
import 'package:nirogi/src/themes/scrollOverlay.dart';
import 'package:nirogi/src/widgets/diseases_block.dart';
import 'package:nirogi/src/widgets/drawer.dart';

class DiseasesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Diseases', style: Theme.of(context).textTheme.headline),
              SizedBox(
                width: 14,
              ),
              Image.asset(
                'assets/images/icons/disease.png',
                width: 30,
              ),
            ],
          ),
        ),
        body: ScrollConfiguration(
          behavior: RemoveEndOfListIndicator(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17, vertical: 20),
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    child: TextField(
                      style: Theme.of(context).textTheme.body1.copyWith(
                            fontSize: 20,
                          ),
                      controller: TextEditingController(),
                      cursorColor: Colors.red[700],
                      decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 14.0),
                          suffixIcon: Material(
                            elevation: 2.0,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            child: Icon(
                              Icons.search,
                              color: Colors.red[700],
                            ),
                          )),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10, left: 10, bottom: 10),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: allDiseases.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return DiseaseBlock(
                        disease: allDiseases[index],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 15,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
