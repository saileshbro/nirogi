import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class AuthenticationState extends Equatable {}

class AuthenticationUninitialisedState extends AuthenticationState {
  @override
  String toString() {
    return "AuthenticationUninitialisedState";
  }

  @override
  List<Object> get props => null;
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
  List<Object> get props => [
        name,
        email,
        address,
        imageUrl,
        token,
      ];
}

class AuthenticationUnauthenticatedState extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUnauthenticated';
  List<Object> get props => null;
}

class AuthenticationLoadingState extends AuthenticationState {
  @override
  String toString() => 'AuthenticationLoading';
  List<Object> get props => null;
}
