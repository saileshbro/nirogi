import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  static GlobalKey<FormFieldState> _emailKey = new GlobalKey<FormFieldState>();
  static GlobalKey<FormFieldState> _passwordKey =
      new GlobalKey<FormFieldState>();
  User user = User(email: "", password: '', name: '');
  LoginBloc get _loginBloc => widget.loginBloc;

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return BlocBuilder<LoginEvent, LoginState>(
      bloc: _loginBloc,
      builder: (BuildContext context, LoginState state) {
        if (state is LoginFailureState) {
          _onWidgetDidBuild(() {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.error}'),
                backgroundColor: Colors.red,
                duration: Duration(milliseconds: 800),
              ),
            );
          });
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
                      ? SpinKitWave(
                          color: Colors.red[700],
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
                    FocusScope.of(context).requestFocus(new FocusNode());
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
