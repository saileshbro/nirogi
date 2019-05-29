import 'package:flutter/material.dart';
import 'package:nirogi/src/bloc/change_theme_bloc.dart';
import 'package:nirogi/src/models/diseases.dart';
import 'package:nirogi/src/models/news.dart';
import 'package:nirogi/src/models/symptoms.dart';
import 'package:nirogi/src/themes/clippers.dart';
import 'package:nirogi/src/themes/scrollOverlay.dart';
import 'package:nirogi/src/themes/themes.dart';
import 'package:nirogi/src/widgets/diseases_card.dart';
import 'package:nirogi/src/widgets/drawer.dart';
import 'package:nirogi/src/widgets/news_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _customController;

  bool _isCollapsed = false;

  @override
  void initState() {
    super.initState();

    _customController = ScrollController()
      ..addListener(
        () => setState(
              () {
                _isCollapsed =
                    (_customController.offset <= kToolbarHeight) ? false : true;
              },
            ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: AppDrawer(),
      body: NestedScrollView(
        controller: _customController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 170,
              flexibleSpace: _isCollapsed ? null : heroClipPath(context),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    _isCollapsed ? 'Hami Nirogi' : '',
                    style: Theme.of(context).textTheme.headline,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Container(
                    child: _isCollapsed
                        ? Image.asset(
                            'assets/images/icons/meditation.png',
                            width: 30,
                          )
                        : null,
                  )
                ],
              ),
            ),
          ];
        },
        body: ScrollConfiguration(
          behavior: RemoveEndOfListIndicator(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                heading('Common Diseases'),
                SizedBox(
                  height: 10,
                ),
                buildCommonDiseases(),
                SizedBox(
                  height: 25,
                ),
                heading('Common Symptoms'),
                SizedBox(
                  height: 10,
                ),
                buildCommonSymptoms(),
                SizedBox(
                  height: 25,
                ),
                heading('Top News'),
                buildTopNews(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildCommonSymptoms() {
    return Container(
      height: 200,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: topDisease.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return DiseaseCard(
            disease: topSymptoms[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 15,
          );
        },
      ),
    );
  }

  Column heading(String heading) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          heading,
          style: TextStyle(
            fontSize:
                Theme.of(context).textTheme.display1.fontSize.toDouble() * 0.55,
            fontFamily: 'Montserrat',
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 3.0,
              color: Colors.red,
              width: 90,
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              height: 20,
              width: 20,
              child: Image.asset('assets/images/icons/blood-drop.png'),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              height: 3.0,
              width: 150,
              color: Colors.red,
            ),
          ],
        )
      ],
    );
  }

  Container buildCommonDiseases() {
    return Container(
      height: 200,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: topDisease.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return DiseaseCard(
            disease: topDisease[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 15,
          );
        },
      ),
    );
  }

  Stack heroClipPath(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: ClipPath(
            child: Container(
              height: 170,
              color: Colors.red[700],
            ),
            clipper: HomePageBorderClipper(),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: ClipPath(
            clipper: HomePageClipper(),
            child: Container(
              padding: EdgeInsets.fromLTRB(30, 10, 20, 35),
              width: MediaQuery.of(context).size.width,
              height: 165,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Image.asset(
                      changeThemeBloc.currentState.themeData == kDarkTheme
                          ? 'assets/images/logos/brand-logo-light.png'
                          : 'assets/images/logos/brand-logo-dark.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTopNews() {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
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
            height: 20,
          );
        },
      ),
    );
  }
}
