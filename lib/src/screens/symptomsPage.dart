import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:nirogi/src/repository/repositories.dart';
import 'package:nirogi/src/widgets/widgets.dart';

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
            _BuildSymptomList(),
          ],
        ));
  }
}

class _BuildSymptomList extends StatefulWidget {
  const _BuildSymptomList({
    Key key,
  }) : super(key: key);

  @override
  __BuildSymptomListState createState() => __BuildSymptomListState();
}

class __BuildSymptomListState extends State<_BuildSymptomList> {
  Future<List<Symptom>> allSymptoms;
  @override
  void initState() {
    super.initState();
    allSymptoms = symptomRepository.getAllSymptoms();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: allSymptoms,
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
                  return SymptomBlock(
                    symptom: snapshot.data[index],
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
