import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class BloodDonation extends StatefulWidget {
  @override
  _BloodDonationState createState() => _BloodDonationState();
}

class _BloodDonationState extends State<BloodDonation> {
  String selectedDate = 'Select Date';
  DateTime date = DateTime.now();
  String result;
  bool dateSelected = false;
  bool toShow = false;
  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2018),
        lastDate: DateTime(2025),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light(),
            child: child,
          );
        });
    if (picked != null) {
      setState(() {
        selectedDate = DateFormat("dd-MM-yyyy").format(picked);
        date = picked.add(Duration(days: 56));
        result = DateFormat("dd-MM-yyyy").format(date);
        toShow = false;
        dateSelected = true;
      });
    }
  }

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
        padding: const EdgeInsets.all(8.0),
        child: Card(
          //    color: Colors.white70,
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 30, 18, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Calculate Your',
                      style: TextStyle(
                        fontSize: 19,
                      ),
                    ),
                    Container(),
                  ],
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
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Text(
                            'Select date of last donation :',
                            style: Theme.of(context).textTheme.body1,
                          ),
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 30,
                        color: Colors.black87,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        child: Row(
                          children: <Widget>[
                            Text(
                              selectedDate,
                              style: Theme.of(context).textTheme.body1,
                            ),
                            Icon(Icons.keyboard_arrow_down),
                          ],
                        ),
                        onTap: () {
                          selectDate(context);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                RaisedButton(
                  color: Colors.blue[100],
                  child: Text('Calculate Next Eligible Date'),
                  onPressed: () {
                    setState(() {
                      toShow = true;
                      if (dateSelected == false) {
                        Alert(
                          context: context,
                          title: 'No Date Selected',
                          desc: 'Please select the date first.',
                          type: AlertType.warning,
                        ).show();
                        toShow = false;
                      }
                    });
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                toShow == true
                    ? Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 5, 10, 20),
                          child: Card(
                            elevation: 3,
                            color: Colors.white54,
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(10,0,0,0),
                                          child: Text(
                                            'You can donate blood after $result',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Image(
                                          image: AssetImage(
                                              'assets/images/icons/blooder.png'),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  width: 300,
                                  color: Colors.black26,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    'Date of last donation:  $selectedDate',
                                    style: Theme.of(context).textTheme.body1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
