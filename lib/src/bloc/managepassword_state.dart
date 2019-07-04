import 'package:meta/meta.dart';

abstract class ManagePasswordState {}

class ManagePasswordUninitialisedState extends ManagePasswordState {}

class ManagePasswordRequestingState extends ManagePasswordState {}

class ManagePasswordSuccessState extends ManagePasswordState {
  final String message;
  ManagePasswordSuccessState({@required this.message})
      : assert(message != null);
}

class ManagePasswordErrorState extends ManagePasswordState {
  final String error;
  ManagePasswordErrorState({@required this.error}) : assert(error != null);
}
