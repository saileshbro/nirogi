import 'dart:io';

import 'package:meta/meta.dart';

abstract class UploadPictureEvent {}

class UploadProfilePicture extends UploadPictureEvent {
  final File uploadImage;
  UploadProfilePicture({@required this.uploadImage})
      : assert(uploadImage != null);
}
