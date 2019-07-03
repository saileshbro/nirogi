import 'package:meta/meta.dart';

abstract class AddPostState {}

class AddPostUninitiatedState extends AddPostState {}

class AddPostSendingState extends AddPostState {}

class AddPostErrorState extends AddPostState {
  final String error;
  AddPostErrorState({@required this.error}) : assert(error != null);
}

class AddPostSucessState extends AddPostState {
  final String message;
  AddPostSucessState({@required this.message}) : assert(message != null);
}
