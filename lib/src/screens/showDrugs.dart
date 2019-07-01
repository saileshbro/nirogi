import 'package:flutter/material.dart';
import 'package:nirogi/src/models/drug.dart';
import 'package:nirogi/src/screens/eachDrug.dart';
import 'package:nirogi/src/widgets/search_box.dart';

class ShowDrugs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SearchBox(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10, left: 10, bottom: 10),
              child: Container(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: commonDrugs.drugs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return DrugCard(drug: commonDrugs.drugs[index]);
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
            return EachDrug();
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
