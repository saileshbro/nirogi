import 'package:meta/meta.dart';
import 'package:nirogi/src/models/models.dart';

abstract class GetCommentsState {}

class CommentsUninitialisedState extends GetCommentsState {}

class CommentsFetchingState extends GetCommentsState {}

class CommentsFetchedState extends GetCommentsState {
  final List<Comment> comments;
  CommentsFetchedState({@required this.comments}) : assert(comments != null);
}

class CommentsErrorState extends GetCommentsState {}

class CommentsEmptyState extends GetCommentsState {}
