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
      if (event is BmiAddevent) {
        String message;
        message = await bmiRepository.addRecord(bmi: event.bmi);

        yield BmiSucessState(message: message);
      } else if (event is BmiGetEvent) {
        List<Bmi> bmis;
        bmis = await bmiRepository.getBmiRecords();
        yield BmiFetchedState(bmis: bmis);
      }
    } catch (e) {
      yield BmiErrorState(error: e.toString());
    }
  }
}
