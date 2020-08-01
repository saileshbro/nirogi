import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class SignupState extends Equatable {}

class SignupInitialState extends SignupState {
  @override
  String toString() => 'SignupInitial';

  @override
  List<Object> get props => null;
}

class SignupLoadingState extends SignupState {
  @override
  String toString() => 'SignupLoading';

  @override
  List<Object> get props => null;
}

class SignupFailureState extends SignupState {
  final String error;

  SignupFailureState({@required this.error});

  @override
  String toString() => 'SignupFailure { error: $error }';

  @override
  List<Object> get props => [error];
}

class SignupSuccessState extends SignupState {
  final String message;

  SignupSuccessState({@required this.message});

  @override
  List<Object> get props => [message];
}
