import 'package:flutter/material.dart';

class DiseaseCard extends StatelessWidget {
  final disease;
  const DiseaseCard({
    @required this.disease,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('here');
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          overflow: Overflow.clip,
          children: <Widget>[
            Container(
              height: 260,
              width: 160,
              child: Image.network(
                disease.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              left: 0.0,
              bottom: 0.0,
              height: 200,
              width: 180,
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
                disease.name,
                style: TextStyle(
                  fontFamily:
                      Theme.of(context).primaryTextTheme.title.fontFamily,
                  color: Colors.white,
                  fontSize: Theme.of(context).primaryTextTheme.title.fontSize,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
