import 'package:flutter/material.dart';
import 'package:nirogi/src/themes/clippers.dart';
import 'package:nirogi/src/themes/scrollOverlay.dart';
import 'package:nirogi/src/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
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
                    Padding(
                      padding: const EdgeInsets.only(top: 90.0),
                      child: Column(
                        children: <Widget>[
                          _TopPart(),
                          SizedBox(
                            height: 55,
                          ),
                          LoginForm(),
                          SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "create a new account",
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
                              print('hello');
                            },
                          ),
                        ],
                      ),
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
            width: 120,
            child: Image.asset(
              'assets/images/logos/yoga.png',
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 10,
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
              width: 70,
            ),
            bottom: 215,
            left: 4,
          ),
          Positioned(
            child: Image.asset(
              'assets/images/icons/medicine.png',
              width: 70,
            ),
            top: 290,
            right: 4,
          ),
          Positioned(
            child: Image.asset(
              'assets/images/icons/yoga.png',
              width: 150,
            ),
            top: 400,
            right: (MediaQuery.of(context).size.width / 2) - 75,
          ),
        ],
      ),
    );
  }
}
