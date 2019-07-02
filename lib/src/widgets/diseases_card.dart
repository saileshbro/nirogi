import 'package:flutter/material.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:nirogi/src/screens/screens.dart';

class DiseaseCard extends StatelessWidget {
  final Disease disease;
  const DiseaseCard({
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.white,
          child: Stack(
            overflow: Overflow.clip,
            children: <Widget>[
              Container(
                height: 0.3 * height,
                width: 0.329 * width,
                child: Image.network(
                  disease.imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 0.0,
                bottom: 0.0,
                height: 0.23 * height,
                width: 0.52 * height,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.black.withOpacity(0.5),
                      Colors.black.withOpacity(0)
                    ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                right: 10,
                child: Text(
                  disease.disease,
                  style: TextStyle(
                      fontFamily:
                          Theme.of(context).textTheme.headline.fontFamily,
                      color: Colors.white,
                      fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
