import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nirogi/src/bloc/blocs.dart';
import 'package:nirogi/src/bloc/events.dart';
import 'package:nirogi/src/bloc/getcomments_event.dart';
import 'package:nirogi/src/bloc/states.dart';
import 'package:nirogi/src/constants/env.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:nirogi/src/repository/repositories.dart';
import 'package:nirogi/src/screens/screens.dart';
import 'package:nirogi/src/themes/scrollOverlay.dart';
import 'package:nirogi/src/widgets/widgets.dart';

class EachPost extends StatefulWidget {
  final Post post;
  const EachPost({
    @required this.post,
    Key key,
  }) : super(key: key);

  @override
  _EachPostState createState() => _EachPostState();
}

class _EachPostState extends State<EachPost> {
  void _showDeletePostModal() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(5),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              'Delete?',
              style: Theme.of(context)
                  .textTheme
                  .body1
                  .copyWith(fontSize: 16, color: Colors.red[700]),
              textAlign: TextAlign.center,
            ),
          ),
          content: Text(
            'Do you really want to delete this post?',
            style: Theme.of(context).textTheme.body2.copyWith(fontSize: 14),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            FlatButton(
              color: Colors.transparent,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: Theme.of(context).textTheme.body2.copyWith(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
              ),
            ),
            FlatButton(
              color: Colors.transparent,
              onPressed: () {
                postRepository.deletePost(postId: widget.post.postId);
                Navigator.popUntil(context, ModalRoute.withName('/forum'));
                setState(() {
                  getPostsBloc.dispatch(GetAllPostsEvent(sort: 'popular'));
                });
                print('delete');
              },
              child: Text(
                'Delete',
                style: Theme.of(context).textTheme.body2.copyWith(
                      fontSize: 16,
                      color: Colors.red[700],
                    ),
              ),
            ),
          ],
        );
      },
    );
  }

  TextEditingController _controller = TextEditingController();
  bool isButtonClicked = false;
  DropDownChoice dropdownValue = const DropDownChoice(
    title: 'votes',
    icon: 'assets/images/icons/upvote.png',
  );

  @override
  void initState() {
    super.initState();
    getAllCommentsBloc.dispatch(GetAllCommentsEvent(
        postId: widget.post.postId, sort: dropdownValue.title));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return WillPopScope(
      child: Scaffold(
        bottomNavigationBar: isButtonClicked
            ? Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                  color: Colors.grey.withOpacity(0.05),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(
                      0.035 * width, 0.005 * height, 0, 0.005 * height),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage('assets/images/icons/imageUrl.png'),
                      ),
                      SizedBox(width: 0.04 * width),
                      Flexible(
                        child: TextField(
                          controller: _controller,
                          style: Theme.of(context).textTheme.body2.copyWith(
                                fontSize: 16,
                              ),
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: "Enter your comment here",
                            border: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                          keyboardType: TextInputType.multiline,
                        ),
                      ),
                      SizedBox(width: 0.005 * width),
                      IconButton(
                        padding: EdgeInsets.all(0),
                        icon: Icon(Icons.send),
                        color: Colors.red[700],
                        onPressed: () {
                          print(_controller.text);
                        },
                      )
                    ],
                  ),
                ),
              )
            : Container(
                height: 0,
                width: 0,
              ),
        floatingActionButton: !isButtonClicked
            ? FloatingActionButton(
                heroTag: 'Add Comment',
                tooltip: 'Add Comment',
                onPressed: () {
                  setState(() {
                    isButtonClicked = !isButtonClicked;
                  });
                },
                backgroundColor: Colors.white,
                child: PlusFloatingIcon(),
              )
            : Container(
                height: 0.0,
                width: 0.0,
              ),
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Post', style: Theme.of(context).textTheme.headline),
              SizedBox(
                width: 0.03 * width,
              ),
              Image.asset(
                'assets/images/icons/post.png',
                width: 0.07 * width,
              ),
            ],
          ),
        ),
        body: ScrollConfiguration(
          behavior: RemoveEndOfListIndicator(),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 0.01 * height),
                  padding: EdgeInsets.symmetric(horizontal: 0.03 * width),
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/images/icons/upArrow.png',
                                  width: 0.06 * width,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                height: 0.02 * width,
                              ),
                              Text(
                                widget.post.voteCount.toString(),
                                style:
                                    Theme.of(context).textTheme.body2.copyWith(
                                          fontSize: 18,
                                        ),
                              ),
                              SizedBox(
                                height: 0.02 * width,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/images/icons/downArrow.png',
                                  width: 0.06 * width,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 0.04 * width,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Flexible(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          widget.post.title,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .body1
                                              .copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ),
                                    ),
                                    PopupMenuButton<ForumChoice>(
                                      onSelected: (ForumChoice choice) {
                                        if (choice.title == 'Edit') {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(builder:
                                                  (BuildContext context) {
                                            return EditPost(post: widget.post);
                                          }));
                                        } else {
                                          _showDeletePostModal();
                                        }
                                      },
                                      itemBuilder: (BuildContext context) {
                                        return editchoice
                                            .map((ForumChoice editchoice) {
                                          return PopupMenuItem<ForumChoice>(
                                            child: ForumChoiceCard(
                                              choice: editchoice,
                                            ),
                                            value: editchoice,
                                          );
                                        }).toList();
                                      },
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    margin: EdgeInsets.only(top: 5),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.red[100],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      widget.post.category.category,
                                      style: Theme.of(context)
                                          .textTheme
                                          .body2
                                          .copyWith(
                                            fontSize: 12,
                                          ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 0.01 * height,
                                ),
                                Text(
                                  widget.post.body,
                                  style: Theme.of(context)
                                      .textTheme
                                      .body2
                                      .copyWith(
                                        fontSize: 15,
                                      ),
                                  textAlign: TextAlign.justify,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: <Widget>[
                                    Image.asset(
                                        'assets/images/icons/recent.png',
                                        height: 0.02 * height),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      widget.post.createdAt,
                                      style: Theme.of(context)
                                          .textTheme
                                          .body2
                                          .copyWith(
                                            fontSize: 16,
                                          ),
                                    ),
                                    SizedBox(
                                      width: 0.02 * width,
                                    ),
                                    Image.asset('assets/images/icons/eye.png',
                                        height: 0.02 * width),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      widget.post.views.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .body2
                                          .copyWith(
                                            fontSize: 16,
                                          ),
                                    ),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    Container(
                                      child: Text(
                                        widget.post.name.split(' ')[0].length >
                                                12
                                            ? widget.post.name
                                                .split(' ')[0]
                                                .substring(0, 12)
                                            : widget.post.name.split(' ')[0],
                                        style: Theme.of(context)
                                            .textTheme
                                            .body2
                                            .copyWith(
                                              fontSize: 16,
                                              color: Colors.red[700],
                                            ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      height: 0.08 * width,
                                      width: 0.12 * width,
                                      decoration: BoxDecoration(
                                        color: Colors.red[50],
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            "$baseUrl/${widget.post.imageUrl}",
                                          ),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  color: Colors.grey[300],
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: <Widget>[
                      Image.asset('assets/images/icons/comment.png',
                          height: 20),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.post.commentCount.toString(),
                        style: Theme.of(context).textTheme.body2.copyWith(
                              fontSize: 20,
                            ),
                      ),
                      Expanded(
                        child: Text(
                          'Comments',
                          style: Theme.of(context).textTheme.body2.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      DropdownButton<DropDownChoice>(
                        value: dropdownValue,
                        elevation: 0,
                        onChanged: (DropDownChoice choice) {
                          setState(() {
                            dropdownValue = choice;
                          });
                          getAllCommentsBloc.dispatch(GetAllCommentsEvent(
                              postId: widget.post.postId,
                              sort: dropdownValue.title));
                        },
                        items: <DropDownChoice>[
                          const DropDownChoice(
                            title: 'votes',
                            icon: 'assets/images/icons/upvote.png',
                          ),
                          const DropDownChoice(
                            title: 'time',
                            icon: 'assets/images/icons/recent.png',
                          ),
                        ].map<DropdownMenuItem<DropDownChoice>>(
                            (DropDownChoice value) {
                          return DropdownMenuItem<DropDownChoice>(
                            value: value,
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  value.icon,
                                  width: 0.04 * width,
                                ),
                                SizedBox(
                                  width: 0.02 * width,
                                ),
                                Text(value.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .body1
                                        .copyWith(fontSize: 14))
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                _BuildCommentsList(),
              ],
            ),
          ),
        ),
      ),
      onWillPop: _floatingPressed,
    );
  }

  Future<bool> _floatingPressed() async {
    if (isButtonClicked) {
      setState(() {
        isButtonClicked = !isButtonClicked;
      });
      return false;
    } else {
      return true;
    }
  }
}

class _BuildCommentsList extends StatelessWidget {
  const _BuildCommentsList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocBuilder(
      bloc: getAllCommentsBloc,
      builder: (BuildContext context, state) {
        if (state is CommentsUninitialisedState) {
          return Container(
            child: Center(
              child: Text('not loaded'),
            ),
          );
        } else if (state is CommentsEmptyState) {
          return Container(
            child: Center(
              child: Text("No posts found"),
            ),
          );
        } else if (state is CommentsFetchingState) {
          return Container(
            height: 40,
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is CommentsErrorState) {
          return Container(
            height: 40,
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
            child: Center(
              child: Text("error"),
            ),
          );
        }
        final stateAsCommentsFetchedState = state as CommentsFetchedState;
        final comments = stateAsCommentsFetchedState.comments;
        return Padding(
          padding: EdgeInsets.only(
              right: 0.02 * width,
              top: 0.01 * height,
              left: 0.04 * width,
              bottom: 0.01 * height),
          child: ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: comments.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return CommentCard(
                comment: comments[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: Colors.grey,
                height: 0.01 * height,
              );
            },
          ),
        );
      },
    );
  }
}
