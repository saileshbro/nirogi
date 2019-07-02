import 'package:flutter/material.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:nirogi/src/screens/screens.dart';

class DrugWidget extends StatelessWidget {
  final Drug drug;
  const DrugWidget({
    this.drug,
  });
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return EachDrug(
            eachdrug: drug,
          );
        }));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: Stack(
            children: <Widget>[
              Container(
                height: height,
                width: width,
                child: RotatedBox(
                  child: Image.network(
                    drug.imageUrl,
                    fit: BoxFit.fill,
                  ),
                  quarterTurns: 5,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: FractionalOffset.topLeft,
                        end: FractionalOffset.bottomRight,
                        colors: [
                      Color(0xff43c6ac).withOpacity(0.4),
                      Color(0xffffeeee).withOpacity(0.4),
                      Color(0xfff8ffae).withOpacity(0.4),
                      Color(0xff43c6ac).withOpacity(0.4),
                    ])),
              ),
              Container(
                height: height * 0.75,
                width: width,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  drug.brandName,
                                  style: Theme.of(context)
                                      .textTheme
                                      .body1
                                      .copyWith(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.red[700],
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  drug.genericName,
                                  style: Theme.of(context)
                                      .textTheme
                                      .body1
                                      .copyWith(
                                        fontSize: 26,
                                        fontFamily: 'Alex',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.brown[700],
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Dose :  ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .body1
                                          .copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red[700],
                                          ),
                                    ),
                                    Text(
                                      drug.dose.split(",").length > 4
                                          ? drug.dose
                                              .split(",")
                                              .sublist(1, 4)
                                              .join("\n")
                                          : drug.dose.replaceAll(",", "\n"),
                                      style: Theme.of(context)
                                          .textTheme
                                          .body1
                                          .copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 18,
                right: 10,
                left: 10,
                child: Container(
                  width: width * 0.8,
                  child: Text(
                    drug.summary,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.body2.copyWith(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.justify,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
