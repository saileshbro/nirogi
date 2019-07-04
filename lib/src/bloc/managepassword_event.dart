import 'package:meta/meta.dart';
import 'package:nirogi/src/models/passwordmodel.dart';

abstract class ManagePasswordEvent {}

class ChangePasswordEvent extends ManagePasswordEvent {
  final ChangePassword changePassword;
  ChangePasswordEvent({@required this.changePassword})
      : assert(changePassword != null);
}

class ForgetPasswordEvent extends ManagePasswordEvent {
  final String email;
  ForgetPasswordEvent({@required this.email}) : assert(email != null);
}
