import 'package:flutter/material.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:nirogi/src/repository/repositories.dart';
import 'package:nirogi/src/widgets/widgets.dart';

class DiseasesPage extends StatelessWidget {
  final User loggedInUser;

  const DiseasesPage({Key key, @required this.loggedInUser}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        drawer: AppDrawer(
          loggedInuser: loggedInUser,
        ),
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
              child: Text('error'),
            ),
          );
        } else {
          return Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
