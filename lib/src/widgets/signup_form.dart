import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nirogi/src/functions/functions.dart';

class SignupForm extends StatelessWidget {
  static GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static GlobalKey<FormFieldState> _passwordKey = GlobalKey<FormFieldState>();
  final formData = {'name': '', 'email': '', 'password': ''};

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
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0.004),
                  child: TextFormField(
                    validator: (name) => validateName(name),
                    onSaved: (name) {
                      formData['name'] = name;
                    },
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
                        'assets/images/icons/user.png',
                        color: Colors.red[700],
                        width: 0.05 * width,
                      ),
                      hintText: 'Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0.004 * height),
                  child: TextFormField(
                    validator: (email) => validateEmail(email),
                    onSaved: (email) {
                      formData['email'] = email;
                    },
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red[700],
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.normal,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      errorText: "",
                      border: Theme.of(context).inputDecorationTheme.border,
                      icon: Image.asset(
                        'assets/images/icons/email.png',
                        color: Colors.red[700],
                        width: 0.05 * width,
                      ),
                      hintText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0.004 * height),
                  child: TextFormField(
                    key: _passwordKey,
                    validator: (password) => validatePassword(password),
                    onSaved: (password) {
                      formData['password'] = password;
                    },
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
                      hintText: 'Password',
                    ),
                  ),
                ),
                TextFormField(
                  validator: (confirmPassword) {
                    if (_passwordKey.currentState.value == confirmPassword) {
                      print(_passwordKey.currentState.value);
                      print(confirmPassword);
                      return null;
                    }
                    return "Password didn't match";
                  },
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
                    hintText: 'Confirm Password',
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: .029 * height,
          left: (MediaQuery.of(context).size.width * 0.5) - (0.179 * width),
          child: RaisedButton(
            padding: EdgeInsets.symmetric(
                horizontal: .08 * width, vertical: 0.01 * height),
            color: Theme.of(context).buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 5,
            child: Text(
              'SIGN UP',
              style: Theme.of(context)
                  .textTheme
                  .button
                  .copyWith(color: Colors.red[700]),
            ),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                print(formData);
              }
            },
          ),
        )
      ],
    );
  }
}
