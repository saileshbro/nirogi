import 'package:meta/meta.dart';

abstract class GetPostsEvent {}

class GetAllPostsEvent extends GetPostsEvent {
  final String sort;
  GetAllPostsEvent({@required this.sort}) : assert(sort != null);
}
