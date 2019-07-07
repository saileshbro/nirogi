import 'package:bloc/bloc.dart';
import 'package:nirogi/src/bloc/events.dart';
import 'package:nirogi/src/bloc/states.dart';
import 'package:nirogi/src/models/bmi.dart';
import 'package:nirogi/src/repository/repositories.dart';

class BmiBloc extends Bloc<BmiEvent, BmiState> {
  @override
  BmiState get initialState => BmiUninitiatedState();

  @override
  Stream<BmiState> mapEventToState(BmiEvent event) async* {
    yield BmiSendingState();
    try {
      String message;
      if (event is BmiAddevent) {
        message = await bmiRepository.addRecord(bmi: event.bmi);

        yield BmiSucessState(message: message);
      } else if (event is BmiGetEvent) {
        List<Bmi> bmis;
        bmis = await bmiRepository.getBmiRecords();
        if (bmis.isNotEmpty) {
          yield BmiFetchedState(bmis: bmis);
        } else {
          yield BmiEmptyState();
        }
      } else if (event is BmiClearEvent) {
        message = await bmiRepository.clearRecord();
        BmiSucessState(message: message);
      }
    } catch (e) {
      yield BmiErrorState(error: e.toString());
    }
  }
}
