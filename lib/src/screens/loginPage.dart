import 'package:flutter/material.dart';
import 'package:nirogi/src/themes/clippers.dart';
import 'package:nirogi/src/themes/scrollOverlay.dart';

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
                    Column(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height * 0.6,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xffF56545),
                                Color(0xffFFE190),
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
                                Color(0xffF56545),
                                Color(0xffFFE190),
                              ],
                              end: Alignment.topCenter,
                              begin: Alignment.bottomCenter,
                            ),
                          ),
                        )
                      ],
                    ),
                    ClipPath(
                      clipper: LoginPageClipper(),
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          height: 300,
                          child: Center(
                            child: Image.asset(
                                'assets/images/logos/brand-logo-dark.png'),
                          ),
                        ),
                        Stack(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(40, 20, 40, 50),
                              padding: EdgeInsets.fromLTRB(20, 30, 20, 80),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3,
                                      spreadRadius: .03,
                                      color: Colors.black.withOpacity(.3),
                                    )
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  TextField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      icon: Icon(
                                        Icons.email,
                                      ),
                                      hintText: 'Email',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  TextField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      icon: Icon(
                                        Icons.vpn_key,
                                      ),
                                      hintText: 'Password',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 25,
                              left: (MediaQuery.of(context).size.width * 0.5) -
                                  60,
                              child: RaisedButton(
                                color: Theme.of(context).buttonColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 5,
                                child: Text(
                                  'LOGIN',
                                  style: Theme.of(context).textTheme.button,
                                ),
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Create a new account",
                              style: Theme.of(context).textTheme.body1,
                            ),
                          ),
                          onTap: () {
                            print('hello');
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
