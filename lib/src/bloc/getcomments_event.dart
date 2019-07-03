import 'package:meta/meta.dart';

abstract class GetCommentsEvent {}

class GetAllCommentsEvent extends GetCommentsEvent {
  final String sort;
  final int postId;
  GetAllCommentsEvent({@required this.sort, @required this.postId})
      : assert(sort != null),
        assert(postId != null);
}
