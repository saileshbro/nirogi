import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:nirogi/src/constants/env.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:nirogi/src/repository/repositories.dart';
import 'package:nirogi/src/screens/screens.dart';
import 'package:nirogi/src/themes/scrollOverlay.dart';

class FirstAidPage extends StatefulWidget {
  @override
  _FirstAidPageState createState() => _FirstAidPageState();
}

class _FirstAidPageState extends State<FirstAidPage> {
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
      body: FutureBuilder<List<Firstaid>>(
        future: firstAidRepository.getFirstAids(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ScrollConfiguration(
              child: CustomScrollView(
                controller: _customController,
                slivers: <Widget>[
                  SliverAppBar(
                    expandedHeight: 300.0,
                    floating: false,
                    pinned: true,
                    centerTitle: true,
                    title: _isCollapsed
                        ? Text(
                            "First Aid".toUpperCase(),
                            style: Theme.of(context).textTheme.body1.copyWith(
                                  fontSize: 20,
                                  color: Colors.red[700],
                                  fontWeight: FontWeight.w500,
                                ),
                          )
                        : Text(
                            "First Aid".toUpperCase(),
                            style: Theme.of(context).textTheme.body1.copyWith(
                                  fontSize: 20,
                                  color: Colors.transparent,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                    flexibleSpace: FlexibleSpaceBar(
                        background: Image.asset(
                      'assets/images/logos/firstaid.jpg',
                      fit: BoxFit.cover,
                    )),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(10.0),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        childAspectRatio: 0.9,
                        mainAxisSpacing: 20,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return EachFirstAidPage(
                                  firstAidId: snapshot.data[index].firstAidId,
                                  title: snapshot.data[index].title,
                                );
                              }));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black54,
                                      offset: Offset(0, 1),
                                      spreadRadius: 1,
                                      blurRadius: 3.25)
                                ],
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "$baseUrl/${snapshot.data[index].imageUrl}"),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        alignment: Alignment(0.0, 0.0),
                                        color: Colors.red,
                                        height: 40,
                                        child: Text(
                                          snapshot.data[index].title
                                              .toUpperCase(),
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline
                                              .copyWith(
                                                color: Colors.white,
                                              ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        childCount: snapshot.data.length,
                      ),
                    ),
                  )
                ],
              ),
              behavior: RemoveEndOfListIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 0.32 * MediaQuery.of(context).size.width,
                    height: 0.32 * MediaQuery.of(context).size.width,
                    child: FlareActor(
                      'assets/animations/nointernet.flr',
                      animation: 'init',
                      fit: BoxFit.cover,
                      shouldClip: false,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(snapshot.error)
                ],
              ),
            );
          } else
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.pink,
              ),
            );
        },
      ),
    );
  }
}
