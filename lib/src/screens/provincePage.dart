import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:nirogi/src/constants/env.dart';
import 'package:nirogi/src/repository/repositories.dart';
import 'package:nirogi/src/screens/eachProvincePage.dart';
import 'package:nirogi/src/themes/scrollOverlay.dart';

List<String> images = [
  "$baseUrl/public/images/province/province700.jpg",
  "$baseUrl/public/images/province/province600.jpg",
  "$baseUrl/public/images/province/province500.jpg",
  "$baseUrl/public/images/province/province400.jpg",
  "$baseUrl/public/images/province/province300.jpg",
  "$baseUrl/public/images/province/province200.jpg",
  "$baseUrl/public/images/province/province100.jpg",
];

class ProvincePage extends StatefulWidget {
  @override
  _ProvincePageState createState() => _ProvincePageState();
}

class _ProvincePageState extends State<ProvincePage> {
  var currentPage = images.length - 1.0;
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Geographic Health Information",
          style: Theme.of(context).textTheme.headline,
        ),
      ),
      body: FutureBuilder(
        future: provinceRepository.getProvinces(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: <Widget>[
                SizedBox(height: 60),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Select a Province',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.grey[500],
                              offset: Offset(1, 2),
                              blurRadius: 4,
                            )
                          ]),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    int activeProvince = 8 - (currentPage.round().floor() + 1);
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return EachProvincePage(
                        provinceId: activeProvince,
                        title: 'Province $activeProvince',
                      );
                    }));
                  },
                  child: Stack(
                    children: <Widget>[
                      CardScrollWidget(currentPage),
                      Positioned.fill(
                        child: ScrollConfiguration(
                          child: PageView.builder(
                            itemCount: snapshot.data.length,
                            controller: controller,
                            reverse: true,
                            itemBuilder: (context, index) {
                              return Container();
                            },
                          ),
                          behavior: RemoveEndOfListIndicator(),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("error"),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class CardScrollWidget extends StatelessWidget {
  final currentPage;
  final double padding = 20.0;
  final double verticalInset = 20.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = List();

        for (var i = 0; i < images.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(3.0, 6.0),
                        blurRadius: 10.0)
                  ],
                ),
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.network(images[i], fit: BoxFit.cover),
                    ],
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}