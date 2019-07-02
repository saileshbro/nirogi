import 'package:flutter/material.dart';
import 'package:nirogi/src/bloc/change_theme_bloc.dart';
import 'package:nirogi/src/models/diseases.dart';
import 'package:nirogi/src/models/drug.dart';
import 'package:nirogi/src/models/news.dart';
import 'package:nirogi/src/models/symptoms.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:nirogi/src/repository/repositories.dart';
import 'package:nirogi/src/screens/eachDrug.dart';
import 'package:nirogi/src/themes/clippers.dart';
import 'package:nirogi/src/themes/scrollOverlay.dart';
import 'package:nirogi/src/themes/themes.dart';
import 'package:nirogi/src/widgets/diseases_card.dart';
import 'package:nirogi/src/widgets/drawer.dart';
import 'package:nirogi/src/widgets/news_card.dart';
import 'package:nirogi/src/widgets/symptoms_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _customController;
  Future<List<Disease>> topDiseases;
  Future<List<Symptom>> topSymptoms;
  Future<List<Drug>> commonDrug;
  Future<List<NewsItem>> topNews;
  bool _isCollapsed = false;

  @override
  void initState() {
    super.initState();
    topDiseases = diseaseRepository.getTopDiseases();
    topSymptoms = symptomRepository.getTopSymptoms();
    commonDrug = drugRepository.getCommonDrug();
    topNews = newsReposirory.getAllNews();
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: AppDrawer(),
      body: NestedScrollView(
        controller: _customController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 0.1875 * height,
              flexibleSpace: _isCollapsed ? SizedBox() : heroClipPath(context),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    _isCollapsed ? 'Hami Nirogi' : '',
                    style: Theme.of(context).textTheme.headline,
                  ),
                  SizedBox(
                    width: 0.02 * width,
                  ),
                  Container(
                    child: _isCollapsed
                        ? Image.asset(
                            'assets/images/icons/meditation.png',
                            width: 0.065 * width,
                          )
                        : SizedBox(),
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
                heading('Common Diseases', context),
                SizedBox(
                  height: 0.01 * height,
                ),
                buildCommonDiseases(context, topDiseases),
                SizedBox(
                  height: 0.02 * height,
                ),
                heading('Common Symptoms', context),
                SizedBox(
                  height: 0.01 * height,
                ),
                buildCommonSymptoms(context, topSymptoms),
                SizedBox(
                  height: 0.02 * height,
                ),
                heading('Common Drugs', context),
                SizedBox(
                  height: 0.02 * height,
                ),
                FutureBuilder(
                  future: commonDrug,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        height: 300,
                        child: new Swiper(
                          viewportFraction: 0.7,
                          scale: 0.9,
                          itemBuilder: (BuildContext context, int index) {
                            return DrugSlider(drug: snapshot.data[index]);
                          },
                          indicatorLayout: PageIndicatorLayout.COLOR,
                          autoplay: true,
                          itemCount: snapshot.data.length,
                          containerWidth: 200,
                          control: new SwiperControl(color: Colors.red[700]),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                SizedBox(
                  height: 0.03 * height,
                ),
                heading('Top News', context),
                _buildTopNews(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildCommonSymptoms(
      BuildContext context, Future<List<Symptom>> topSymptoms) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: 0.23 * height,
      padding: EdgeInsets.symmetric(horizontal: 0.01 * width),
      child: FutureBuilder(
          future: topSymptoms,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                physics: BouncingScrollPhysics(),
                itemCount: topDisease.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return SymptomCard(
                    symptom: snapshot.data[index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 0.03 * width,
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Column heading(String heading, BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
              width: 0.18 * width,
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              height: 0.02 * height,
              width: 0.04 * width,
              child: Image.asset('assets/images/icons/blood-drop.png'),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              height: 3.0,
              width: 0.26 * width,
              color: Colors.red,
            ),
          ],
        )
      ],
    );
  }

  Container buildCommonDiseases(
      BuildContext context, Future<List<Disease>> topDiseases) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: 0.23 * height,
      padding: EdgeInsets.symmetric(horizontal: 0.01 * width),
      child: FutureBuilder<List<Disease>>(
        future: topDiseases,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return DiseaseCard(
                  disease: snapshot.data[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 0.03 * width,
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Stack heroClipPath(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 0.02 * height),
          child: ClipPath(
            child: Container(
              margin: EdgeInsets.only(top: 1),
              height: 0.199 * height,
              color: Colors.red[700],
            ),
            clipper: HomePageBorderClipper(),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 0.02 * height),
          child: ClipPath(
            clipper: HomePageClipper(),
            child: Container(
              padding: EdgeInsets.fromLTRB(
                  0.06 * width, 0.01 * height, 0.04 * width, 0.04 * height),
              width: MediaQuery.of(context).size.width,
              height: 0.19 * height,
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

  Widget _buildTopNews(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return FutureBuilder(
      future: topNews,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Container(
            padding: EdgeInsets.only(bottom: 0.02 * height),
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
                  height: 0.02 * height,
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class DrugSlider extends StatelessWidget {
  final Drug drug;
  const DrugSlider({
    this.drug,
  });
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return EachDrug(
            eachdrug: drug,
          );
        }));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: Stack(
            children: <Widget>[
              Container(
                height: height,
                width: width,
                child: RotatedBox(
                  child: Image.network(
                    drug.imageUrl,
                    fit: BoxFit.fill,
                  ),
                  quarterTurns: 5,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: FractionalOffset.topLeft,
                        end: FractionalOffset.bottomRight,
                        colors: [
                      Color(0xff43c6ac).withOpacity(0.4),
                      Color(0xffffeeee).withOpacity(0.4),
                      Color(0xfff8ffae).withOpacity(0.4),
                      Color(0xff43c6ac).withOpacity(0.4),
                    ])),
              ),
              Container(
                height: height * 0.75,
                width: width,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  drug.brandName,
                                  style: Theme.of(context)
                                      .textTheme
                                      .body1
                                      .copyWith(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.red[700],
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  drug.genericName,
                                  style: Theme.of(context)
                                      .textTheme
                                      .body1
                                      .copyWith(
                                        fontSize: 26,
                                        fontFamily: 'Alex',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.brown[700],
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Dose :  ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .body1
                                            .copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red[700],
                                            ),
                                      ),
                                      TextSpan(
                                        text: drug.dose,
                                        style: Theme.of(context)
                                            .textTheme
                                            .body1
                                            .copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 18,
                right: 10,
                left: 10,
                child: Container(
                  width: width * 0.8,
                  child: Text(
                    drug.summary,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.body2.copyWith(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.justify,
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
