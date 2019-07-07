import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:nirogi/src/repository/repositories.dart';
import 'package:nirogi/src/screens/screens.dart';

class ShowDrugs extends StatefulWidget {
  @override
  _ShowDrugsState createState() => _ShowDrugsState();
}

class _ShowDrugsState extends State<ShowDrugs> {
  bool canPop = false;
  Future<List<Drug>> allDrugs;
  @override
  void initState() {
    super.initState();
    allDrugs = drugRepository.getCommonDrug();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return SearchPage(
                  type: 'drug',
                );
              }));
            },
            icon: Icon(
              Icons.search,
              size: 30,
            ),
          )
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Common Drugs',
              style: Theme.of(context).textTheme.headline,
            ),
            SizedBox(
              width: 14,
            ),
            Image.asset(
              'assets/images/icons/medicine.png',
              width: 30,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: FutureBuilder(
          future: allDrugs,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              canPop = true;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 10, left: 10),
                      child: Container(
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return DrugCard(drug: snapshot.data[index]);
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 15.0,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Container(
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
                )),
              );
            } else {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.pink,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class DrugCard extends StatelessWidget {
  final Drug drug;
  const DrugCard({this.drug});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) {
            return EachDrug(
              eachdrug: drug,
            );
          }),
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
                    drug.brandName[0],
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
                  drug.brandName,
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
