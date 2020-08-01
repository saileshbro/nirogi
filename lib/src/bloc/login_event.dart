import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LoginEvent extends Equatable {}

class LoginButtonPressedEvent extends LoginEvent {
  final String email;
  final String password;

  LoginButtonPressedEvent({
    @required this.email,
    @required this.password,
  });

  @override
  String toString() =>
      'LoginButtonPressed { email: $email, password: $password }';

  @override
  List<Object> get props => [email, password];
}

class LoginInitialEvent extends LoginEvent {
  @override
  List<Object> get props => null;
}
