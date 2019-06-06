import 'package:flutter/material.dart';
import 'package:nirogi/src/models/diseases.dart';
import 'package:nirogi/src/widgets/diseases_block.dart';
import 'package:nirogi/src/widgets/drawer.dart';
import 'package:nirogi/src/widgets/search_box.dart';

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SearchBox(),
            _BuildDiseaseList(),
          ],
        ));
  }
}

class _BuildDiseaseList extends StatelessWidget {
  const _BuildDiseaseList({
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
      ),
    );
  }
}
