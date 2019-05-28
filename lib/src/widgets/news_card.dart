import 'package:flutter/material.dart';
import 'package:nirogi/src/models/news.dart';

class NewsCard extends StatelessWidget {
  final News news;
  NewsCard({@required this.news}) : assert(news != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Material(
        elevation: 1.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Row(
            children: <Widget>[
              Image.network(
                news.imgUrl,
                width: 140,
                height: 90,
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      news.title,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      news.body,
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Image.asset(
                              'assets/images/icons/pen.png',
                              width: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(news.source),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Image.asset(
                              'assets/images/icons/calender.png',
                              width: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(news.date),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
