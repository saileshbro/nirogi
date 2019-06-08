import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class SignupState extends Equatable {
  SignupState([List props = const []]) : super(props);
}

class SignupInitialState extends SignupState {
  @override
  String toString() => 'SignupInitial';
}

class SignupLoadingState extends SignupState {
  @override
  String toString() => 'SignupLoading';
}

class SignupFailureState extends SignupState {
  final String error;

  SignupFailureState({@required this.error}) : super([error]);

  @override
  String toString() => 'SignupFailure { error: $error }';
}
