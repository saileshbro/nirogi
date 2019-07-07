import 'package:flutter/material.dart';

class ToolCard extends StatelessWidget {
  const ToolCard({
    Key key,
    @required this.imageUrl,
    @required this.name,
    @required this.onTapWidget,
  }) : super(key: key);

  final String imageUrl;
  final String name;
  final Widget onTapWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 180,
            child: InkWell(
              child: Card(
                elevation: 5,
                color: Theme.of(context).canvasColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 20),
                      child: Image.asset(
                        imageUrl,
                        height: 90,
                        width: 90,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      name,
                      style: Theme.of(context).textTheme.body1.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return onTapWidget;
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
