import 'package:flutter/material.dart';
import 'package:nirogi/src/widgets/drawer.dart';

class ShowDrugs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Health Tools',
              style: Theme.of(context).textTheme.headline,
            ),
            SizedBox(
              width: 14,
            ),
            Image.asset(
              'assets/images/icons/tools.png',
              width: 30,
            ),
          ],
        ),
      ),
      body: Caroussel(),
    );
  }
}

class Caroussel extends StatefulWidget {
  @override
  _CarousselState createState() => _CarousselState();
}

class _CarousselState extends State<Caroussel> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Center(
          child: Container(
            width: width,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.yellow,
            ),
          ),
        ),
        Positioned(
          top: 127,
          child: Container(
            height: 350,
            width: width / 2,
            color: Colors.red,
          ),
        )
      ],
    );
  }
}
