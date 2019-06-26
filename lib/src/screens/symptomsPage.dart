import 'package:flutter/material.dart';
import 'package:nirogi/src/models/symptoms.dart';
import 'package:nirogi/src/widgets/diseases_block.dart';
import 'package:nirogi/src/widgets/drawer.dart';
import 'package:nirogi/src/widgets/search_box.dart';
import 'package:nirogi/src/widgets/symptoms_block.dart';

class SymptomsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Symptoms', style: Theme.of(context).textTheme.headline),
              SizedBox(
                width: 0.03 * width,
              ),
              Image.asset(
                'assets/images/icons/symptoms.png',
                width: 0.07 * width,
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            right: 0.02 * width, left: 0.02 * width, bottom: 0.01 * height),
        child: ListView.separated(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: allSymptoms.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return SymptomBlock(
              symptom: allSymptoms[index],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 0.02 * height,
            );
          },
        ),
      ),
    );
  }
}
