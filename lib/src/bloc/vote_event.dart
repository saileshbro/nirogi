import 'package:meta/meta.dart';

abstract class VoteEvent {}

class PostUpvoteEvent extends VoteEvent {
  final int postId;
  PostUpvoteEvent({@required this.postId}) : assert(postId != null);
}

class PostDownVoteEvent extends VoteEvent {
  final int postId;
  PostDownVoteEvent({@required this.postId}) : assert(postId != null);
}

class CommentUpvoteEvent extends VoteEvent {
  final int commentId;
  final int postId;
  CommentUpvoteEvent({@required this.postId, @required this.commentId})
      : assert(postId != null),
        assert(commentId != null);
}

class CommentDownVoteEvent extends VoteEvent {
  final int commentId;
  final int postId;
  CommentDownVoteEvent({@required this.postId, @required this.commentId})
      : assert(postId != null),
        assert(commentId != null);
}
