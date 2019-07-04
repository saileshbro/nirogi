import 'package:meta/meta.dart';

abstract class CommentState {}

class CommentUninitiatedState extends CommentState {}

class CommentSendingState extends CommentState {}

class CommentErrorState extends CommentState {
  final String error;
  CommentErrorState({@required this.error}) : assert(error != null);
}

class CommentSucessState extends CommentState {
  final String message;
  CommentSucessState({@required this.message}) : assert(message != null);
}
