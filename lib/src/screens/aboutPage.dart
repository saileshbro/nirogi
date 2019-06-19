import 'package:flutter/material.dart';
import 'package:nirogi/src/widgets/about_card.dart';
import 'package:nirogi/src/widgets/drawer.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        _LinearGradient(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: Theme.of(context).appBarTheme.elevation,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('About Us',
                    style: Theme.of(context)
                        .textTheme
                        .headline
                        .copyWith(color: Colors.black)),
                SizedBox(
                  width: 0.035 * width,
                ),
                Image.asset(
                  'assets/images/icons/about.png',
                  width: 0.07 * width,
                ),
              ],
            ),
          ),
          drawer: AppDrawer(),
          body: Container(
            child: AboutPageCard(),
          ),
        ),
      ],
    );
  }
}

class _LinearGradient extends StatelessWidget {
  const _LinearGradient({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xfff2fcfe).withOpacity(0.8),
                  Color(0xff1c92d2).withOpacity(0.8),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xfff2fcfe).withOpacity(0.8),
                  Color(0xff1c92d2).withOpacity(0.8),
                ],
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
              ),
            ),
          )
        ],
      ),
    );
  }
}
