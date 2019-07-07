import 'package:meta/meta.dart';
import 'package:nirogi/src/models/models.dart';

abstract class BmiState {}

class BmiUninitiatedState extends BmiState {}

class BmiSendingState extends BmiState {}

class BmiEmptyState extends BmiState {}

class BmiErrorState extends BmiState {
  final String error;
  BmiErrorState({@required this.error}) : assert(error != null);
}

class BmiFetchedState extends BmiState {
  final List<Bmi> bmis;
  BmiFetchedState({@required this.bmis}) : assert(bmis != null);
}

class BmiSucessState extends BmiState {
  final String message;
  BmiSucessState({@required this.message}) : assert(message != null);
}
