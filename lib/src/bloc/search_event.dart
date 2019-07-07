import 'package:meta/meta.dart';

abstract class SearchEvent {}

class DrugSearchEvent extends SearchEvent {
  final String query;
  DrugSearchEvent({@required this.query}) : assert(query != null);
}

class DiseaseSearchEvent extends SearchEvent {
  final String query;
  DiseaseSearchEvent({@required this.query}) : assert(query != null);
}

class SymptomSearchEvent extends SearchEvent {
  final String query;
  SymptomSearchEvent({@required this.query}) : assert(query != null);
}
