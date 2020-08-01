import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nirogi/src/bloc/blocs.dart';
import 'package:nirogi/src/bloc/events.dart';
import 'package:nirogi/src/bloc/states.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:nirogi/src/screens/screens.dart';
import 'package:nirogi/src/widgets/widgets.dart';

class ForumPage extends StatefulWidget {
  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  GetPostsBloc getPostsBloc = GetPostsBloc();
  String sort = 'popular';
  @override
  void initState() {
    super.initState();
    getPostsBloc.add(GetAllPostsEvent(sort: sort));
  }

  @override
  void dispose() {
    super.dispose();
    getPostsBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 0.033 * height),
        child: FloatingActionButton(
          heroTag: 'createPost',
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreatePost(),
              ),
            );
            getPostsBloc.add(GetAllPostsEvent(sort: sort));
          },
          backgroundColor: Theme.of(context).canvasColor,
          child: PlusFloatingIcon(),
        ),
      ),
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Health Forum', style: Theme.of(context).textTheme.headline),
            SizedBox(
              width: 0.03 * width,
            ),
            Image.asset(
              'assets/images/icons/forum.png',
              width: 0.09 * width,
            ),
          ],
        ),
        actions: <Widget>[
          PopupMenuButton<ForumChoice>(
            initialValue: sort == "popular" ? forumChoice[0] : forumChoice[1],
            onSelected: (ForumChoice choice) {
              if (choice.sort != sort) {
                setState(() {
                  sort = choice.sort;
                });
                getPostsBloc.add(GetAllPostsEvent(sort: sort));
              }
            },
            itemBuilder: (BuildContext context) {
              return forumChoice.map((ForumChoice forumChoice) {
                return PopupMenuItem<ForumChoice>(
                  child: ForumChoiceCard(
                    choice: forumChoice,
                  ),
                  value: forumChoice,
                );
              }).toList();
            },
          )
        ],
      ),
      body: BlocBuilder(
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
                  style: Theme.of(context).textTheme.body1.copyWith(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  Text("Network Error.")
                ],
              ),
            );
          }
          final stateAsPostsFetchedState = state as PostsFetchedState;
          final posts = stateAsPostsFetchedState.posts;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _BuildPostsList(
                posts: posts,
                sort: sort,
                getPostsBloc: getPostsBloc,
              ),
            ],
          );
        },
      ),
    );
  }
}

class _BuildPostsList extends StatefulWidget {
  final List<Post> posts;
  final String sort;
  final GetPostsBloc getPostsBloc;
  _BuildPostsList(
      {@required this.posts, @required this.sort, @required this.getPostsBloc});

  @override
  __BuildPostsListState createState() => __BuildPostsListState();
}

class __BuildPostsListState extends State<_BuildPostsList> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            top: 0.01 * height,
            right: 0.02 * width,
            left: 0.04 * width,
            bottom: 0.01 * height),
        child: RefreshIndicator(
          onRefresh: () async {
            widget.getPostsBloc.add(GetAllPostsEvent(sort: widget.sort));
          },
          child: ListView.separated(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: widget.posts.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return ForumBlock(
                post: widget.posts[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: Colors.grey,
                height: 0.015 * height,
              );
            },
          ),
        ),
      ),
    );
  }
}
