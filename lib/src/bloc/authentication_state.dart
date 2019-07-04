import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class AuthenticationState extends Equatable {}

class AuthenticationUninitialisedState extends AuthenticationState {
  @override
  String toString() {
    return "AuthenticationUninitialisedState";
  }
}

class AuthenticationAuthenticatedState extends AuthenticationState {
  final String name;
  final String email;
  final String address;
  final String imageUrl;
  final String token;
  AuthenticationAuthenticatedState(
      {@required this.name,
      @required this.email,
      @required this.address,
      @required this.token,
      @required this.imageUrl});
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
