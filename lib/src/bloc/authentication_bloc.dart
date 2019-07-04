import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nirogi/src/bloc/authentication_event.dart';
import 'package:nirogi/src/bloc/states.dart';
import 'package:nirogi/src/repository/repositories.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  AuthenticationBloc({@required this.userRepository})
      : assert(userRepository != null);
  @override
  AuthenticationState get initialState => AuthenticationUninitialisedState();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStartedEvent) {
      final bool hasToken = await userRepository.hasToken();
      if (hasToken) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        yield AuthenticationAuthenticatedState(
          address: preferences.getString('address'),
          email: preferences.getString('email'),
          imageUrl: preferences.getString('imageUrl'),
          name: preferences.getString('name'),
        );
      } else {
        yield AuthenticationUnauthenticatedState();
      }
    }
    if (event is LoggedInEvent) {
      yield AuthenticationLoadingState();
      await userRepository.persistToken(
          imageUrl: event.imageUrl,
          name: event.name,
          token: event.token,
          email: event.email,
          address: event.address);
      yield AuthenticationAuthenticatedState(
          imageUrl: event.imageUrl,
          name: event.name,
          email: event.email,
          address: event.address);
    }
    if (event is LoggedOutEvent) {
      yield AuthenticationLoadingState();
      await userRepository.deleteToken();
      yield AuthenticationUnauthenticatedState();
    }
  }
}
