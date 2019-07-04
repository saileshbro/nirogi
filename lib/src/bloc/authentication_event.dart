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
  final String name;
  final String imageUrl;
  final String email;
  final String address;

  LoggedInEvent(
      {@required this.token,
      @required this.name,
      this.imageUrl,
      this.address,
      @required this.email})
      : super([token, name, imageUrl, address, email]);

  @override
  String toString() => 'LoggedIn { token: $token }';
}

class LoggedOutEvent extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';
}
