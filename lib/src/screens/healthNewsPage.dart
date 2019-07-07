import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:nirogi/src/repository/repositories.dart';
import 'package:nirogi/src/themes/scrollOverlay.dart';
import 'package:nirogi/src/widgets/widgets.dart';

class HealthNewsPage extends StatefulWidget {
  @override
  _HealthNewsPageState createState() => _HealthNewsPageState();
}

class _HealthNewsPageState extends State<HealthNewsPage> {
  Future<List<NewsItem>> allNews;
  @override
  void initState() {
    super.initState();
    allNews = newsRepository.getAllNews();
  }

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
      body: buildTopNews(context),
    );
  }

  Widget buildTopNews(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return ScrollConfiguration(
      behavior: RemoveEndOfListIndicator(),
      child: SingleChildScrollView(
        child: FutureBuilder(
          future: allNews,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Container(
                padding:
                    EdgeInsets.only(top: 0.02 * height, bottom: 0.02 * height),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return NewsCard(
                      news: snapshot.data[index],
                    );
                  },
                  itemCount: snapshot.data.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 0.03 * height,
                    );
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Container(
                  margin: EdgeInsets.fromLTRB(
                      0, MediaQuery.of(context).size.height * 0.3, 0, 0),
                  width: 0.32 * MediaQuery.of(context).size.width,
                  height: 0.32 * MediaQuery.of(context).size.width,
                  child: FlareActor(
                    'assets/animations/nointernet.flr',
                    animation: 'init',
                    fit: BoxFit.cover,
                    shouldClip: false,
                  ),
                ),
              );
            } else {
              return Container(
                margin: EdgeInsets.fromLTRB(
                    0, MediaQuery.of(context).size.height * 0.4, 0, 0),
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: CircularProgressIndicator(
                  backgroundColor: Colors.pink,
                )),
              );
            }
          },
        ),
      ),
    );
  }
}
