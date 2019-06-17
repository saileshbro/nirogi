import 'package:flutter/material.dart';
import 'package:nirogi/src/models/popupchoice.dart';

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return Text(choice.title,
        style: Theme.of(context).textTheme.body1.copyWith(fontSize: 14));
  }
}
