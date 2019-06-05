import 'package:flutter/material.dart';

class DiseaseBlock extends StatelessWidget {
  final disease;
  const DiseaseBlock({
    @required this.disease,
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Here');
      },
      child: Container(
        // height: 150,
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                spreadRadius: .03,
                color: Colors.black.withOpacity(.3),
              ),
            ]),
        child: Row(
          children: <Widget>[
            Container(
              height: 140,
              width: 100,
              child: Image.network(
                disease.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    disease.name,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    style: Theme.of(context).textTheme.body1.copyWith(
                          fontSize: 16,
                          color: Colors.red[700],
                        ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Text(
                    disease.body,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    maxLines: 5,
                    style: Theme.of(context).textTheme.body2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
