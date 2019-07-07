import 'package:flutter/material.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:nirogi/src/repository/repositories.dart';
import 'package:nirogi/src/themes/scrollOverlay.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;

class EachDisease extends StatefulWidget {
  final Disease disease;
  EachDisease({@required this.disease});
  @override
  _EachDiseaseState createState() => _EachDiseaseState();
}

class _EachDiseaseState extends State<EachDisease> {
  ScrollController _customController;
  Future<Disease> disease;
  bool _isCollapsed = false;

  @override
  void initState() {
    super.initState();
    disease = diseaseRepository.getDisease(diseaseId: widget.disease.diseaseId);
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
      body: FutureBuilder<Disease>(
        future: disease,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ScrollConfiguration(
              behavior: RemoveEndOfListIndicator(),
              child: NestedScrollView(
                controller: _customController,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      expandedHeight: 200.0,
                      floating: false,
                      pinned: true,
                      centerTitle: true,
                      title: _isCollapsed
                          ? Text(
                              widget.disease.disease,
                              style: Theme.of(context).textTheme.body1.copyWith(
                                    fontSize: 20,
                                    color: Colors.red[700],
                                    fontWeight: FontWeight.w500,
                                  ),
                            )
                          : Text(
                              widget.disease.disease,
                              style: Theme.of(context).textTheme.body1.copyWith(
                                    fontSize: 20,
                                    color: Colors.transparent,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                      flexibleSpace: FlexibleSpaceBar(
                        background: FadeInImage.assetNetwork(
                          placeholder: "assets/gifs/loading.gif",
                          image: widget.disease.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ];
                },
                body: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Html(
                      data: snapshot.data.body,
                      customTextStyle: (dom.Node node, style) {
                        if (node is dom.Element) {
                          switch (node.localName) {
                            case "code":
                              {
                                return style.copyWith(
                                    color: Colors.red[700],
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Montserrat');
                              }
                              break;
                            case "b":
                              {
                                return style.copyWith(
                                    color: Colors.blue,
                                    fontFamily: 'Montserrat');
                              }
                              break;
                            default:
                              {
                                return style.copyWith(
                                    fontSize: 15, fontFamily: 'karla');
                              }
                          }
                        }
                      },
                    ),
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Container(
              child: Center(
                child: Text('error'),
              ),
            );
          } else {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
