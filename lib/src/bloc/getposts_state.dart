import 'package:meta/meta.dart';
import 'package:nirogi/src/models/models.dart';

abstract class GetPostsState {}

class PostsUninitialisedState extends GetPostsState {}

class PostsFetchingState extends GetPostsState {}

class PostsFetchedState extends GetPostsState {
  final List<Post> posts;
  PostsFetchedState({@required this.posts}) : assert(posts != null);
}

class PostsErrorState extends GetPostsState {}

class PostsEmptyState extends GetPostsState {}
