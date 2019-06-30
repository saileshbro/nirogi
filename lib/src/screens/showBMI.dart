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
            radius: 80,
                          child: Text(
                bmi.toStringAsFixed(1),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Color(0xFF08D8BF),),
              ),
            ),
            Column(
              children: <Widget>[
               Result(
                 condition: 'Underweight',
                 bmi: '< 18.5',
                 isIt: bmi < 18.5 ? true : false,
               ),
               Result(
                 condition: 'Normal',
                 bmi: '18.5 - 25',
                 isIt:  18.5 < bmi && bmi < 25 ? true : false,
               ),
               Result(
                 condition: 'Overweight',
                 bmi: '25 - 30',
                 isIt: 25 < bmi && bmi < 30 ? true : false,
               ),
               Result(
                 condition: 'Obese',
                 bmi: '30 - 35',
                 isIt: 30 < bmi && bmi < 35 ? true : false,
               ),
               Result(
                 condition: 'Severely Obese',
                 bmi: '35 - 40',
                 isIt: 35 < bmi && bmi < 40 ? true : false,
               ),
               Result(
                 condition: 'Very Severely Obese',
                 bmi: '> 40',
                 isIt: bmi > 40 ? true : false,
               ),
               
              ],
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

class Result extends StatelessWidget {
  final String condition;
  final String bmi;
  final bool isIt;
  const Result({
    Key key, this.condition, this.bmi, this.isIt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:6.0, horizontal: 45),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(condition,
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w400,
            color: isIt == false ? Colors.black : Color(0xFF08D8BF),
          ),),
          Text(bmi,
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w400,
            color: isIt == false ? Colors.black : Color(0xFF08D8BF),
          ),),
        ],
      ),
    );
  }
}
