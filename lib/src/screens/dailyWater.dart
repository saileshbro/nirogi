import 'package:flutter/material.dart';
import 'package:flutter_fluid_slider/flutter_fluid_slider.dart';
import 'package:nirogi/src/themes/glass_painter.dart';
import 'package:nirogi/src/themes/scrollOverlay.dart';

class DailyWater extends StatefulWidget {
  @override
  _DailyWaterState createState() => _DailyWaterState();
}

class _DailyWaterState extends State<DailyWater>
    with SingleTickerProviderStateMixin {
  int bodyWeight = 70;
  int glassVolume = 240;
  double litre = 0;
  double glass = 0;
  String waterInLitre = '__ Litre';
  String waterInGlass = '__ Glasses';
  String volume = '240 ml';

  int fullGlasses = 0;
  double lastGlassVolume = 1.0;

  Animation<double> waterLevelAnimation;
  AnimationController waterLevelAnimationController;

  void calculateWater(int weight) {
    double divider = glassVolume / 1000;
    litre = weight * 0.031415897987;
    glass = litre / divider;
    waterInLitre = litre.toStringAsFixed(3) + ' Litre';
    waterInGlass = glass.toStringAsFixed(1) + ' Glasses';
    volume = glassVolume.toString() + ' ml';

    fullGlasses = glass.floor();
    lastGlassVolume = double.parse((glass - fullGlasses).toStringAsFixed(1));
    waterLevelAnimationController.reset();
    waterLevelAnimationController.forward();
  }

  @override
  void initState() {
    super.initState();
    waterLevelAnimationController =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    waterLevelAnimation =
        Tween<double>(begin: 0, end: 1).animate(waterLevelAnimationController)
          ..addListener(() {
            setState(() {});
          });
    waterLevelAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final List<WaterGlass> waterGlassList = [];
    for (int i = 0; i < fullGlasses; i++) {
      waterGlassList.add(WaterGlass(
        waterLevelAnimation: waterLevelAnimation,
        finalGlassVolume: 1,
      ));
    }
    if (lastGlassVolume != 0) {
      waterGlassList.add(WaterGlass(
        waterLevelAnimation: waterLevelAnimation,
        finalGlassVolume: lastGlassVolume,
      ));
    }
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
          ],
        ),
      ),
      body: ScrollConfiguration(
        behavior: RemoveEndOfListIndicator(),
        child: SingleChildScrollView(
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
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      waterInLitre,
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                        fontSize: 23,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text('OR')),
                    Text(
                      waterInGlass,
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                        fontSize: 23,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Wrap(
                      spacing: 3,
                      alignment: WrapAlignment.center,
                      children: waterGlassList.map((glass) {
                        return glass;
                      }).toList()),
                ),
                SizedBox(
                  height: 4,
                ),
                Container(
                  width: 330,
                  height: 1,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 25,
                ),
                WaterRecommendationBox(
                    waterInLitre: waterInLitre, waterInGlass: waterInGlass),
                SizedBox(
                  height: 25,
                ),
                Icon(Icons.keyboard_arrow_down),
                Icon(Icons.keyboard_arrow_down),
                Icon(Icons.keyboard_arrow_down),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 28, 8, 4),
                  child: Text(
                    'Additional Settings',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.teal[700]),
                  ),
                ),
                Container(
                  width: 230,
                  height: 1,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 4, 8),
                          child: Text(
                            'Glass Size',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 30,
                        color: Colors.black87,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                        child: GestureDetector(
                          child: CircleAvatar(
                            child: Icon(Icons.remove),
                          ),
                          onTap: () {
                            setState(() {
                              if (glassVolume > 100) {
                                glassVolume--;
                              }

                              calculateWater(bodyWeight);
                            });
                          },
                        ),
                      ),
                      Text(
                        volume,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                        child: GestureDetector(
                          child: CircleAvatar(
                            child: Icon(Icons.add),
                          ),
                          onTap: () {
                            setState(() {
                              glassVolume++;
                              calculateWater(bodyWeight);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  'It is recommended to drink additional 350ml of water for every 30 minutes of exercise you do.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Note: Your water intake requirement will vary according to your health and activity levels.',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
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
    );
  }
}

class WaterRecommendationBox extends StatelessWidget {
  const WaterRecommendationBox({
    Key key,
    @required this.waterInLitre,
    @required this.waterInGlass,
  }) : super(key: key);

  final String waterInLitre;
  final String waterInGlass;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
    );
  }
}

class WaterGlass extends StatelessWidget {
  final double finalGlassVolume;
  const WaterGlass({
    Key key,
    @required this.waterLevelAnimation,
    this.finalGlassVolume,
  }) : super(key: key);

  final Animation<double> waterLevelAnimation;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      width: 37,
      height: 55,
      child: CustomPaint(
        painter: GlassPainter(
            filledPercent: finalGlassVolume * waterLevelAnimation.value),
      ),
    );
  }
}
