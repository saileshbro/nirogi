import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nirogi/src/bloc/blocs.dart';
import 'package:nirogi/src/bloc/events.dart';
import 'package:nirogi/src/bloc/states.dart';
import 'package:nirogi/src/constants/env.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:nirogi/src/repository/repositories.dart';
import 'package:nirogi/src/screens/screens.dart';
import 'package:nirogi/src/widgets/widgets.dart';

class CommentCard extends StatefulWidget {
  final Comment comment;
  final bool canModifyPost;
  const CommentCard({
    @required this.comment,
    @required this.canModifyPost,
    Key key,
  }) : super(key: key);

  @override
  _CommentCardState createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  VoteBloc voteBloc;
  @override
  void initState() {
    super.initState();
    voteBloc = VoteBloc();
  }

  void _showDeleteCommentModal() {
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
            'Do you really want to delete this comment?',
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
                postRepository.deleteComment(
                    commentId: widget.comment.commentId,
                    postId: widget.comment.postid);
                Navigator.of(context).pop();
                setState(() {
                  getAllCommentsBloc.dispatch(GetAllCommentsEvent(
                      sort: 'time', postId: widget.comment.postid));
                });
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

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(bottom: 0.01 * height),
      padding: EdgeInsets.only(top: 0.01 * height),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              votingButtons(width, context),
              SizedBox(
                width: 0.03 * width,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    widget.comment.comment,
                    style: Theme.of(context).textTheme.body2.copyWith(
                          fontSize: 16,
                        ),
                    textAlign: TextAlign.justify,
                  ),
                  widget.comment.canModifyComment == true ||
                          widget.canModifyPost == true
                      ? PopupMenuButton<ForumChoice>(
                          onSelected: (ForumChoice choice) {
                            _showDeleteCommentModal();
                          },
                          itemBuilder: (BuildContext context) {
                            return deletechoice.map((ForumChoice deletechoice) {
                              return PopupMenuItem<ForumChoice>(
                                child: ForumChoiceCard(
                                  choice: deletechoice,
                                ),
                                value: deletechoice,
                              );
                            }).toList();
                          },
                        )
                      : SizedBox(),
                ],
              ))
            ],
          ),
          SizedBox(
            height: 0.02 * width,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return ViewProfile(
                  address: widget.comment.address,
                  imageUrl: widget.comment.imageUrl,
                  name: widget.comment.name,
                  userId: widget.comment.userId,
                );
              }));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.comment.name,
                      style: Theme.of(context).textTheme.body2.copyWith(
                            fontSize: 16,
                            color: Colors.red[700],
                          ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: <Widget>[
                        Image.asset('assets/images/icons/recent.png',
                            height: 15),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.comment.createdAt.toString(),
                          style: Theme.of(context).textTheme.body2.copyWith(
                                fontSize: 15,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 0.02 * width,
                ),
                Container(
                  height: 40,
                  width: 0.09 * width,
                  decoration: BoxDecoration(
                    color: Colors.red[50],
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        '$baseUrl/${widget.comment.imageUrl}',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget votingButtons(double width, BuildContext context) {
    return BlocListener(
      bloc: voteBloc,
      listener: (BuildContext context, state) {
        if (state is UpvotedState || state is DownVotedState) {
          widget.comment.voteStatus = state.voteStatus;
          widget.comment.voteCount = state.voteCount;
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
                  onTap: widget.comment.voteStatus == 1
                      ? null
                      : () {
                          print("hhe");
                          voteBloc.dispatch(CommentUpvoteEvent(
                              postId: widget.comment.postid,
                              commentId: widget.comment.commentId));
                        },
                  child: Image.asset(
                    'assets/images/icons/upArrow.png',
                    width: 0.06 * width,
                    color: widget.comment.voteStatus == 1
                        ? Colors.red[700]
                        : Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 0.02 * width,
                ),
                Text(
                  widget.comment.voteCount.toString(),
                  style: Theme.of(context).textTheme.body2.copyWith(
                        fontSize: 18,
                      ),
                ),
                SizedBox(
                  height: 0.02 * width,
                ),
                GestureDetector(
                  onTap: widget.comment.voteStatus == -1
                      ? null
                      : () {
                          print("hhe");
                          voteBloc.dispatch(CommentDownVoteEvent(
                              postId: widget.comment.postid,
                              commentId: widget.comment.commentId));
                        },
                  child: Image.asset(
                    'assets/images/icons/downArrow.png',
                    width: 0.06 * width,
                    color: widget.comment.voteStatus == -1
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
                  widget.comment.voteCount.toString(),
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
                  onTap: widget.comment.voteStatus == 1
                      ? null
                      : () {
                          print("hhe");
                          voteBloc.dispatch(CommentUpvoteEvent(
                              commentId: widget.comment.commentId,
                              postId: widget.comment.postid));
                        },
                  child: Image.asset(
                    'assets/images/icons/upArrow.png',
                    width: 0.06 * width,
                    color: widget.comment.voteStatus == 1
                        ? Colors.red[700]
                        : Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 0.02 * width,
                ),
                Text(
                  widget.comment.voteCount.toString(),
                  style: Theme.of(context).textTheme.body2.copyWith(
                        fontSize: 18,
                      ),
                ),
                SizedBox(
                  height: 0.02 * width,
                ),
                GestureDetector(
                  onTap: widget.comment.voteStatus == -1
                      ? null
                      : () {
                          print("hhe");
                          voteBloc.dispatch(CommentDownVoteEvent(
                            commentId: widget.comment.commentId,
                            postId: widget.comment.postid,
                          ));
                        },
                  child: Image.asset(
                    'assets/images/icons/downArrow.png',
                    width: 0.06 * width,
                    color: widget.comment.voteStatus == -1
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
}
