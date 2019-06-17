import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:nirogi/src/widgets/about_card.dart';
import 'package:nirogi/src/widgets/drawer.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff2fcfe).withOpacity(0.8),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('About Us', style: Theme.of(context).textTheme.headline),
            SizedBox(
              width: 14,
            ),
            Image.asset(
              'assets/images/icons/about.png',
              width: 30,
            ),
          ],
        ),
      ),
      drawer: AppDrawer(),
      body: Stack(
        children: <Widget>[
          _LinearGradient(),
          AboutPageCard(),
        ],
      ),
    );
  }
}

class _LinearGradient extends StatelessWidget {
  const _LinearGradient({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.35,
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
          height: MediaQuery.of(context).size.height * 0.53,
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
    );
  }
}
