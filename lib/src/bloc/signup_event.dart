import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nirogi/src/models/models.dart';

abstract class SignupEvent extends Equatable {
  SignupEvent([List props = const []]) : super(props);
}

class SignupButtonPressedEvent extends SignupEvent {
  final String email;
  final String password;
  final String name;

  SignupButtonPressedEvent({
    @required this.email,
    @required this.password,
    @required this.name,
  }) : super([email, password, name]);

  @override
  String toString() =>
      'LoginButtonPressed { email: $email, password: $password,name:$name }';
}

class UpdateProfileEvent extends SignupEvent {
  final User user;
  UpdateProfileEvent({@required this.user}) : assert(user != null);
}
