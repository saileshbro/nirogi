import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nirogi/src/models/models.dart';

abstract class SignupEvent extends Equatable {}

class SignupButtonPressedEvent extends SignupEvent {
  final String email;
  final String password;
  final String name;

  SignupButtonPressedEvent({
    @required this.email,
    @required this.password,
    @required this.name,
  });

  @override
  String toString() =>
      'LoginButtonPressed { email: $email, password: $password,name:$name }';

  @override
  List<Object> get props => [email, password, name];
}

class UpdateProfileEvent extends SignupEvent {
  final User user;
  UpdateProfileEvent({@required this.user}) : assert(user != null);

  @override
  List<Object> get props => [user];
}
