import 'package:flutter/material.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:nirogi/src/repository/repositories.dart';
import 'package:nirogi/src/widgets/widgets.dart';

import 'createPost.dart';

class ViewProfile extends StatefulWidget {
  final int userId;
  const ViewProfile({
    @required this.userId,
  });
  @override
  _ViewProfileState createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  Future<List<Post>> myPosts;
  @override
  void initState() {
    super.initState();
    myPosts = postRepository.getAllMyPosts();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Profile', style: Theme.of(context).textTheme.headline),
            SizedBox(
              width: 0.02 * width,
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                              left: 0.025 * width,
                              right: 0.036 * width,
                            ),
                            child: Container(
                              height: 0.16 * height,
                              width: 0.25 * width,
                              child: Image.asset(
                                'assets/images/icons/profile.png',
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          'Sarayu Gautam',
                                          style: Theme.of(context)
                                              .textTheme
                                              .body2
                                              .copyWith(
                                                  color: Colors.red[700],
                                                  fontSize: 20),
                                        ),
                                        Text(
                                          'Naikap, Kathmandu',
                                          style: Theme.of(context)
                                              .textTheme
                                              .body2
                                              .copyWith(fontSize: 15),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: OutlineButton(
                                          borderSide: BorderSide(
                                            color: Colors.blue,
                                          ),
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, '/editprofile');
                                          },
                                          child: Text(
                                            'Edit Profile',
                                            style: Theme.of(context)
                                                .textTheme
                                                .body2
                                                .copyWith(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                          )),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Image.asset(
                                          'assets/images/icons/post.png',
                                          width: 0.075 * width,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Posts',
                                          style: Theme.of(context)
                                              .textTheme
                                              .body1
                                              .copyWith(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          height: 1.0,
                                          color: Colors.red,
                                          width: 0.115 * width,
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
                                          width: 0.13 * width,
                                          color: Colors.red,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: FutureBuilder(
                    future: myPosts,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return ListView.separated(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return PostBlock(
                              post: snapshot.data[index],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 0.02 * height,
                            );
                          },
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
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
