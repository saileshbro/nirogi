import 'package:flutter/material.dart';

class BloodDonation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Blood Donation',
              style: Theme.of(context).textTheme.headline,
            ),
            SizedBox(
              width: 14,
            ),
            Image.asset(
              'assets/images/icons/blooddonation.png',
              width: 30,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Calculate Your',
              style: TextStyle(
                fontSize: 19,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Eligible Date for Blood Donation',
              style: Theme.of(context).textTheme.headline,
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              children: <Widget>[
                Container(
                  child: Text('helo'),
                  width:300,
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
