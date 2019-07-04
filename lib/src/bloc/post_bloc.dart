import 'package:bloc/bloc.dart';
import 'package:nirogi/src/bloc/events.dart';
import 'package:nirogi/src/bloc/states.dart';
import 'package:nirogi/src/repository/repositories.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  @override
  PostState get initialState => AddPostUninitiatedState();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    yield AddPostSendingState();
    try {
      String message;
      if (event is CreateNewPostevent) {
        message = await postRepository.addPost(post: event.post);
        yield AddPostSucessState(message: message);
      } else if (event is EditPostEvent) {
        message = await postRepository.updatePost(
            postId: event.postId, updatePost: event.post);
        yield AddPostSucessState(message: message);
      } else if (event is DeletePostEvent) {
        message = await postRepository.deletePost(postId: event.postId);
        yield AddPostSucessState(message: message);
      }
    } catch (e) {
      yield AddPostErrorState(error: e.toString());
    }
  }
}
