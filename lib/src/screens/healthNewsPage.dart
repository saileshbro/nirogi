import 'package:flutter/material.dart';
import 'package:nirogi/src/models/news.dart';
import 'package:nirogi/src/themes/scrollOverlay.dart';
import 'package:nirogi/src/widgets/drawer.dart';
import 'package:nirogi/src/widgets/news_card.dart';

class HealthNewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Health News', style: Theme.of(context).textTheme.headline),
            SizedBox(
              width: 0.03 * width,
            ),
            Image.asset(
              'assets/images/icons/news.png',
              width: 0.07 * width,
            ),
          ],
        ),
      ),
      body: ScrollConfiguration(
        behavior: RemoveEndOfListIndicator(),
        child: SingleChildScrollView(
          child: buildTopNews(context),
        ),
      ),
    );
  }
}

Widget buildTopNews(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  return Container(
    padding: EdgeInsets.only(top: 0.02 * height, bottom: 0.02 * height),
    child: ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return NewsCard(
          news: topNews[index],
        );
      },
      itemCount: topNews.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 0.03 * height,
        );
      },
    ),
  );
}
