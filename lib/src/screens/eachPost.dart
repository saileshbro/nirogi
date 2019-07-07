import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nirogi/main.dart';
import 'package:nirogi/src/bloc/blocs.dart';
import 'package:nirogi/src/bloc/comment_state.dart';
import 'package:nirogi/src/bloc/events.dart';
import 'package:nirogi/src/bloc/getcomments_event.dart';
import 'package:nirogi/src/bloc/states.dart';
import 'package:nirogi/src/constants/env.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:nirogi/src/screens/screens.dart';
import 'package:nirogi/src/themes/scrollOverlay.dart';
import 'package:nirogi/src/widgets/widgets.dart';

class EachPost extends StatefulWidget {
  Post post;

  EachPost({
    @required this.post,
    Key key,
  }) : super(key: key);

  @override
  _EachPostState createState() => _EachPostState();
}

class _EachPostState extends State<EachPost> {
  VoteBloc voteBloc;
  GetPostsBloc getPostsBloc;
  PostBloc addPostBloc;
  CommentBloc commentBloc;
  Comment comment;
  @override
  void initState() {
    super.initState();
    comment = Comment();
    voteBloc = VoteBloc();
    getPostsBloc = GetPostsBloc();
    getAllCommentsBloc.dispatch(GetAllCommentsEvent(
        postId: widget.post.postId, sort: dropdownValue.title));
    addPostBloc = PostBloc();
  }

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
                addPostBloc
                    .dispatch(DeletePostEvent(postId: widget.post.postId));
                Navigator.pop(context);
                getPostsBloc.dispatch(GetAllPostsEvent(sort: 'popular'));
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

