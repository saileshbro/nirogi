import 'package:bloc/bloc.dart';
import 'package:nirogi/src/bloc/events.dart';
import 'package:nirogi/src/bloc/states.dart';
import 'package:nirogi/src/repository/repositories.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  @override
  CommentState get initialState => CommentUninitiatedState();

  @override
  Stream<CommentState> mapEventToState(CommentEvent event) async* {
    yield CommentSendingState();
    try {
      String message;
      if (event is CreateNewCommentevent) {
        message = await postRepository.commentPost(
            comment: event.comment, postId: event.postId);
        yield CommentSucessState(message: message);
      } else if (event is EditCommentEvent) {
        message = await postRepository.updateComment(
            comment: event.comment,
            commentId: event.commentId,
            postId: event.postId);
        yield CommentSucessState(message: message);
      } else if (event is DeleteCommentEvent) {
        message = await postRepository.deleteComment(
            postId: event.postId, commentId: event.commentId);
        yield CommentSucessState(message: message);
      }
    } catch (e) {
      yield CommentErrorState(error: e.toString());
    }
  }
}
