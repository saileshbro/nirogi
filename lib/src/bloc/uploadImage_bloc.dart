import 'package:bloc/bloc.dart';
import 'package:nirogi/src/bloc/events.dart';
import 'package:nirogi/src/bloc/states.dart';
import 'package:nirogi/src/repository/repositories.dart';

class UploadBloc extends Bloc<UploadPictureEvent, UploadPictureState> {
  @override
  UploadPictureState get initialState => UploadInitialState();

  @override
  Stream<UploadPictureState> mapEventToState(event) async* {
    yield UploadSendingState();
    String message;
    try {
      if (event is UploadProfilePicture) {
        message = await profileRepository.uploadProfilePicture(
            image: event.uploadImage);
        yield (UploadSuccessState(message: message));
      }
    } catch (e) {
      yield UploadFailedState(error: e.toString());
    }
  }
}
