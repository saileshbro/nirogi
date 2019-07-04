import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]) : super(props);
}

class LoginButtonPressedEvent extends LoginEvent {
  final String email;
  final String password;

  LoginButtonPressedEvent({
    @required this.email,
    @required this.password,
  }) : super([email, password]);

  @override
  String toString() =>
      'LoginButtonPressed { email: $email, password: $password }';
}

class LoginInitialEvent extends LoginEvent {}
