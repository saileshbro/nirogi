import 'package:flutter/material.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:nirogi/src/screens/eachNews.dart';

class NewsCard extends StatelessWidget {
  final NewsItem news;
  NewsCard({@required this.news}) : assert(news != null);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return EachNews(
            news: news,
          );
        }));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Material(
          borderRadius: BorderRadius.circular(7),
          elevation: 1.0,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Row(
              children: <Widget>[
                Image.network(
                  news.imageUrl,
                  width: 0.28 * MediaQuery.of(context).size.width,
                  height: 0.1 * MediaQuery.of(context).size.height,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            news.title,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            maxLines: 3,
                            style: Theme.of(context).textTheme.body1.copyWith(
                                  fontSize: 16,
                                  color: Colors.red[700],
                                ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            news.description,
                            maxLines: 3,
                            style: Theme.of(context).textTheme.body2.copyWith(
                                  fontSize: 14,
                                ),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  Text(
                                    news.writtenBy.split(',')[0],
                                    style: Theme.of(context)
                                        .textTheme
                                        .body2
                                        .copyWith(fontSize: 13),
                                  ),
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
                                  Text(
                                    news.updatedAt,
                                    style: Theme.of(context)
                                        .textTheme
                                        .body2
                                        .copyWith(fontSize: 13),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
