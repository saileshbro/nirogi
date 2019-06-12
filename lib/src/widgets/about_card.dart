import 'package:flutter/material.dart';

class AboutPageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Container(
          height: 350,
          margin: EdgeInsets.fromLTRB(
              0.08 * width, 0.27 * height, .08 * width, .054 * height),
          padding: EdgeInsets.fromLTRB(
              .02 * width, .034 * height, .02 * width, .05 * height),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.6),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  spreadRadius: .03,
                  color: Colors.black.withOpacity(.3),
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Hami Nirogi is an android application that provides information about different types of diseases, symptoms and other health related issues. ',
                  style: Theme.of(context).textTheme.body1.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  ' Information about diet and appropriate health practices is also provided.',
                  style: Theme.of(context).textTheme.body1.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  ' It also consists of a platform (health forum) where users can ask health related question and get relevant answers.',
                  style: Theme.of(context).textTheme.body1.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
