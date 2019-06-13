import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nirogi/src/functions/functions.dart';

class PasswordChangeForm extends StatefulWidget {
  @override
  _PasswordChangeFormState createState() => _PasswordChangeFormState();
}

class _PasswordChangeFormState extends State<PasswordChangeForm> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(
              0.08 * width, .02 * height, .08 * width, .054 * height),
          padding: EdgeInsets.fromLTRB(
              .02 * width, .034 * height, .02 * width, .05 * height),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.85),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  spreadRadius: .03,
                  color: Colors.black.withOpacity(.3),
                )
              ]),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0.006 * height),
                  child: TextFormField(
                    validator: (password) => validatePassword(password),
                    obscureText: true,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red[700],
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.normal,
                    ),
                    decoration: InputDecoration(
                      errorText: "",
                      border: Theme.of(context).inputDecorationTheme.border,
                      icon: Image.asset(
                        'assets/images/icons/key.png',
                        color: Colors.red[700],
                        width: 0.05 * width,
                      ),
                      hintText: 'Current Password',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0.006 * height),
                  child: TextFormField(
                    validator: (password) => validatePassword(password),
                    obscureText: true,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red[700],
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.normal,
                    ),
                    decoration: InputDecoration(
                      errorText: "",
                      border: Theme.of(context).inputDecorationTheme.border,
                      icon: Image.asset(
                        'assets/images/icons/password.png',
                        color: Colors.red[700],
                        width: 0.05 * width,
                      ),
                      hintText: 'New Password',
                    ),
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.red[700],
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.normal,
                  ),
                  decoration: InputDecoration(
                    errorText: "",
                    border: Theme.of(context).inputDecorationTheme.border,
                    icon: Image.asset(
                      'assets/images/icons/confirm.png',
                      color: Colors.red[700],
                      width: 0.05 * width,
                    ),
                    hintText: 'Confirm New Password',
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: .029 * height,
          left: (MediaQuery.of(context).size.width * 0.5) - (0.179 * width),
          right: (MediaQuery.of(context).size.width * 0.5) - (0.179 * width),
          child: RaisedButton(
            color: Theme.of(context).buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 5,
            child: Text(
              'CHANGE',
              style: Theme.of(context)
                  .textTheme
                  .button
                  .copyWith(color: Colors.red[700]),
            ),
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
