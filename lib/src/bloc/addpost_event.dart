import 'package:meta/meta.dart';
import 'package:nirogi/src/models/models.dart';

abstract class AddPostEvent {}

class CreateNewPostevent extends AddPostEvent {
  final Post post;
  CreateNewPostevent({@required this.post}) : assert(post != null);
}

class EditPostEvent extends AddPostEvent {
  final int postId;
  final Post post;
  EditPostEvent({@required this.postId, @required this.post})
      : assert(post != null);
}
