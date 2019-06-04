import 'package:flutter/material.dart';
import 'package:nirogi/src/themes/clippers.dart';
import 'package:nirogi/src/themes/scrollOverlay.dart';
import 'package:nirogi/src/widgets/signup_form.dart';
import "package:flare_flutter/flare_actor.dart";

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: MediaQuery.of(context).orientation == Orientation.portrait
          ? ScrollConfiguration(
              behavior: RemoveEndOfListIndicator(),
              child: SingleChildScrollView(
                child: Stack(
                  children: <Widget>[
                    _LinearGradient(),
                    _BackgroundClipPath(),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 0.05 * MediaQuery.of(context).size.height,
                        ),
                        _TopPart(),
                        SizedBox(
                          height: 0.02 * MediaQuery.of(context).size.height,
                        ),
                        SignupForm(),
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Already have an account",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: Theme.of(context)
                                        .textTheme
                                        .body1
                                        .fontFamily,
                                    fontWeight: Theme.of(context)
                                        .textTheme
                                        .body1
                                        .fontWeight,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  size: 30,
                                  color: Colors.red[700],
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          : Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.yellow,
                  ),
                )
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
          height: MediaQuery.of(context).size.height * 0.6,
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
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffF56545).withOpacity(0.8),
                Color(0xffFFE190).withOpacity(0.8),
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
            top: 0.46 * MediaQuery.of(context).size.height,
            right: (MediaQuery.of(context).size.width / 2) -
                (0.15 * MediaQuery.of(context).size.width),
          ),
        ],
      ),
    );
  }
}
