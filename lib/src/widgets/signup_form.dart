import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nirogi/src/bloc/authentication_bloc.dart';
import 'package:nirogi/src/bloc/blocs.dart';
import 'package:nirogi/src/bloc/events.dart';
import 'package:nirogi/src/bloc/signup_bloc.dart';
import 'package:nirogi/src/bloc/signup_state.dart';
import 'package:nirogi/src/bloc/states.dart';
import 'package:nirogi/src/functions/functions.dart';

class SignupForm extends StatefulWidget {
  final SignupBloc signupBloc;
  final AuthenticationBloc authenticationBloc;

  const SignupForm({
    Key key,
    @required this.signupBloc,
    @required this.authenticationBloc,
  }) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  static GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static GlobalKey<FormFieldState> _emailKey = GlobalKey<FormFieldState>();
  static GlobalKey<FormFieldState> _name = GlobalKey<FormFieldState>();
  static GlobalKey<FormFieldState> _passwordKey = GlobalKey<FormFieldState>();
  String email = "";
  String password = "";
  String name = "";
  SignupBloc get _signupBloc => widget.signupBloc;
  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return BlocBuilder<SignupEvent, SignupState>(
      bloc: _signupBloc,
      builder: (BuildContext context, SignupState state) {
        if (state is SignupFailureState) {
          _onWidgetDidBuild(() {
            Fluttertoast.showToast(
                msg: state.error,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIos: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          });
        }
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
                        key: _name,
                        validator: (name) => validateName(name),
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
                        key: _emailKey,
                        validator: (email) => validateEmail(email),
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
                        if (_passwordKey.currentState.value ==
                            confirmPassword) {
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
              right:
                  (MediaQuery.of(context).size.width * 0.5) - (0.179 * width),
              child: RaisedButton(
                color: Theme.of(context).buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
                child: Center(
                  child: state is SignupLoadingState
                      ? CircularProgressIndicator(
                          backgroundColor: Colors.pink,
                        )
                      : Text(
                          'REGISTER',
                          style: Theme.of(context)
                              .textTheme
                              .button
                              .copyWith(color: Colors.red[700]),
                        ),
                ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    email = _emailKey.currentState.value;
                    password = _passwordKey.currentState.value;
                    name = _name.currentState.value;
                    _signupBloc.dispatch(
                      SignupButtonPressedEvent(
                        email: email,
                        password: password,
                        name: name,
                      ),
                    );
                  }
                },
              ),
            )
          ],
        );
      },
    );
  }
}
