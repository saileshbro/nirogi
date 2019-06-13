import 'package:flutter/material.dart';
import 'package:nirogi/src/models/popupchoice.dart';

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle =
        Theme.of(context).textTheme.body1.copyWith(fontSize: 18);
    return Column(
      children: <Widget>[
        Center(
          child: GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(choice.icon, width: 25, color: Colors.red[700]),
                SizedBox(
                  width: 15,
                ),
                Text(choice.title, style: textStyle),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
