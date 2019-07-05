import 'package:meta/meta.dart';

abstract class GetPostsEvent {}

class GetAllPostsEvent extends GetPostsEvent {
  final String sort;
  GetAllPostsEvent({@required this.sort}) : assert(sort != null);
}

class GetUsersPostsEvent extends GetPostsEvent {
  final int userId;
  GetUsersPostsEvent({@required this.userId}) : assert(userId != null);
}

class GetCategoryPostsEvent extends GetPostsEvent {
  final int categoryId;
  GetCategoryPostsEvent({@required this.categoryId})
      : assert(categoryId != null);
}

class GetAllMyPostsEvent extends GetPostsEvent {}