import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nirogi/src/bloc/signup_event.dart';
import 'package:nirogi/src/bloc/states.dart';
import 'package:nirogi/src/repository/user_repository.dart';

import 'authentication_bloc.dart';
import 'authentication_event.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;
  SignupBloc({@required this.authenticationBloc, @required this.userRepository})
      : assert(authenticationBloc != null),
        assert(userRepository != null);
  @override
  SignupState get initialState => SignupInitialState();

  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
    if (event is SignupButtonPressedEvent) {
      yield SignupLoadingState();
      try {
        final token = await userRepository.signup(
            email: event.email, password: event.password, name: event.name);
        authenticationBloc.dispatch(LoggedInEvent(token: token));
        yield SignupInitialState();
      } catch (e) {
        yield SignupFailureState(error: e.toString());
      }
    }
  }
}
