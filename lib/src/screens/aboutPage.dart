import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:nirogi/src/themes/clippers.dart';
import 'package:nirogi/src/widgets/about_card.dart';
import 'package:nirogi/src/widgets/drawer.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffdde1).withOpacity(0.8),
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
          _BackgroundClipPath(),
          _TopPart(),
          SizedBox(
            height: 0.08 * MediaQuery.of(context).size.height,
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
            width: 0.32 * MediaQuery.of(context).size.width,
            height: 0.32 * MediaQuery.of(context).size.width,
            child: FlareActor(
              'assets/animations/yoga.flr',
              animation: 'relaxing',
              color: Colors.white,
              fit: BoxFit.cover,
              shouldClip: false,
            ),
          ),
          SizedBox(
            height: 0.01 * MediaQuery.of(context).size.height,
          ),
          Text(
            'HAMI NIROGI',
            style: Theme.of(context).textTheme.headline.copyWith(
                  letterSpacing: 2,
                  fontSize: 24,
                  color: Colors.red[700],
                  fontWeight: FontWeight.w600,
                ),
          )
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
          height: MediaQuery.of(context).size.height * 0.54,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffF56545).withOpacity(0.8),
                Color(0xffFFE190).withOpacity(0.8),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.34,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffffdde1).withOpacity(0.8),
                Color(0xffFFEFBA).withOpacity(0.8),
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

class _BackgroundClipPath extends StatelessWidget {
  const _BackgroundClipPath({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: LoginPageClipper(),
      child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          ),
          Positioned(
            child: Image.asset(
              'assets/images/icons/dna.png',
              width: 0.14 * MediaQuery.of(context).size.width,
            ),
            bottom: 0.24 * MediaQuery.of(context).size.height,
            left: 4,
          ),
          Positioned(
            child: Image.asset(
              'assets/images/icons/medicine.png',
              width: 0.14 * MediaQuery.of(context).size.width,
            ),
            top: 0.33 * MediaQuery.of(context).size.height,
            right: 4,
          ),
          Positioned(
            child: Image.asset(
              'assets/images/icons/yoga.png',
              width: 0.3 * MediaQuery.of(context).size.width,
            ),
            top: 0.39 * MediaQuery.of(context).size.height,
            right: (MediaQuery.of(context).size.width / 2) -
                (0.15 * MediaQuery.of(context).size.width),
          ),
        ],
      ),
    );
  }
}
