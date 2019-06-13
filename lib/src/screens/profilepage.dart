import 'package:flutter/material.dart';
import 'package:nirogi/src/models/popupchoice.dart';
import 'package:nirogi/src/models/posts.dart';
import 'package:nirogi/src/widgets/choice_card.dart';
import 'package:nirogi/src/widgets/drawer.dart';
import 'package:nirogi/src/widgets/post_block.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Choice _selectedChoice = choice[0];

  void _select(Choice choice) {
    setState(() {
      _selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 25),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color(0xff5B86E5),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(
              'assets/images/icons/news.png',
            ),
          ),
        ),
      ),
      drawer: AppDrawer(),
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Profile', style: Theme.of(context).textTheme.headline),
            SizedBox(
              width: 14,
            ),
            Image.asset(
              'assets/images/icons/profile.png',
              width: 30,
            ),
          ],
        ),
        actions: <Widget>[
          PopupMenuButton<Choice>(
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return choice.map((Choice choice) {
                return PopupMenuItem<Choice>(
                  child: ChoiceCard(
                    choice: choice,
                  ),
                  value: choice,
                );
              }).toList();
            },
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10.0,
                                      right: 15,
                                      top: 10,
                                    ),
                                    child: Container(
                                      height: 140,
                                      width: 140,
                                      child: Image.asset(
                                        'assets/images/icons/profile.png',
                                      ),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 100,
                                    left: 100,
                                    child: Container(
                                      height: 40,
                                      child: FloatingActionButton(
                                        backgroundColor:
                                            Color(0xff5B86E5).withOpacity(0.8),
                                        onPressed: () {},
                                        child: Image.asset(
                                          'assets/images/icons/edit.png',
                                          height: 25,
                                          width: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 45,
                                  ),
                                  Text(
                                    'Sarayu Gautam',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline
                                        .copyWith(color: Colors.red[700]),
                                  ),
                                  Text(
                                    'Naikap, Kathmandu',
                                    style: Theme.of(context)
                                        .textTheme
                                        .body2
                                        .copyWith(fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 35,
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        'Your Posts',
                                        style: Theme.of(context)
                                            .textTheme
                                            .body1
                                            .copyWith(fontSize: 20),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            height: 1.0,
                                            color: Colors.red,
                                            width: 50,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            height: 10,
                                            width: 10,
                                            child: Image.asset(
                                                'assets/images/icons/blood-drop.png'),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            height: 1.0,
                                            width: 70,
                                            color: Colors.red,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Positioned(
                            top: 1,
                            right: 10,
                            child: Container(
                              height: 40,
                              child: FloatingActionButton(
                                backgroundColor:
                                    Color(0xff5B86E5).withOpacity(0.8),
                                onPressed: () {},
                                child: Image.asset(
                                  'assets/images/icons/notification.png',
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: allPosts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return PostBlock(
                        post: allPosts[index],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 15,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
