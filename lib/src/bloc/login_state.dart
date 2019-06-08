import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LoginState extends Equatable {
  LoginState([List props = const []]) : super(props);
}

class LoginInitialState extends LoginState {
  @override
  String toString() => 'LoginInitial';
}

class LoginLoadingState extends LoginState {
  @override
  String toString() => 'LoginLoading';
}

class LoginFailureState extends LoginState {
  final String error;

  LoginFailureState({@required this.error}) : super([error]);

  @override
  String toString() => 'LoginFailure { error: $error }';
}
