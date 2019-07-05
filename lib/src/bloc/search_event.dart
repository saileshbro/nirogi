import 'package:meta/meta.dart';

abstract class SearchEvent {}

class DrugSearchEvent extends SearchEvent {
  final String query;
  DrugSearchEvent({@required this.query}) : assert(query != null);
}
