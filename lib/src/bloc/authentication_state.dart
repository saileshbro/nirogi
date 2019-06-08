import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {}

class AuthenticationUninitialisedState extends AuthenticationState {
  @override
  String toString() {
    return "AuthenticationUninitialisedState";
  }
}

class AuthenticationAuthenticatedState extends AuthenticationState {
  @override
  String toString() => 'AuthenticationAuthenticated';
}

class AuthenticationUnauthenticatedState extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUnauthenticated';
}

class AuthenticationLoadingState extends AuthenticationState {
  @override
  String toString() => 'AuthenticationLoading';
}
