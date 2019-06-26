import 'package:flutter/material.dart';
import 'package:nirogi/src/models/popupchoice.dart';
import 'package:nirogi/src/models/posts.dart';
import 'package:nirogi/src/widgets/choice_card.dart';
import 'package:nirogi/src/widgets/plus_floating_icon.dart';
import 'package:nirogi/src/widgets/post_block.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 0.033 * height),
        child: FloatingActionButton(
          heroTag: 'createPost',
          onPressed: () {},
          backgroundColor: Colors.white,
          child: PlusFloatingIcon(),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Profile', style: Theme.of(context).textTheme.headline),
            SizedBox(
              width: 0.035 * width,
            ),
            Image.asset(
              'assets/images/icons/profile.png',
              width: 0.075 * width,
            ),
          ],
        ),
        actions: <Widget>[
          PopupMenuButton<Choice>(
            onSelected: (Choice choice) {
              Navigator.of(context).pushNamed('/changepw');
            },
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
                                    padding: EdgeInsets.only(
                                      left: 0.025 * width,
                                      right: 0.036 * width,
                                      top: 0.013 * height,
                                    ),
                                    child: Container(
                                      height: 0.189 * height,
                                      width: 0.35 * width,
                                      child: Image.asset(
                                        'assets/images/icons/profile.png',
                                      ),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0.135 * height,
                                    left: 0.255 * width,
                                    child: Container(
                                      height: 0.054 * height,
                                      child: FloatingActionButton(
                                        heroTag: "editProfile",
                                        backgroundColor:
                                            Color(0xff5B86E5).withOpacity(0.8),
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/editprofile');
                                        },
                                        child: Image.asset(
                                          'assets/images/icons/edit.png',
                                          height: 0.033 * height,
                                          width: 0.07 * width,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 0.06 * height,
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
                                            width: 0.127 * width,
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
                                            width: 0.178 * width,
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
                          // Positioned(
                          //   top: 1,
                          //   right: 10,
                          //   child: Container(
                          //     height: 0.05 * height,
                          //     child: FloatingActionButton(
                          //       heroTag: "notification",
                          //       backgroundColor:
                          //           Color(0xff5B86E5).withOpacity(0.8),
                          //       onPressed: () {},
                          //       child: Image.asset(
                          //         'assets/images/icons/notification.png',
                          //         width: 0.07 * width,
                          //         height: 0.04 * height,
                          //       ),
                          //     ),
                          //   ),
                          // )
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
                        height: 0.02 * height,
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
