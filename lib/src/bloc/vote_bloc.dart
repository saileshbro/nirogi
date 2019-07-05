import 'package:bloc/bloc.dart';
import 'package:nirogi/src/bloc/vote_event.dart';
import 'package:nirogi/src/bloc/vote_state.dart';
import 'package:nirogi/src/repository/repositories.dart';

class VoteBloc extends Bloc<VoteEvent, VoteState> {
  @override
  VoteState get initialState => VoteUninitialisedState();

  @override
  Stream<VoteState> mapEventToState(VoteEvent event) async* {
    yield VoteSendingState();
    try {
      int message;
      if (event is PostUpvoteEvent) {
        message = await postRepository.upvotePost(postId: event.postId);
        yield UpvotedState(voteStatus: message);
      }
      if (event is PostDownVoteEvent) {
        message = await postRepository.downvotePost(postId: event.postId);
        yield DownVotedState(voteStatus: message);
      }
      if (event is CommentUpvoteEvent) {
        message = await postRepository.upvoteComment(
            commentId: event.commentId, postId: event.postId);
        yield UpvotedState(voteStatus: message);
      }
      if (event is CommentDownVoteEvent) {
        message = await postRepository.downvoteComment(
            commentId: event.commentId, postId: event.postId);
        yield DownVotedState(voteStatus: message);
      }
    } catch (e) {
      yield VoteFailedState();
    }
  }
}
