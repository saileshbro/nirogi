import 'package:flutter/material.dart';

class ShowBMI extends StatelessWidget {

  final String text;
  final double bmi;
  
  const ShowBMI({Key key, this.text, this.bmi}) : super(key: key);
  Color getBmiColor(bmi){
    if(bmi < 18.5){
      return Colors.blue;
    }
    else if(18.5 < bmi && bmi < 25 ){
      return Color(0xFF08D8BF);
    }
    else if(25 < bmi && bmi < 30 ){
      return Colors.yellow;
    }
    else if(30 < bmi && bmi < 35){
      return Colors.orange;
    }
    else if(35 < bmi && bmi < 40){
      return Color(0xFFF37B56);
    }
    else{
      return Colors.red;
    }
  }
  Color getCircleColor(double bmi){
    if(bmi < 18.5){
      return Colors.lightBlue[50];
    }
    else if(18.5 < bmi && bmi < 25 ){
      return  Color(0xFFEDFBF9);
    }
    else if(25 < bmi && bmi < 30 ){
      return Colors.yellow[50];
    }
    else if(30 < bmi && bmi < 35){
      return Colors.orange[50];
    }
    else if(35 < bmi && bmi < 40){
      return Colors.orange[50];
    }
    else{
      return Colors.red[50];
    }
  }
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
            CircleAvatar(backgroundColor: getCircleColor(bmi),
            radius: 80,
                          child: Text(
                bmi.toStringAsFixed(1),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: getBmiColor(bmi),),
              ),
            ),
            Column(
              children: <Widget>[
               Result(
                 condition: 'Underweight',
                 bmi: '< 18.5',
                 isIt: bmi < 18.5 ? true : false,
                 txtcolor: bmi < 18.5 ?Colors.blue: Colors.black,
               ),
               Result(
                 condition: 'Normal',
                 bmi: '18.5 - 25',
                 isIt:  18.5 < bmi && bmi < 25 ? true : false,
                 txtcolor: 18.5 < bmi && bmi < 25 ? Color(0xFF08D8BF):  Colors.black,
               ),
               Result(
                 condition: 'Overweight',
                 bmi: '25 - 30',
                 isIt: 25 < bmi && bmi < 30 ? true : false,
                 txtcolor: 25 < bmi && bmi < 30 ? Colors.yellow :  Colors.black,
               ),
               Result(
                 condition: 'Obese',
                 bmi: '30 - 35',
                 isIt: 30 < bmi && bmi < 35 ? true : false,
                 txtcolor: 30 < bmi && bmi < 35 ? Colors.orange :  Colors.black,
               ),
               Result(
                 condition: 'Severely Obese',
                 bmi: '35 - 40',
                 isIt: 35 < bmi && bmi < 40 ? true : false,
                 txtcolor: 35 < bmi && bmi < 40 ? Color(0xFFF37B56) :  Colors.black,
               ),
               Result(
                 condition: 'Very Severely Obese',
                 bmi: '> 40',
                 isIt: bmi > 40 ? true : false,
                 txtcolor: bmi > 40 ?Colors.red : Colors.black,
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
  final Color txtcolor;
  const Result({
    Key key, this.condition, this.bmi, this.isIt, this.txtcolor,
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
            color: isIt == false ? Colors.black : txtcolor,
          ),),
          Text(bmi,
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w400,
            color: isIt == false ? Colors.black : txtcolor,
          ),),
        ],
      ),
    );
  }
}
