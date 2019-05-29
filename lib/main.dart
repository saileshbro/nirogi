import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nirogi/src/bloc/change_theme_bloc.dart';
import 'package:nirogi/src/bloc/change_theme_state.dart';
import 'package:nirogi/src/screens/homepage.dart';

void main() {
  runApp(MyApp(
    bloc: changeThemeBloc,
  ));
}

class MyApp extends StatefulWidget {
  final ChangeThemeBloc bloc;
  MyApp({@required this.bloc}) : assert(bloc != null);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    widget.bloc.onDecideThemeChange();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: widget.bloc,
      builder: (BuildContext context, ChangeThemeState state) {
        return MaterialApp(
          home: HomePage(),
          title: 'Hami Nirogi',
          debugShowCheckedModeBanner: false,
          theme: state.themeData,
        );
      },
    );
  }
}
