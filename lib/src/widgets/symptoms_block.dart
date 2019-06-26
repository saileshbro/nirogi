import 'package:flutter/material.dart';

class SymptomBlock extends StatelessWidget {
  final symptom;
  const SymptomBlock({
    @required this.symptom,
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        print('Here');
      },
      child: Material(
        borderRadius: BorderRadius.circular(5),
        elevation: 1.0,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Row(
            children: <Widget>[
              Container(
                child: Image.network(
                  symptom.imageUrl,
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
                        symptom.name,
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
                      Text(symptom.body,
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
