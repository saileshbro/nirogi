import 'package:flutter/material.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:nirogi/src/themes/scrollOverlay.dart';
import 'package:nirogi/src/widgets/widgets.dart';

class IncompatibleFoodsMenuPage extends StatelessWidget {
  final IncompatibleFoods data = IncompatibleFoods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Incompatible Foods',
              style: Theme.of(context).textTheme.body2.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            SizedBox(
              width: 14,
            ),
            Stack(
              children: <Widget>[
                Image.asset(
                  'assets/images/icons/breakfast.png',
                  width: 50,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/images/icons/close.png',
                    width: 20,
                    color: Colors.red[700],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
        child: Container(
          child: Column(
            children: <Widget>[
              Text(
                'Incompatible Foods to Eat With:',
                style: Theme.of(context).textTheme.body2.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.red[700],
                    ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ScrollConfiguration(
                  child: GridView.count(
                    primary: false,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    crossAxisCount: 2,
                    childAspectRatio: 1.2,
                    children: List.generate(
                      foodData.length,
                      (index) {
                        return Center(
                          child: FoodMenuBox(
                            indexNo: index,
                            thefood: foodData[index],
                          ),
                        );
                      },
                    ),
                  ),
                  behavior: RemoveEndOfListIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
