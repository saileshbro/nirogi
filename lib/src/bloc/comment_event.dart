import 'package:meta/meta.dart';
import 'package:nirogi/src/models/models.dart';

abstract class CommentEvent {}

class CreateNewCommentevent extends CommentEvent {
  final int postId;
  final Comment comment;
  CreateNewCommentevent({@required this.postId, @required this.comment})
      : assert(comment != null),
        assert(postId != null);
}

class EditCommentEvent extends CommentEvent {
  final int commentId;
  final Comment comment;
  final int postId;
  EditCommentEvent(
      {@required this.postId, @required this.commentId, @required this.comment})
      : assert(comment != null),
        assert(postId != null),
        assert(commentId != null);
}

class DeleteCommentEvent extends CommentEvent {
  final int commentId;
  final int postId;
  DeleteCommentEvent({@required this.postId, @required this.commentId})
      : assert(commentId != null),
        assert(postId != null);
}
