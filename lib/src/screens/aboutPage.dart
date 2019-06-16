import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:nirogi/src/widgets/about_card.dart';
import 'package:nirogi/src/widgets/drawer.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          _TopPart(),
          SizedBox(
            height: 0.01 * MediaQuery.of(context).size.height,
          ),
          AboutPageCard(),
        ],
      ),
    );
  }
}

class _TopPart extends StatelessWidget {
  const _TopPart({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            width: 0.2 * MediaQuery.of(context).size.width,
            height: 0.2 * MediaQuery.of(context).size.width,
            child: FlareActor(
              'assets/animations/yoga.flr',
              animation: 'relaxing',
              color: Colors.red[700],
              fit: BoxFit.cover,
              shouldClip: false,
            ),
          ),
        ],
      ),
    );
  }
}