  GlobalKey<FormFieldState> _textFieldKey = GlobalKey<FormFieldState>();
  bool isButtonClicked = false;
  DropDownChoice dropdownValue = const DropDownChoice(
    title: 'votes',
    icon: 'assets/images/icons/upvote.png',
  );
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
                            NetworkImage("$baseUrl/${loggedinUser.imageUrl}"),
                      ),
                      SizedBox(width: 0.04 * width),
                      Flexible(
                        child: TextFormField(
                          key: _textFieldKey,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Cannot create a empty comment";
                            }
                            return null;
                          },
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
                        onPressed: () async {
                          if (_textFieldKey.currentState.validate()) {
                            comment.comment = _textFieldKey.currentState.value;
                            commentBloc.dispatch(CreateNewCommentevent(
                              comment: comment,
                              postId: widget.post.postId,
                            ));
                            getAllCommentsBloc.dispatch(GetAllCommentsEvent(
                                postId: widget.post.postId,
                                sort: dropdownValue.title));
                          }
                        },
                      ),
                      BlocBuilder(
                        bloc: commentBloc,
                        builder: (BuildContext context, state) {
                          if (state is CommentUninitiatedState) {
                            return SizedBox();
                          } else if (state is CommentSendingState) {
                            return SizedBox();
                          } else if (state is CommentSucessState) {
                            Fluttertoast.showToast(
                                msg: state.message,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIos: 1,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            return SizedBox();
                          } else {
                            var errorstate = state as CommentErrorState;
                            Fluttertoast.showToast(
                                msg: errorstate.error,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIos: 1,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            return SizedBox();
                          }
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
                  commentBloc = new CommentBloc();
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
                          votingButtons(width, context),
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
                                        padding: EdgeInsets.only(top: 5.0),
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
                                    widget.post.canModifyPost == true
                                        ? PopupMenuButton<ForumChoice>(
                                            onSelected: (ForumChoice choice) {
                                              if (choice.title == 'Edit') {
                                                Fluttertoast.cancel();

                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder:
                                                        (BuildContext context) {
                                                      return EditPost(
                                                          post: widget.post);
                                                    },
                                                  ),
                                                ).then((editedPost) {
                                                  setState(() {
                                                    widget.post = editedPost;
                                                  });
                                                });
                                              } else {
                                                _showDeletePostModal();
                                              }
                                            },
                                            itemBuilder:
                                                (BuildContext context) {
                                              return editchoice.map(
                                                  (ForumChoice editchoice) {
                                                return PopupMenuItem<
                                                    ForumChoice>(
                                                  child: ForumChoiceCard(
                                                    choice: editchoice,
                                                  ),
                                                  value: editchoice,
                                                );
                                              }).toList();
                                            },
                                          )
                                        : SizedBox(),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) {
                                      return CategoryForumPage(
                                        category: widget.post.category,
                                      );
                                    }));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey[300],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      widget.post.category.category,
                                      style: Theme.of(context)
                                          .textTheme
                                          .body2
                                          .copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
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
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder:
                                                (BuildContext context) {
                                          return ViewProfile(
                                            address: widget.post.address,
                                            imageUrl: widget.post.imageUrl,
                                            name: widget.post.name,
                                            userId: widget.post.userId,
                                          );
                                        }));
                                      },
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            child: Text(
                                              widget.post.name
                                                          .split(' ')[0]
                                                          .length >
                                                      12
                                                  ? widget.post.name
                                                      .split(' ')[0]
                                                      .substring(0, 12)
                                                  : widget.post.name
                                                      .split(' ')[0],
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
                                            height: 0.1 * width,
                                            width: 0.1 * width,
                                            decoration: BoxDecoration(
                                              color: Colors.red[50],
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  "$baseUrl/${widget.post.imageUrl}",
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      BlocListener(
                        child: SizedBox(),
                        bloc: addPostBloc,
                        listener: (BuildContext context, state) {
                          if (state is AddPostUninitiatedState) {
                            return SizedBox();
                          } else if (state is AddPostSendingState) {
                            return Container(
                              child: Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.pink,
                                ),
                              ),
                            );
                          } else if (state is AddPostSucessState) {
                            Fluttertoast.showToast(
                                msg: state.message,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIos: 1,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                fontSize: 16.0);

                            return SizedBox();
                          } else {
                            var errorstate = state as AddPostErrorState;
                            Fluttertoast.showToast(
                                msg: errorstate.error,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIos: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);

                            return SizedBox();
                          }
                        },
                      )
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
                _BuildCommentsList(
                  canModifyPost: widget.post.canModifyPost,
                ),
              ],
            ),
          ),
        ),
      ),
      onWillPop: _floatingPressed,
    );
  }

  Widget votingButtons(double width, BuildContext context) {
    return BlocListener(
      bloc: voteBloc,
      listener: (BuildContext context, state) {
        if (state is UpvotedState || state is DownVotedState) {
          widget.post.voteStatus = state.voteStatus;
          widget.post.voteCount = state.voteCount;
        }
      },
      child: BlocBuilder(
        bloc: voteBloc,
        builder: (BuildContext context, state) {
          if (state is VoteUninitialisedState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: widget.post.voteStatus == 1
                      ? null
                      : () {
                          voteBloc.dispatch(
                              PostUpvoteEvent(postId: widget.post.postId));
                        },
                  child: Image.asset(
                    'assets/images/icons/upArrow.png',
                    width: 0.06 * width,
                    color: widget.post.voteStatus == 1
                        ? Colors.red[700]
                        : Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 0.02 * width,
                ),
                Text(
                  widget.post.voteCount.toString(),
                  style: Theme.of(context).textTheme.body2.copyWith(
                        fontSize: 18,
                      ),
                ),
                SizedBox(
                  height: 0.02 * width,
                ),
                GestureDetector(
                  onTap: widget.post.voteStatus == -1
                      ? null
                      : () {
                          voteBloc.dispatch(
                              PostDownVoteEvent(postId: widget.post.postId));
                        },
                  child: Image.asset(
                    'assets/images/icons/downArrow.png',
                    width: 0.06 * width,
                    color: widget.post.voteStatus == -1
                        ? Colors.red[700]
                        : Colors.grey,
                  ),
                ),
              ],
            );
          } else if (state is UpVoteSendingState ||
              state is DownVoteSendingState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: null,
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
                  style: Theme.of(context).textTheme.body2.copyWith(
                        fontSize: 18,
                      ),
                ),
                SizedBox(
                  height: 0.02 * width,
                ),
                GestureDetector(
                  onTap: null,
                  child: Image.asset(
                    'assets/images/icons/downArrow.png',
                    width: 0.06 * width,
                    color: Colors.grey,
                  ),
                ),
              ],
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: widget.post.voteStatus == 1
                      ? null
                      : () {
                          voteBloc.dispatch(
                              PostUpvoteEvent(postId: widget.post.postId));
                        },
                  child: Image.asset(
                    'assets/images/icons/upArrow.png',
                    width: 0.06 * width,
                    color: widget.post.voteStatus == 1
                        ? Colors.red[700]
                        : Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 0.02 * width,
                ),
                Text(
                  widget.post.voteCount.toString(),
                  style: Theme.of(context).textTheme.body2.copyWith(
                        fontSize: 18,
                      ),
                ),
                SizedBox(
                  height: 0.02 * width,
                ),
                GestureDetector(
                  onTap: widget.post.voteStatus == -1
                      ? null
                      : () {
                          voteBloc.dispatch(
                              PostDownVoteEvent(postId: widget.post.postId));
                        },
                  child: Image.asset(
                    'assets/images/icons/downArrow.png',
                    width: 0.06 * width,
                    color: widget.post.voteStatus == -1
                        ? Colors.red[700]
                        : Colors.grey,
                  ),
                ),
              ],
            );
          }
        },
      ),
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
  final bool canModifyPost;
  _BuildCommentsList({
    @required this.canModifyPost,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("No posts found"),
              ],
            ),
          );
        } else if (state is CommentsFetchingState) {
          return Container(
            height: 40,
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.pink,
              ),
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
                canModifyPost: canModifyPost,
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
