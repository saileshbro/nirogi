import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:nirogi/src/constants/env.dart';
import 'package:nirogi/src/repository/repositories.dart';
import 'package:nirogi/src/themes/scrollOverlay.dart';
import 'package:html/dom.dart' as dom;

class EachFirstAidPage extends StatefulWidget {
  final String title;
  final int firstAidId;
  EachFirstAidPage({@required this.firstAidId, @required this.title});

  @override
  _EachFirstAidPageState createState() => _EachFirstAidPageState();
}

class _EachFirstAidPageState extends State<EachFirstAidPage> {
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
      body: FutureBuilder(
        future:
            firstAidRepository.getSingleFirstAid(firstAidId: widget.firstAidId),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ScrollConfiguration(
              behavior: RemoveEndOfListIndicator(),
              child: CustomScrollView(
                controller: _customController,
                slivers: <Widget>[
                  SliverAppBar(
                    expandedHeight: 200.0,
                    floating: false,
                    pinned: true,
                    centerTitle: true,
                    title: _isCollapsed
                        ? Text(
                            widget.title,
                            style: Theme.of(context).textTheme.body1.copyWith(
                                  fontSize: 20,
                                  color: Colors.red[700],
                                  fontWeight: FontWeight.w500,
                                ),
                          )
                        : Text(
                            widget.title,
                            style: Theme.of(context).textTheme.body1.copyWith(
                                  fontSize: 20,
                                  color: Colors.transparent,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                    flexibleSpace: FlexibleSpaceBar(
                        background: FadeInImage.assetNetwork(
                      image: "$baseUrl/${snapshot.data.imageUrl}",
                      placeholder: "assets/gifs/loading.gif",
                      fit: BoxFit.cover,
                    )),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Html(
                            data: snapshot.data.body,
                            customTextStyle: (dom.Node node, style) {
                              if (node is dom.Element) {
                                switch (node.localName) {
                                  case "code":
                                    {
                                      return style.copyWith(
                                          color: Colors.red[700],
                                          fontSize: 20,
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
                                          fontSize: 16, fontFamily: 'karla');
                                    }
                                }
                              }
                            },
                          ),
                        );
                      },
                      childCount: 1,
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("error"),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.pink,
              ),
            );
          }
        },
      ),
    );
  }
}
