import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nirogi/src/bloc/blocs.dart';
import 'package:nirogi/src/bloc/events.dart';
import 'package:nirogi/src/bloc/states.dart';
import 'package:nirogi/src/functions/functions.dart';
import 'package:nirogi/src/models/models.dart';

class PasswordChangeForm extends StatefulWidget {
  @override
  _PasswordChangeFormState createState() => _PasswordChangeFormState();
}

class _PasswordChangeFormState extends State<PasswordChangeForm> {
  ManagePasswordBloc managePasswordBloc;
  GlobalKey<FormState> _formKey;
  GlobalKey<FormFieldState> _newpwKey;
  final ChangePassword changePassword = ChangePassword();
  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _newpwKey = GlobalKey<FormFieldState>();
    managePasswordBloc = ManagePasswordBloc();
  }

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
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0.006 * height),
                  child: TextFormField(
                    onSaved: (value) {
                      changePassword.currentpw = value;
                    },
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
                    key: _newpwKey,
                    onSaved: (value) {
                      changePassword.newpw = value;
                    },
                    validator: (password) {
                      return validatePassword(password);
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
                      hintText: 'New Password',
                    ),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value != _newpwKey.currentState.value) {
                      return "Password didn't match";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    changePassword.confirmpw = value;
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
            child: BlocBuilder(
              bloc: managePasswordBloc,
              builder: (BuildContext context, state) {
                if (state is ManagePasswordUninitialisedState) {
                  return Text(
                    'CHANGE',
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(color: Colors.red[700]),
                  );
                } else if (state is ManagePasswordRequestingState) {
                  return CircularProgressIndicator(
                    strokeWidth: 1,
                  );
                } else if (state is ManagePasswordSuccessState) {
                  Fluttertoast.showToast(
                      msg: state.message,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIos: 1,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 16.0);

                  Navigator.of(context).pop();
                } else if (state is ManagePasswordErrorState) {
                  Fluttertoast.showToast(
                      msg: state.error,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIos: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  return Text(
                    'CHANGE',
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(color: Colors.red[700]),
                  );
                }
              },
            ),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                managePasswordBloc.dispatch(
                    ChangePasswordEvent(changePassword: changePassword));

                print(changePassword.toJson());
              }
            },
          ),
        )
      ],
    );
  }
}
