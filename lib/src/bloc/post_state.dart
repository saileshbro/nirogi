import 'package:meta/meta.dart';

abstract class PostState {}

class AddPostUninitiatedState extends PostState {}

class AddPostSendingState extends PostState {}

class AddPostErrorState extends PostState {
  final String error;
  AddPostErrorState({@required this.error}) : assert(error != null);
}

class AddPostSucessState extends PostState {
  final String message;
  AddPostSucessState({@required this.message}) : assert(message != null);
}
