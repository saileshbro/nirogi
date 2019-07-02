import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:nirogi/src/models/models.dart';

class QueryCard extends StatelessWidget {
  final Section sectionInfo;
  const QueryCard({
    @required this.sectionInfo,
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Text(
                    sectionInfo.title,
                    style: Theme.of(context).textTheme.body2.copyWith(
                          fontSize: 18,
                          color: Colors.red[700],
                        ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Html(
            data: sectionInfo.content,
            defaultTextStyle: TextStyle(
              fontSize: 14,
              color: Colors.black,
              backgroundColor: Colors.white,
              fontWeight: FontWeight.w500,
              fontFamily: 'Montserrat',
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
