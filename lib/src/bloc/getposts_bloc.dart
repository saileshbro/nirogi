import 'package:bloc/bloc.dart';
import 'package:nirogi/src/bloc/events.dart';
import 'package:nirogi/src/bloc/states.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:nirogi/src/repository/repositories.dart';

class GetPostsBloc extends Bloc<GetPostsEvent, GetPostsState> {
  @override
  GetPostsState get initialState => PostsUninitialisedState();

  @override
  Stream<GetPostsState> mapEventToState(GetPostsEvent event) async* {
    yield PostsFetchingState();
    try {
      List<Post> posts;
      if (event is GetAllPostsEvent) {
        posts = await postRepository.getAllPost(sort: event.sort);
      } else if (event is GetAllMyPostsEvent) {
        posts = await postRepository.getAllMyPosts();
      }
      if (posts.length == 0) {
        yield PostsEmptyState();
      } else {
        yield PostsFetchedState(posts: posts);
      }
    } catch (e) {
      yield PostsErrorState();
    }
  }
}

final GetPostsBloc getPostsBloc = GetPostsBloc();
