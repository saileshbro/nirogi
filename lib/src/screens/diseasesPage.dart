import 'package:flutter/material.dart';
import 'package:nirogi/src/models/diseases.dart';
import 'package:nirogi/src/widgets/diseases_block.dart';
import 'package:nirogi/src/widgets/drawer.dart';
import 'package:nirogi/src/widgets/search_box.dart';

class DiseasesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Diseases', style: Theme.of(context).textTheme.headline),
              SizedBox(
                width: 0.03 * width,
              ),
              Image.asset(
                'assets/images/icons/disease.png',
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            right: 0.02 * width, left: 0.02 * width, bottom: 0.01 * height),
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
              height: 0.02 * height,
            );
          },
        ),
      ),
    );
  }
}
