import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:nirogi/src/repository/repositories.dart';
import 'package:nirogi/src/widgets/widgets.dart';

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
            BuildDiseaseList(),
          ],
        ));
  }
}

class BuildDiseaseList extends StatefulWidget {
  const BuildDiseaseList({
    Key key,
  }) : super(key: key);

  @override
  _BuildDiseaseListState createState() => _BuildDiseaseListState();
}

class _BuildDiseaseListState extends State<BuildDiseaseList> {
  Future<List<Disease>> allDiseases;
  @override
  void initState() {
    allDiseases = diseaseRepository.getAllDiseases();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: allDiseases,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  right: 0.02 * width,
                  left: 0.02 * width,
                  bottom: 0.01 * height),
              child: ListView.separated(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return DiseaseBlock(
                    disease: snapshot.data[index],
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
        } else if (snapshot.hasError) {
          return Expanded(
            child: Center(
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
            ),
          );
        } else {
          return Expanded(
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.pink,
              ),
            ),
          );
        }
      },
    );
  }
}
