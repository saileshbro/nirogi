import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

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
