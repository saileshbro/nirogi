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
            Image.asset(
              'assets/images/icons/bmi.png',
              width: 30,
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
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              weightValue.toString(),
                                              style: TextStyle(
                                                fontSize: 30.0,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                GestureDetector(
                                                  child: CircleAvatar(
                                                    child: Icon(Icons.remove),
                                                  ),
                                                  onTap: () {
                                                    if (weightValue > 30) {
                                                      setState(() {
                                                        weightValue--;
                                                      });
                                                    }
                                                  },
                                                ),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                GestureDetector(
                                                  child: CircleAvatar(
                                                    child: Icon(Icons.add),
                                                  ),
                                                  onTap: () {
                                                    if (weightValue < 150) {
                                                      setState(() {
                                                        weightValue++;
                                                      });
                                                    }
                                                  },
                                                ),
                                              ],
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                bodyHeight.toString(),
                                style: TextStyle(
                                  fontSize: 30.0,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Slider(
                                  value: bodyHeight.toDouble(),
                                  max: 220,
                                  min: 100,
                                  onChanged: (double newValue) {
                                    setState(() {
                                      bodyHeight = newValue.round();
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                child: Stack(
                                  alignment: AlignmentDirectional.bottomEnd,
                                  children: <Widget>[
                                    Positioned(
                                      child: Image(
                                        image: selectedGender == Gender.male
                                            ? AssetImage(
                                                'assets/images/icons/male.png')
                                            : AssetImage(
                                                'assets/images/icons/female.png'),
                                        fit: BoxFit.fill,
                                        color: selectedGender == Gender.female
                                            ? activeFemaleColor
                                            : activeMaleColor,
                                        height: bodyHeight.toDouble(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 25,
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
                        double bmi = (weightValue / pow((bodyHeight / 100), 2));
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
