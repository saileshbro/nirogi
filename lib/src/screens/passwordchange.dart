import 'package:flutter/material.dart';
import 'package:nirogi/src/themes/scrollOverlay.dart';
import 'package:nirogi/src/widgets/widgets.dart';

class ChangePasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff2fcfe).withOpacity(0.8),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Change Password',
                style: Theme.of(context).textTheme.headline),
            SizedBox(
              width: 0.03 * width,
            ),
            Image.asset(
              'assets/images/icons/padlock.png',
              width: 0.07 * width,
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ScrollConfiguration(
        behavior: RemoveEndOfListIndicator(),
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              _LinearGradient(),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 0.05 * height,
                  ),
                  SizedBox(
                    height: 0.15 * height,
                  ),
                  PasswordChangeForm(),
                ],
              ),
            ],
          ),
        ),
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
          height: MediaQuery.of(context).size.height * 0.4,
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
          height: MediaQuery.of(context).size.height * 0.6,
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
