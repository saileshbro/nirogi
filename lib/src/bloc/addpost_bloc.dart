import 'package:bloc/bloc.dart';
import 'package:nirogi/src/bloc/addpost_event.dart';
import 'package:nirogi/src/bloc/addpost_state.dart';
import 'package:nirogi/src/repository/repositories.dart';

class AddPostBloc extends Bloc<AddPostEvent, AddPostState> {
  @override
  AddPostState get initialState => AddPostUninitiatedState();

  @override
  Stream<AddPostState> mapEventToState(AddPostEvent event) async* {
    yield AddPostSendingState();
    try {
      String message;
      if (event is CreateNewPostevent) {
        message = await postRepository.addPost(post: event.post);
        yield AddPostSucessState(message: message);
      } else if (event is EditPostEvent)
        message = await postRepository.updatePost(
            postId: event.postId, updatePost: event.post);
    } catch (e) {
      yield AddPostErrorState(error: e.toString());
    }
  }
}

final AddPostBloc addPostBloc = AddPostBloc();
