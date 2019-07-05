import 'package:bloc/bloc.dart';
import 'package:nirogi/src/bloc/events.dart';
import 'package:nirogi/src/bloc/states.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:nirogi/src/repository/repositories.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  @override
  SearchState get initialState => SearchUninitialisedState();

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    yield SearchFetchingState();
    try {
      if (event is DrugSearchEvent) {
        final List<Drug> drugs =
            await drugRepository.searchDrug(query: event.query);
        if (drugs.length == 0) {
          yield SearchEmptyState();
        } else {
          yield SearchDrugFetchedState(drugs: drugs);
        }
      }
    } catch (e) {
      yield SearchErrorState();
    }
  }
}
