import 'package:flutter/material.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:nirogi/src/screens/screens.dart';

class DiseaseBlock extends StatelessWidget {
  final Disease disease;
  const DiseaseBlock({
    @required this.disease,
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return EachDisease(
            disease: disease,
          );
        }));
      },
      child: Material(
        borderRadius: BorderRadius.circular(5),
        elevation: 1.0,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Row(
            children: <Widget>[
              Container(
                child: FadeInImage.assetNetwork(
                  image: disease.imageUrl,
                  placeholder: "assets/gifs/loading.gif",
                  height: 0.19 * height,
                  width: 0.34 * width,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 0.02 * width),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        disease.disease,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        maxLines: 3,
                        style: Theme.of(context).textTheme.body1.copyWith(
                              fontSize: 16,
                              color: Colors.red[700],
                            ),
                      ),
                      SizedBox(
                        height: 0.02 * height,
                      ),
                      Text(disease.description,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                          maxLines: 5,
                          style: Theme.of(context)
                              .textTheme
                              .body2
                              .copyWith(fontSize: 14)),
                    ],
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
