import 'package:flutter/material.dart';
import 'showBMI.dart';
import "dart:math";

enum Gender {
  male,
  female,
}
const inactiveMaleColor = Color(0xFF8BB8E1);
const inactiveFemaleColor = Color(0xFFF3AFD7);
const activeMaleColor = Color(0XFF2B86D3);
const activeFemaleColor = Color(0XFFF2669C);
const inactiveHeight = 60;
const activeHeight = 75;
Color maleColor = Color(0xFFF5F5F5);
Color femaleColor = Color(0xFFF5F5F5);
String showGender = 'Male';

class CalculateBMI extends StatefulWidget {
  @override
  _CalculateBMIState createState() => _CalculateBMIState();
}

class _CalculateBMIState extends State<CalculateBMI> {
  Gender selectedGender = Gender.male;
  int weightValue = 70;
  int bodyHeight = 170;
  Color maleColor = activeMaleColor;
  Color femaleColor = inactiveFemaleColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('BMI Calculator', style: Theme.of(context).textTheme.headline),
            SizedBox(
              width: 14,
            ),
          ],
        ),
      ),
      body: Container(
        color: Color(0xFFF5F5F5),
        padding: const EdgeInsets.fromLTRB(15, 8, 15, 45),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        selectedGender == Gender.male ? "Male" : "Female",
                        style: TextStyle(
                            fontSize: 17,
                            color: Color(0xFFA9A9A9),
                            fontWeight: FontWeight.bold),
                      ),
                      Line(),
                      Text(
                        weightValue.toString() + 'Kg',
                        style: TextStyle(
                            fontSize: 17,
                            color: Color(0xFFA9A9A9),
                            fontWeight: FontWeight.bold),
                      ),
                      Line(),
                      Text(
                        bodyHeight.toString() + 'cm',
                        style: TextStyle(
                            fontSize: 17,
                            color: Color(0xFFA9A9A9),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Card(
                            child: SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'GENDER',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat-Medium',
                                        fontSize: 20,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Container(
                                      height: 0.2,
                                      width: double.infinity,
                                      color: Colors.black,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 46),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selectedGender = Gender.male;
                                              });
                                            },
                                            child: Image.asset(
                                              'assets/images/icons/male.png',
                                              fit: BoxFit.fill,
                                              color:
                                                  selectedGender == Gender.male
                                                      ? activeMaleColor
                                                      : inactiveMaleColor,
                                              height:
                                                  selectedGender == Gender.male
                                                      ? 75
                                                      : 60,
                                            ),
                                          ),
                                          Text(
                                            'or',
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selectedGender = Gender.female;
                                              });
                                            },
                                            child: Image.asset(
                                              'assets/images/icons/female.png',
                                              fit: BoxFit.fill,
                                              color: selectedGender ==
                                                      Gender.female
                                                  ? activeFemaleColor
                                                  : inactiveFemaleColor,
                                              height: selectedGender ==
                                                      Gender.female
                                                  ? 75
                                                  : 60,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: double.infinity,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'WEIGHT (Kg)',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat-Medium',
                                        fontSize: 20,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Container(
                                      height: 0.1,
                                      width: double.infinity,
                                      color: Colors.black,
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 28, 8, 0),
                                        child: Stack(
                                          alignment: Alignment.bottomCenter,
                                          children: <Widget>[
                                            Container(
                                              height: 110,
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    244, 244, 244, 1.0),
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        80),
                                              ),
                                              child: LayoutBuilder(
                                                builder: (context,
                                                        constraints) =>
                                                    WeightSlider(
                                                      minValue: 30,
                                                      maxValue: 110,
                                                      width:
                                                          constraints.maxWidth,
                                                    ),
                                              ),
                                            ),
                                            Icon(
                                              Icons.keyboard_arrow_up,
                                              size: 30,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'HEIGHT (cm)',
                                style: TextStyle(
                                  fontFamily: 'Montserrat-Medium',
                                  fontSize: 20,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                height: 0.2,
                                width: double.infinity,
                                color: Colors.black,
                              ),
                              Slider(
                                value: bodyHeight.toDouble(),
                                max: 220,
                                min: 100,
                                onChanged: (double newValue) {
                                  setState(() {
                                    bodyHeight = newValue.round();
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: RaisedButton(
                color: selectedGender == Gender.male
                    ? Colors.lightBlue
                    : activeFemaleColor,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Calculate!',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        double bmi = (weightValue / pow((bodyHeight/100),2));
                        return ShowBMI(
                          bmi: bmi,
                        );
                      },
                    ),
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Line extends StatelessWidget {
  const Line({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.5,
      color: Color(0xFFA9A9A9),
      height: 23,
    );
  }
}

class TempCards extends StatelessWidget {
  const TempCards({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Text('label'),
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}

class WeightSlider extends StatelessWidget {
  WeightSlider({
    Key key,
    @required this.minValue,
    @required this.maxValue,
    @required this.width,
  }) : super(key: key);

  final int minValue;
  final int maxValue;
  final double width;

  double get itemExtent => width / 3;

  int indexToValue(int index) => minValue + (index - 1);

  @override
  build(BuildContext context) {
    int itemCount = (maxValue - minValue) + 3;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemExtent: itemExtent,
      itemCount: itemCount,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        final int value = indexToValue(index);
        bool isExtra = index == 0 || index == itemCount - 1;

        return GestureDetector(
          behavior: HitTestBehavior
              .translucent, 
          onTap: () {
            print(value);
          },
          child: isExtra
              ? Container()
              : FittedBox(
                  child: Text(
                    value.toString(),
                    style: TextStyle(
                        color: Color.fromRGBO(196, 197, 203, 1.0),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500),
                  ),
                  fit: BoxFit.scaleDown,
                ),
        );
      },
    );
  }
}
