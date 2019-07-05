import 'package:bloc/bloc.dart';
import 'package:nirogi/src/bloc/vote_event.dart';
import 'package:nirogi/src/bloc/vote_state.dart';
import 'package:nirogi/src/repository/repositories.dart';

class VoteBloc extends Bloc<VoteEvent, VoteState> {
  @override
  VoteState get initialState => VoteUninitialisedState();

  @override
  Stream<VoteState> mapEventToState(VoteEvent event) async* {
    try {
      int message;
      int voteCount;
      if (event is PostUpvoteEvent) {
        yield UpVoteSendingState();
        message = await postRepository.upvotePost(postId: event.postId);
        voteCount = await postRepository.getPostVoteCount(postId: event.postId);
        yield UpvotedState(voteStatus: message, voteCount: voteCount);
      }
      if (event is PostDownVoteEvent) {
        yield DownVoteSendingState();
        message = await postRepository.downvotePost(postId: event.postId);
        voteCount = await postRepository.getPostVoteCount(postId: event.postId);
        yield DownVotedState(voteStatus: message, voteCount: voteCount);
      }
      if (event is CommentUpvoteEvent) {
        yield UpVoteSendingState();
        message = await postRepository.upvoteComment(
            commentId: event.commentId, postId: event.postId);
        voteCount = await postRepository.getCommentVoteCount(
            postId: event.postId, commentId: event.commentId);
        yield UpvotedState(voteStatus: message, voteCount: voteCount);
      }
      if (event is CommentDownVoteEvent) {
        yield DownVoteSendingState();
        message = await postRepository.downvoteComment(
            commentId: event.commentId, postId: event.postId);
        voteCount = await postRepository.getCommentVoteCount(
            postId: event.postId, commentId: event.commentId);
        yield DownVotedState(voteStatus: message, voteCount: voteCount);
      }
    } catch (e) {
      yield VoteFailedState();
    }
  }
}
