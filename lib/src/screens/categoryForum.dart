import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nirogi/src/bloc/blocs.dart';
import 'package:nirogi/src/bloc/events.dart';
import 'package:nirogi/src/bloc/states.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:nirogi/src/screens/screens.dart';
import 'package:nirogi/src/widgets/widgets.dart';

class CategoryForumPage extends StatefulWidget {
  final Category category;

  const CategoryForumPage({Key key, @required this.category}) : super(key: key);
  @override
  _CategoryForumPageState createState() => _CategoryForumPageState();
}

class _CategoryForumPageState extends State<CategoryForumPage> {
  GetPostsBloc getPostsBloc = GetPostsBloc();
  @override
  void initState() {
    super.initState();
    getPostsBloc.add(GetCategoryPostsEvent(
      categoryId: widget.category.categoryId,
    ));
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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreatePost(
                  categoryKey: widget.category.categoryId,
                ),
              ),
            );
          },
          backgroundColor: Colors.white,
          child: PlusFloatingIcon(),
        ),
      ),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Categorized Posts',
                style: Theme.of(context).textTheme.body1.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    )),
            SizedBox(
              width: 0.03 * width,
            ),
            Image.asset(
              'assets/images/icons/forum.png',
              width: 0.09 * width,
            ),
          ],
        ),
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
            return Column(
              children: <Widget>[
                Container(
                  width: 0.32 * MediaQuery.of(context).size.width,
                  height: 0.32 * MediaQuery.of(context).size.width,
                  child: FlareActor(
                    'assets/animations/error.flr',
                    animation: 'go',
                    fit: BoxFit.cover,
                    shouldClip: false,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Network Error.")
              ],
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
                child: Text("ERROR"),
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
                categoryId: widget.category.categoryId,
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
  final GetPostsBloc getPostsBloc;
  final List<Post> posts;
  final int categoryId;
  _BuildPostsList(
      {@required this.posts,
      @required this.categoryId,
      @required this.getPostsBloc});

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
            widget.getPostsBloc
                .add(GetCategoryPostsEvent(categoryId: widget.categoryId));
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
