import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nirogi/src/bloc/authentication_bloc.dart';
import 'package:nirogi/src/bloc/authentication_event.dart';
import 'package:nirogi/src/bloc/change_theme_bloc.dart';
import 'package:nirogi/src/constants/env.dart';
import 'package:nirogi/src/screens/screens.dart';
import 'package:nirogi/src/themes/scrollOverlay.dart';
import 'package:nirogi/src/themes/themes.dart';
import 'package:nirogi/main.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  void _showLogoutModal() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(5),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              'LOGOUT?',
              style: Theme.of(context)
                  .textTheme
                  .body1
                  .copyWith(fontSize: 16, color: Colors.red[700]),
              textAlign: TextAlign.center,
            ),
          ),
          content: Text(
            'Do you really want to logout?',
            style: Theme.of(context).textTheme.body2.copyWith(fontSize: 14),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            FlatButton(
              color: Colors.transparent,
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text(
                'Cancel',
                style: Theme.of(context).textTheme.body2.copyWith(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
              ),
            ),
            FlatButton(
              color: Colors.transparent,
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
                setState(() {
                  BlocProvider.of<AuthenticationBloc>(context)
                      .dispatch(LoggedOutEvent());
                });
              },
              child: Text(
                'Logout',
                style: Theme.of(context).textTheme.body2.copyWith(
                      fontSize: 16,
                      color: Colors.red[700],
                    ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ScrollConfiguration(
        behavior: RemoveEndOfListIndicator(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return ProfilePage();
                        },
                      ),
                    );
                  },
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    accountEmail: Text(
                      loggedinUser.email ?? "",
                      style: Theme.of(context).textTheme.body1,
                    ),
                    accountName: Text(loggedinUser.name ?? "",
                        style: Theme.of(context).textTheme.headline),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.red[700],
                      backgroundImage: NetworkImage(
                        "$baseUrl/${loggedinUser.imageUrl}",
                      ),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    buildListTile(
                        context, "Home", "assets/images/icons/home.png", "/"),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(
                        height: 10,
                        color: changeThemeBloc.currentState.themeData ==
                                kLightTheme
                            ? Colors.blueGrey[900].withOpacity(0.5)
                            : Colors.blueGrey[100].withOpacity(0.5),
                      ),
                    ),
                    buildListTile(context, "Diseasaes",
                        "assets/images/icons/disease.png", "/diseases"),
                    buildListTile(context, "Symptoms",
                        "assets/images/icons/symptoms.png", "/symptoms"),
                    buildListTile(context, "Health News",
                        "assets/images/icons/news.png", '/news'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(
                        height: 10,
                        color: changeThemeBloc.currentState.themeData ==
                                kLightTheme
                            ? Colors.blueGrey[900].withOpacity(0.5)
                            : Colors.blueGrey[100].withOpacity(0.5),
                      ),
                    ),
                    buildListTile(context, "Health Forum",
                        "assets/images/icons/forum.png", '/forum'),
                    buildListTile(context, "Province Health Info",
                        "assets/images/icons/nepal.png", '/province'),
                    buildListTile(context, "Health Tools and Tips",
                        "assets/images/icons/healthtool.png", '/tools'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(
                        height: 10,
                        color: changeThemeBloc.currentState.themeData ==
                                kLightTheme
                            ? Colors.blueGrey[900].withOpacity(0.5)
                            : Colors.blueGrey[100].withOpacity(0.5),
                      ),
                    ),
                    buildListTile(context, "About Us",
                        "assets/images/icons/about.png", "/about"),
                    buildListTile(context, 'Logout',
                        'assets/images/icons/logout.png', '/logout'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(
                        height: 10,
                        color: changeThemeBloc.currentState.themeData ==
                                kLightTheme
                            ? Colors.blueGrey[900].withOpacity(0.5)
                            : Colors.blueGrey[100].withOpacity(0.5),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: <Widget>[
                        Text('Theme', style: Theme.of(context).textTheme.body1),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: changeThemeBloc.onLightThemeChange,
                              child: Stack(
                                overflow: Overflow.clip,
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xff121212),
                                            blurRadius: 2.0,
                                            spreadRadius: 2.0,
                                          )
                                        ]),
                                    height: 60,
                                    width: 60,
                                  ),
                                  changeThemeBloc.currentState.themeData ==
                                          kLightTheme
                                      ? Positioned(
                                          top: 10,
                                          left: 10,
                                          right: 10,
                                          bottom: 10,
                                          child: Image.asset(
                                            'assets/images/icons/check.png',
                                            color: Color(0xff121212),
                                          ),
                                        )
                                      : SizedBox(),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            GestureDetector(
                              onTap: changeThemeBloc.onDarkThemeChange,
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xff121212),
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.white,
                                            blurRadius: 2.0,
                                            spreadRadius: 2.0,
                                          )
                                        ]),
                                    height: 60,
                                    width: 60,
                                  ),
                                  changeThemeBloc.currentState.themeData ==
                                          kDarkTheme
                                      ? Positioned(
                                          top: 10,
                                          left: 10,
                                          right: 10,
                                          bottom: 10,
                                          child: Image.asset(
                                            'assets/images/icons/check.png',
                                            color: Colors.white,
                                          ),
                                        )
                                      : SizedBox(),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildListTile(
      BuildContext context, String name, String imgUrl, String route) {
    if (route != '/logout') {
      return Container(
        color: ModalRoute.of(context).settings.name == route
            ? changeThemeBloc.currentState.themeData.highlightColor
            : Colors.transparent,
        child: ListTile(
          onTap: ModalRoute.of(context).settings.name != route
              ? () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                  Navigator.pushNamed(context, route);
                }
              : null,
          contentPadding: EdgeInsets.only(left: 30),
          leading: Image.asset(
            imgUrl,
            width: 35,
          ),
          title: Text(
            name,
            style: Theme.of(context).textTheme.body2.copyWith(fontSize: 16),
          ),
        ),
      );
    } else if (route == '/logout') {
      return Container(
        color: ModalRoute.of(context).settings.name == route
            ? changeThemeBloc.currentState.themeData.highlightColor
            : Colors.transparent,
        child: ListTile(
          onTap: _showLogoutModal,
          contentPadding: EdgeInsets.only(left: 30),
          leading: Image.asset(
            imgUrl,
            width: 35,
          ),
          title: Text(
            name,
            style: Theme.of(context).textTheme.body2.copyWith(fontSize: 16),
          ),
        ),
      );
    } else
      return Container();
  }
}
