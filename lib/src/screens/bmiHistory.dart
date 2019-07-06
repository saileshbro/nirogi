import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nirogi/src/bloc/blocs.dart';
import 'package:nirogi/src/bloc/bmi_event.dart';
import 'package:nirogi/src/bloc/states.dart';
import 'package:nirogi/src/themes/scrollOverlay.dart';

class BmiHistory extends StatefulWidget {
  @override
  _BmiHistoryState createState() => _BmiHistoryState();
}

class _BmiHistoryState extends State<BmiHistory> {
  BmiBloc bmiBloc = BmiBloc();

  @override
  void initState() {
    super.initState();
    bmiBloc.dispatch(BmiGetEvent());
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
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
        body: BlocBuilder(
          bloc: bmiBloc,
          builder: (BuildContext context, BmiState state) {
            if (state is BmiSendingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is BmiFetchedState) {
              return ScrollConfiguration(
                behavior: RemoveEndOfListIndicator(),
                child: RefreshIndicator(
                  onRefresh: () async {
                    bmiBloc.dispatch(BmiGetEvent());
                  },
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
                                  rows: state.bmis.map(
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
                                  ).toList()),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is BmiErrorState) {
              return Center(
                child: Text('error'),
              );
            }
          },
        ));
  }
}
