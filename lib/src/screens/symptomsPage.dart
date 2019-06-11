import 'package:flutter/material.dart';
import 'package:nirogi/src/models/symptoms.dart';
import 'package:nirogi/src/widgets/diseases_block.dart';
import 'package:nirogi/src/widgets/drawer.dart';
import 'package:nirogi/src/widgets/search_box.dart';

class SymptomsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Symptoms', style: Theme.of(context).textTheme.headline),
              SizedBox(
                width: 14,
              ),
              Image.asset(
                'assets/images/icons/symptoms.png',
                width: 30,
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SearchBox(),
            _BuildSymptomList(),
          ],
        ));
  }
}

class _BuildSymptomList extends StatelessWidget {
  const _BuildSymptomList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 10, left: 10, bottom: 10),
        child: ListView.separated(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: allSymptoms.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return DiseaseBlock(
              disease: allSymptoms[index],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 15,
            );
          },
        ),
      ),
    );
  }
}
