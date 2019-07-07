import 'package:bloc/bloc.dart';
import 'package:nirogi/src/bloc/events.dart';
import 'package:nirogi/src/bloc/states.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:nirogi/src/repository/repositories.dart';

class GetAllCommentsBloc extends Bloc<GetCommentsEvent, GetCommentsState> {
  @override
  GetCommentsState get initialState => CommentsUninitialisedState();

  @override
  Stream<GetCommentsState> mapEventToState(GetCommentsEvent event) async* {
    yield CommentsFetchingState();
    try {
      List<Comment> comments;
      if (event is GetAllCommentsEvent) {
        comments = await postRepository.getAllCommentsFromPost(
            postId: event.postId, sort: event.sort);
      }
      if (comments.length == 0) {
        yield CommentsEmptyState();
      } else {
        yield CommentsFetchedState(comments: comments);
      }
    } catch (e) {
      yield CommentsErrorState();
    }
  }
}

final GetAllCommentsBloc getAllCommentsBloc = GetAllCommentsBloc();
