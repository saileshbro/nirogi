import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nirogi/main.dart';
import 'package:nirogi/src/bloc/blocs.dart';
import 'package:nirogi/src/bloc/getposts_event.dart';
import 'package:nirogi/src/bloc/states.dart';
import 'package:nirogi/src/constants/env.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:nirogi/src/widgets/widgets.dart';
import 'createPost.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  GetPostsBloc getPostsBloc = GetPostsBloc();
  @override
  void initState() {
    super.initState();
    getPostsBloc.add(GetAllMyPostsEvent());
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return loggedinUser == null
        ? Scaffold(
            body: Column(
              children: <Widget>[
                Container(
                  width: 0.32 * MediaQuery.of(context).size.width,
                  height: 0.32 * MediaQuery.of(context).size.width,
                  child: FlareActor(
                    'assets/animations/nointernet.flr',
                    animation: 'init',
                    fit: BoxFit.cover,
                    shouldClip: false,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Please authenticate")
              ],
            ),
          )
        : Scaffold(
            floatingActionButton: Container(
              margin: EdgeInsets.only(bottom: 0.033 * height),
              child: FloatingActionButton(
                heroTag: 'createPost',
                onPressed: () {
                  getPostsBloc.close();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreatePost(),
                    ),
                  );
                },
                backgroundColor: Theme.of(context).canvasColor,
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
                                    width: 0.16 * height,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            "$baseUrl/${loggedinUser.imageUrl}",
                                          ),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.37,
                                                child: Text(
                                                  loggedinUser.name,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .body2
                                                      .copyWith(
                                                          color:
                                                              Colors.red[700],
                                                          fontSize: 20),
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Container(
                                                width: 120,
                                                child: Text(
                                                  loggedinUser.address ??
                                                      "JHAPA NEPAL",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .body2
                                                      .copyWith(
                                                        fontSize: 15,
                                                      ),
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                          OutlineButton(
                                            shape: CircleBorder(),
                                            borderSide: BorderSide(
                                              color: Colors.blue,
                                            ),
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, '/editprofile');
                                            },
                                            child: Icon(Icons.edit,
                                                color: Colors.blue),
                                          ),
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
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: BlocBuilder(
                          bloc: getPostsBloc,
                          builder: (BuildContext context, state) {
                            if (state is PostsUninitialisedState) {
                              return Container(
                                child: Center(
                                  child: Text('not loaded'),
                                ),
                              );
                            } else if (state is PostsEmptyState) {
                              return Container(
                                child: Center(
                                  child: Text(
                                    "No posts found",
                                    style: Theme.of(context)
                                        .textTheme
                                        .body1
                                        .copyWith(
                                          fontSize: 17,
                                          color: Colors.red,
                                        ),
                                  ),
                                ),
                              );
                            } else if (state is PostsFetchingState) {
                              return Container(
                                child: Center(
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.pink,
                                  ),
                                ),
                              );
                            } else if (state is PostsErrorState) {
                              return Center(
                                child: Container(
                                  width:
                                      0.32 * MediaQuery.of(context).size.width,
                                  height:
                                      0.32 * MediaQuery.of(context).size.width,
                                  child: FlareActor(
                                    'assets/animations/nointernet.flr',
                                    animation: 'init',
                                    fit: BoxFit.cover,
                                    shouldClip: false,
                                  ),
                                ),
                              );
                            }
                            final stateAsPostsFetchedState =
                                state as PostsFetchedState;
                            final posts = stateAsPostsFetchedState.posts;
                            return RefreshIndicator(
                              onRefresh: () async {
                                getPostsBloc.add(GetAllMyPostsEvent());
                              },
                              child: ListView.separated(
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemCount: posts.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return PostBlock(
                                    post: posts[index],
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    height: 0.02 * height,
                                  );
                                },
                              ),
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
