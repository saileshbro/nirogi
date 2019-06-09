import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const []]) : super(props);
}

class AppStartedEvent extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';
}

class LoggedInEvent extends AuthenticationEvent {
  final String token;

  LoggedInEvent({@required this.token}) : super([token]);

  @override
  String toString() => 'LoggedIn { token: $token }';
}

class LoggedOutEvent extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';
}
