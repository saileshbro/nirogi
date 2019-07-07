import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nirogi/src/bloc/blocs.dart';
import 'package:nirogi/src/bloc/getposts_event.dart';
import 'package:nirogi/src/bloc/states.dart';
import 'package:nirogi/src/constants/env.dart';
import 'package:nirogi/src/widgets/widgets.dart';

class ViewProfile extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String address;
  final int userId;
  const ViewProfile({
    @required this.address,
    @required this.name,
    @required this.imageUrl,
    @required this.userId,
  });
  @override
  _ViewProfileState createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  final GetPostsBloc getPostsBloc = GetPostsBloc();
  @override
  void initState() {
    super.initState();
    getPostsBloc.dispatch(GetUsersPostsEvent(userId: widget.userId));
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
            Text('ViewProfile', style: Theme.of(context).textTheme.headline),
            SizedBox(
              width: 0.02 * width,
            ),
            Image.asset(
              'assets/images/icons/profile.png',
              width: 0.075 * width,
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Column(
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
                          child: FadeInImage.assetNetwork(
                            image: '$baseUrl/${widget.imageUrl}',
                            placeholder: "assets/gifs/loading.gif",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  widget.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .body2
                                      .copyWith(
                                          color: Colors.red[700], fontSize: 20),
                                ),
                                Text(
                                  widget.address,
                                  style: Theme.of(context)
                                      .textTheme
                                      .body2
                                      .copyWith(fontSize: 15),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
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
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                            child: Text("No posts found"),
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
                        return Container(
                          child: Center(
                            child: Text("error"),
                          ),
                        );
                      }
                      final stateAsPostsFetchedState =
                          state as PostsFetchedState;
                      final posts = stateAsPostsFetchedState.posts;
                      return RefreshIndicator(
                        onRefresh: () {
                          getPostsBloc.dispatch(
                              GetUsersPostsEvent(userId: widget.userId));
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
                          separatorBuilder: (BuildContext context, int index) {
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
