import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nirogi/src/bloc/blocs.dart';
import 'package:nirogi/src/bloc/events.dart';
import 'package:nirogi/src/bloc/states.dart';
import 'package:nirogi/src/functions/validator.dart';
import 'package:nirogi/src/models/user.dart';

class LoginForm extends StatefulWidget {
  final LoginBloc loginBloc;
  final AuthenticationBloc authenticationBloc;

  LoginForm({
    Key key,
    @required this.loginBloc,
    @required this.authenticationBloc,
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  static GlobalKey<FormFieldState> _emailKey = new GlobalKey<FormFieldState>();
  static GlobalKey<FormFieldState> _passwordKey =
      new GlobalKey<FormFieldState>();
  User user = User(email: "", password: '', name: '');
  LoginBloc get _loginBloc => widget.loginBloc;

  @override
  void initState() {
    super.initState();
    focusNode1.addListener(_onFocusChanged);
    focusNode2.addListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    _loginBloc.dispatch((LoginInitialEvent()));
  }

  String email;

  void _showDialog() {
    ManagePasswordBloc managePasswordBloc = ManagePasswordBloc();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(5),
          title: Container(
            margin: EdgeInsets.fromLTRB(50, 0, 50, 20),
            child: Text(
              'FORGOT PASSWORD?',
              style: Theme.of(context).textTheme.body1.copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Form(
              key: _key,
              child: TextFormField(
                onSaved: (value) {
                  email = value;
                },
                validator: (email) {
                  return validateEmail(email);
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
                    width: 20,
                  ),
                  hintText: 'Email',
                ),
              ),
            ),
          ),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 10),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  onPressed: () {
                    if (_key.currentState.validate()) {
                      _key.currentState.save();
                      print(email);
                      managePasswordBloc
                          .dispatch(ForgetPasswordEvent(email: email));
                    }
                  },
                  child: BlocBuilder(
                    bloc: managePasswordBloc,
                    builder: (BuildContext context, state) {
                      if (state is ManagePasswordUninitialisedState) {
                        return Text(
                          'RESET',
                          style: Theme.of(context).textTheme.body2.copyWith(
                                fontSize: 16,
                                color: Colors.white,
                              ),
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
                        return Text(
                          'RESET',
                          style: Theme.of(context).textTheme.body2.copyWith(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                        );
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
                          'RESET',
                          style: Theme.of(context).textTheme.body2.copyWith(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                        );
                      }
                    },
                  )),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return BlocBuilder<LoginEvent, LoginState>(
      bloc: _loginBloc,
      builder: (BuildContext context, LoginState state) {
        if (state is LoginFailureState) {
          Fluttertoast.showToast(
              msg: state.error,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIos: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
        return Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(
                  0.08 * width, .02 * height, .08 * width, .058 * height),
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
                    TextFormField(
                      key: _emailKey,
                      focusNode: focusNode1,
                      validator: (email) {
                        return validateEmail(email);
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
                    SizedBox(
                      height: 0.014 * MediaQuery.of(context).size.height,
                    ),
                    TextFormField(
                      focusNode: focusNode2,
                      key: _passwordKey,
                      validator: (password) {
                        if (password.length > 7) {
                          return null;
                        }
                        return 'Password must be 8 characters long';
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
                    GestureDetector(
                      onTap: _showDialog,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 15),
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          'Forgot Password?',
                          style: Theme.of(context)
                              .textTheme
                              .body1
                              .copyWith(fontSize: 16, color: Colors.black),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    )
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
                          'LOGIN',
                          style: Theme.of(context)
                              .textTheme
                              .button
                              .copyWith(color: Colors.red[700]),
                        ),
                ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    user.email = _emailKey.currentState.value;
                    user.password = _passwordKey.currentState.value;
                    _loginBloc.dispatch(LoginButtonPressedEvent(
                        email: user.email, password: user.password));
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
