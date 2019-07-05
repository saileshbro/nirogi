import 'package:meta/meta.dart';

abstract class UploadPictureState {}

class UploadInitialState extends UploadPictureState {}

class UploadSendingState extends UploadPictureState {}

class UploadSuccessState extends UploadPictureState {
  final String message;
  UploadSuccessState({@required this.message}) : assert(message != null);
}

class UploadFailedState extends UploadPictureState {
  final String error;
  UploadFailedState({@required this.error}) : assert(error != null);
}
