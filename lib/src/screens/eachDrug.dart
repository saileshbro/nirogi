import 'package:flutter/material.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:nirogi/src/themes/scrollOverlay.dart';
import 'package:nirogi/src/widgets/widgets.dart';

class EachDrug extends StatefulWidget {
  final Drug eachdrug;
  const EachDrug({
    this.eachdrug,
  });
  @override
  _EachDrugState createState() => _EachDrugState(eachdrug: eachdrug);
}

class _EachDrugState extends State<EachDrug> {
  final Drug eachdrug;
  _EachDrugState({
    this.eachdrug,
  });
  ScrollController _customController;

  bool _isCollapsed = false;

  @override
  void initState() {
    super.initState();

    _customController = ScrollController()
      ..addListener(
        () => setState(
              () {
                _isCollapsed =
                    (_customController.offset <= kToolbarHeight) ? false : true;
              },
            ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: RemoveEndOfListIndicator(),
        child: NestedScrollView(
          controller: _customController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 230.0,
                floating: false,
                pinned: true,
                centerTitle: true,
                title: _isCollapsed
                    ? Text(
                        eachdrug.brandName,
                        style: Theme.of(context).textTheme.body1.copyWith(
                              fontSize: 20,
                              color: Colors.red[700],
                              fontWeight: FontWeight.w500,
                            ),
                      )
                    : Text(
                        '',
                        style: Theme.of(context).textTheme.body1.copyWith(
                              fontSize: 20,
                              color: Colors.transparent,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                  eachdrug.imageUrl,
                  fit: BoxFit.cover,
                )),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _DrugInfoCard(eachdrug: eachdrug),
                _BuildDrugQuery(
                  eachdrug: eachdrug,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DrugInfoCard extends StatelessWidget {
  final Drug eachdrug;
  _DrugInfoCard({
    this.eachdrug,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 20, right: 10, top: 20, bottom: 0),
      color: Colors.grey[300],
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TitleCard(title: "Brand Name"),
                InfoCard(
                  info: eachdrug.brandName,
                  fontFamily: "Karla",
                  color: Colors.black,
                  fontsize: 18.0,
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TitleCard(title: "Generic Name"),
                InfoCard(
                  info: eachdrug.genericName,
                  fontFamily: "Alex",
                  color: Colors.red[700],
                  fontsize: 23.0,
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TitleCard(title: "Dose"),
                InfoCard(
                  info: eachdrug.dose,
                  fontFamily: "Karla",
                  color: Colors.black,
                  fontsize: 18.0,
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TitleCard(title: "Summary"),
                InfoCard(
                  info: eachdrug.summary,
                  fontFamily: "Karla",
                  color: Colors.black,
                  fontsize: 16.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TitleCard extends StatelessWidget {
  final String title;

  const TitleCard({
    this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        "$title:  ",
        style: Theme.of(context).textTheme.body2.copyWith(
            fontSize: 18, fontWeight: FontWeight.w500, color: Colors.blue[900]),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String info;
  final String fontFamily;
  final Color color;
  final double fontsize;
  const InfoCard({
    this.info,
    this.fontFamily,
    this.color,
    this.fontsize,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Text(
          info,
          style: TextStyle(
              fontSize: fontsize, color: color, fontFamily: fontFamily),
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

class _BuildDrugQuery extends StatelessWidget {
  final Drug eachdrug;
  _BuildDrugQuery({
    this.eachdrug,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
          right: 0.03 * width, left: 0.03 * width, bottom: 0.01 * height),
      child: Container(
        child: ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: eachdrug.sections.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return QueryCard(
              sectionInfo: eachdrug.sections[index],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 25,
              color: Colors.red[700],
            );
          },
        ),
      ),
    );
  }
}
