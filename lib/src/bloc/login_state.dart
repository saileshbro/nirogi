import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LoginState extends Equatable {}

class LoginInitialState extends LoginState {
  @override
  String toString() => 'LoginInitial';

  @override
  List<Object> get props => null;
}

class LoginLoadingState extends LoginState {
  @override
  String toString() => 'LoginLoading';

  List<Object> get props => null;
}

class LoginFailureState extends LoginState {
  final String error;

  LoginFailureState({@required this.error});

  @override
  String toString() => 'LoginFailure { error: $error }';

  List<Object> get props => [error];
}
