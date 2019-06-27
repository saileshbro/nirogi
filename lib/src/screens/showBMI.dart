import 'package:flutter/material.dart';

class ShowBMI extends StatelessWidget {
  final String text;
  final double bmi;
  const ShowBMI({Key key, this.text, this.bmi}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Result', style: Theme.of(context).textTheme.headline),
            SizedBox(
              width: 39,
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Your BMI Score',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.blueAccent),
                ),
              ],
            ),
            CircleAvatar(backgroundColor: Color(0xFFEDFBF9),
            radius: 90,
                          child: Text(
                bmi.toStringAsFixed(1),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Color(0xFF08D8BF),),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
                          child: CircleAvatar(
                radius: 33,
                            child: Icon(
                  Icons.refresh,
                  size: 33,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
