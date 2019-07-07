import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nirogi/src/bloc/blocs.dart';
import 'package:nirogi/src/bloc/bmi_state.dart';
import 'package:nirogi/src/bloc/events.dart';
import 'package:nirogi/src/bloc/states.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:nirogi/src/repository/repositories.dart';
import 'package:nirogi/src/themes/scrollOverlay.dart';

class BmiHistory extends StatefulWidget {
  @override
  _BmiHistoryState createState() => _BmiHistoryState();
}

class _BmiHistoryState extends State<BmiHistory> {
  Future<List<Bmi>> bmis;
  @override
  void initState() {
    super.initState();
    bmis = bmiRepository.getBmiRecords();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _showDeleteModal();
            },
            icon: Icon(
              Icons.delete,
              size: 30,
              color: Colors.red,
            ),
          )
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('BMI History',
                style: Theme.of(context).textTheme.body2.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    )),
            SizedBox(
              width: 0.02 * width,
            ),
            Image.asset(
              'assets/images/icons/bmi.png',
              width: 0.075 * width,
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: bmis,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length == 0) {
              return Center(
                child: Text(
                  'No Records Found.',
                  style: Theme.of(context).textTheme.headline.copyWith(
                      fontSize: 17,
                      color: Colors.blue[700],
                      fontWeight: FontWeight.w500),
                ),
              );
            } else {
              return ScrollConfiguration(
                behavior: RemoveEndOfListIndicator(),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            DataTable(
                              columns: <DataColumn>[
                                DataColumn(
                                  label: Text(
                                    'Calculated Date',
                                    style: Theme.of(context)
                                        .textTheme
                                        .body2
                                        .copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.red[700],
                                        ),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'BMI',
                                    style: Theme.of(context)
                                        .textTheme
                                        .body2
                                        .copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.red[700],
                                        ),
                                  ),
                                ),
                              ],
                              rows: snapshot.data.map<DataRow>(
                                (bmi) {
                                  return DataRow(
                                    cells: <DataCell>[
                                      DataCell(
                                        Text(bmi.createdAt),
                                        showEditIcon: false,
                                        placeholder: false,
                                      ),
                                      DataCell(
                                        Text(
                                          bmi.value.toString(),
                                        ),
                                        placeholder: false,
                                      ),
                                    ],
                                  );
                                },
                              ).toList(),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 0.32 * MediaQuery.of(context).size.width,
                    height: 0.32 * MediaQuery.of(context).size.width,
                    child: FlareActor(
                      'assets/animations/nointernet.flr',
                      animation: 'init',
                      fit: BoxFit.cover,
                      shouldClip: false,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(snapshot.error)
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.pink,
              ),
            );
          }
        },
      ),
    );
  }

  void _showDeleteModal() {
    BmiBloc deleteBmiBloc = BmiBloc();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(5),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              'DELETE?',
              style: Theme.of(context)
                  .textTheme
                  .body1
                  .copyWith(fontSize: 16, color: Colors.red[700]),
              textAlign: TextAlign.center,
            ),
          ),
          content: BlocBuilder(
            bloc: deleteBmiBloc,
            builder: (BuildContext context, state) {
              if (state is BmiUninitiatedState) {
                return Text(
                  'Do you really want to clear the history?',
                  style:
                      Theme.of(context).textTheme.body2.copyWith(fontSize: 14),
                  textAlign: TextAlign.center,
                );
              } else if (state is BmiSendingState) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LinearProgressIndicator(),
                );
              } else if (state is BmiSucessState) {
                Fluttertoast.showToast(
                    msg: state.message,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIos: 1,
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    fontSize: 16.0);
                Navigator.of(context).pop();
                return Text(
                  'Do you really want to clear the history?',
                  style:
                      Theme.of(context).textTheme.body2.copyWith(fontSize: 14),
                  textAlign: TextAlign.center,
                );
              } else if (state is BmiErrorState) {
                Fluttertoast.showToast(
                    msg: state.error,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIos: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
                Navigator.of(context).pop();
                return Text(
                  'Do you really want to clear the history?',
                  style:
                      Theme.of(context).textTheme.body2.copyWith(fontSize: 14),
                  textAlign: TextAlign.center,
                );
              }
            },
          ),
          actions: <Widget>[
            FlatButton(
              color: Colors.transparent,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: Theme.of(context).textTheme.body2.copyWith(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
              ),
            ),
            FlatButton(
              color: Colors.transparent,
              onPressed: () {
                deleteBmiBloc.dispatch(BmiClearEvent());
              },
              child: Text(
                'Delete',
                style: Theme.of(context).textTheme.body2.copyWith(
                      fontSize: 16,
                      color: Colors.red[700],
                    ),
              ),
            ),
          ],
        );
      },
    );
  }
}
