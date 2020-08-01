import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nirogi/src/bloc/authentication_bloc.dart';
import 'package:nirogi/src/bloc/events.dart';
import 'package:nirogi/src/bloc/login_event.dart';
import 'package:nirogi/src/bloc/states.dart';
import 'package:nirogi/src/repository/repositories.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;
  LoginBloc({@required this.authenticationBloc, @required this.userRepository})
      : assert(authenticationBloc != null),
        assert(userRepository != null);
  @override
  LoginState get initialState => LoginInitialState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginInitialEvent) {
      yield LoginInitialState();
    } else if (event is LoginButtonPressedEvent) {
      yield LoginLoadingState();
      try {
        final user = await userRepository.authenticate(
            email: event.email, password: event.password);
        authenticationBloc.add(LoggedInEvent(
            token: user.token,
            name: user.name,
            imageUrl: user.imageUrl,
            email: user.email,
            address: user.address));
        yield LoginInitialState();
      } catch (e) {
        yield LoginFailureState(error: e.toString());
      }
    }
  }
}
