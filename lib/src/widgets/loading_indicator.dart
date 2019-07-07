import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
        child: Scaffold(
          body: Center(
              child: CircularProgressIndicator(
            backgroundColor: Colors.pink,
          )),
        ),
      );
}
