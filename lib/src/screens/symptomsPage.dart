import 'package:flutter/material.dart';
import 'package:nirogi/src/widgets/drawer.dart';

class SymptomsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(),
      body: Center(
        child: Text('Symptoms'),
      ),
    );
  }
}
