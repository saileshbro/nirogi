import 'package:flutter/material.dart';
import 'package:flutter_fluid_slider/flutter_fluid_slider.dart';

class DailyWater extends StatefulWidget {
  @override
  _DailyWaterState createState() => _DailyWaterState();
}

class _DailyWaterState extends State<DailyWater> {
  int bodyWeight = 70;
  double litre = 0;
  double glass = 0;
  String waterInLitre = '__ Litre';
  String waterInGlass = '__ Glasses';
  void calculateWater(int weight) {
    litre = weight * 0.031415897987;
    glass = litre / 0.24;
    waterInLitre = litre.toStringAsFixed(3) + ' Litre';
    waterInGlass = glass.toStringAsFixed(1) + ' Glasses';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: <Widget>[
            Text(
              'Water Requirement',
              style: Theme.of(context).textTheme.headline,
            ),
            SizedBox(
              width: 14,
            ),
            Image.asset(
              'assets/images/icons/water.png',
              width: 30,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 15, 18, 8),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'Your Body',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Weight:',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          bodyWeight.toString(),
                          style: TextStyle(
                            fontSize: 50,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          'kg',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 20, 8, 18),
                child: Text(
                  'Slide the cirlce to select your weight.',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: FluidSlider(
                  value: bodyWeight.toDouble(),
                  min: 20,
                  max: 150,
                  onChanged: (double newValue) {
                    setState(() {
                      bodyWeight = newValue.round();
                      waterInLitre = '__ Litre';
                      waterInGlass = '__ Glasses';
                    });
                  },
                  sliderColor: Color(0xFF1E8EE7),
                  thumbColor: Colors.white,
                  valueTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                  start: Image(
                    image: AssetImage('assets/images/icons/thinman.png'),
                    color: Colors.white,
                  ),
                  end: Image(
                    image: AssetImage('assets/images/icons/fatman.png'),
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              RaisedButton(
                //  color: Color(0xFF629DDC),
                color: Colors.green,
                child: Text(
                  'Calculate Daily Requirement',
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    calculateWater(bodyWeight);
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Recommended Daily Water Intake',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text(
                                  waterInLitre,
                                  style: TextStyle(
                                    color: Color(0xFF33BBEA),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 28,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'OR',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  waterInGlass,
                                  style: TextStyle(
                                    color: Color(0xFF1375BC),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 26,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 170,
                        child: Image(
                          image: AssetImage('assets/images/icons/drinkman.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
