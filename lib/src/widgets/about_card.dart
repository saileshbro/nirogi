import 'package:flutter/material.dart';

class AboutPageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Container(
          height: 450,
          margin: EdgeInsets.fromLTRB(
              0.08 * width, 0.14 * height, .08 * width, .03 * height),
          padding: EdgeInsets.fromLTRB(
              .02 * width, .01 * height, .02 * width, .01 * height),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(1),
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
                  'Hami Nirogi',
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                Text(
                  ' is an android application that provides information about different types of diseases, symptoms and other health related issues. ',
                  style: Theme.of(context).textTheme.body1.copyWith(
                        fontSize: 16,
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
                      ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  ' Project group Members :',
                  style: Theme.of(context).textTheme.body1.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Sailesh Dahal (10)',
                  style: Theme.of(context).textTheme.body2.copyWith(
                        fontSize: 18,
                      ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Sarayu Gautam (14)',
                  style: Theme.of(context).textTheme.body2.copyWith(
                        fontSize: 18,
                      ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Awan Shrestha (45)',
                  style: Theme.of(context).textTheme.body2.copyWith(
                        fontSize: 18,
                      ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Sabil Shrestha (51)',
                  style: Theme.of(context).textTheme.body2.copyWith(
                        fontSize: 18,
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
