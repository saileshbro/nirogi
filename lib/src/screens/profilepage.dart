import 'package:flutter/material.dart';
import 'package:nirogi/src/models/posts.dart';
import 'package:nirogi/src/widgets/drawer.dart';
import 'package:nirogi/src/widgets/post_block.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffffdde1).withOpacity(0.95),
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
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 155,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xffffdde1).withOpacity(0.8),
                          Color(0xffFFEFBA).withOpacity(0.8),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
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
                                      left: 5.0,
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
                                    left: 80,
                                    child: FlatButton(
                                      color: Colors.white,
                                      shape: CircleBorder(),
                                      onPressed: () {},
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          'assets/images/icons/pen.png',
                                          height: 20,
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
                                    height: 35,
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
                                  Text(
                                    'Your Posts :',
                                    style: Theme.of(context)
                                        .textTheme
                                        .body1
                                        .copyWith(fontSize: 20),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Positioned(
                            top: 1,
                            right: 10,
                            child: FloatingActionButton(
                              backgroundColor: Colors.white,
                              onPressed: () {},
                              child: Image.asset(
                                'assets/images/icons/notification.png',
                                width: 30,
                                height: 30,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
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
          Positioned(
            top: 120,
            right: 10,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  'assets/images/icons/createpost.png',
                  height: 100,
                  width: 100,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
