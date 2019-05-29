import 'package:flutter/material.dart';
import 'package:nirogi/src/widgets/drawer.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: AppDrawer(),
      body: Center(
        child: Text('About'),
      ),
    );
  }
}
