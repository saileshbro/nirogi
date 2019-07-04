import 'package:bloc/bloc.dart';
import 'package:nirogi/src/bloc/events.dart';
import 'package:nirogi/src/bloc/states.dart';
import 'package:nirogi/src/repository/repositories.dart';

class ManagePasswordBloc
    extends Bloc<ManagePasswordEvent, ManagePasswordState> {
  @override
  ManagePasswordState get initialState => ManagePasswordUninitialisedState();

  @override
  Stream<ManagePasswordState> mapEventToState(
      ManagePasswordEvent event) async* {
    yield ManagePasswordRequestingState();
    try {
      String message;
      if (event is ChangePasswordEvent) {
        message = await profileRepository.changePassword(
            passwordModel: event.changePassword);
        yield ManagePasswordSuccessState(message: message);
      } else if (event is ForgetPasswordEvent) {
        message = await profileRepository.forgetPassword(email: event.email);
        yield ManagePasswordSuccessState(message: message);
      }
    } catch (e) {
      yield ManagePasswordErrorState(error: e.toString());
    }
  }
}
