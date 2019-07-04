import 'package:meta/meta.dart';
import 'package:nirogi/src/models/models.dart';

abstract class PostEvent {}

class CreateNewPostevent extends PostEvent {
  final Post post;
  CreateNewPostevent({@required this.post}) : assert(post != null);
}

class EditPostEvent extends PostEvent {
  final int postId;
  final Post post;
  EditPostEvent({@required this.postId, @required this.post})
      : assert(post != null);
}

class DeletePostEvent extends PostEvent {
  final int postId;
  DeletePostEvent({@required this.postId}) : assert(postId != null);
}
