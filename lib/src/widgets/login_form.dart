import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(40, 20, 40, 50),
          padding: EdgeInsets.fromLTRB(20, 30, 20, 70),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red[700],
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.normal,
                ),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: Theme.of(context).inputDecorationTheme.border,
                  icon: Image.asset(
                    'assets/images/icons/email.png',
                    color: Colors.red[700],
                    width: 25,
                  ),
                  hintText: 'Email',
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                obscureText: true,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red[700],
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.normal,
                ),
                decoration: InputDecoration(
                  border: Theme.of(context).inputDecorationTheme.border,
                  icon: Image.asset(
                    'assets/images/icons/password.png',
                    color: Colors.red[700],
                    width: 25,
                  ),
                  hintText: 'Password',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  print('nicee');
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Forgot password?",
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.body1,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 25,
          left: (MediaQuery.of(context).size.width * 0.5) - 70,
          child: RaisedButton(
            color: Theme.of(context).buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 5,
            child: Text(
              'LOGIN',
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
