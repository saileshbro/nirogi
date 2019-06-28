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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15),
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              child: Card(
                elevation: 5,
                color: Colors.white70,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(8),
                      child: Image.asset(
                        imageUrl,
                        height: 100,
                        width: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        name,
                        style: Theme.of(context).textTheme.body1.copyWith(
                              fontSize: 22,
                            ),
                      ),
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
        ],
      ),
    );
  }
}
