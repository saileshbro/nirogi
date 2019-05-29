import 'package:nirogi/src/bloc/change_theme_event.dart';
import 'package:nirogi/src/bloc/change_theme_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bloc/bloc.dart';

class ChangeThemeBloc extends Bloc<ChangeThemeEvent, ChangeThemeState> {
  void onLightThemeChange() => dispatch(LightTheme());
  void onDarkThemeChange() => dispatch(DarkTheme());
  void onDecideThemeChange() => dispatch(DecideTheme());
  @override
  ChangeThemeState get initialState => ChangeThemeState.lightTheme();

  Future<void> _saveOptionValue(int optionValue) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('theme_option', optionValue);
  }

  Future<int> getOption() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int option = preferences.get('theme_option') ?? 0;
    return option;
  }

  @override
  Stream<ChangeThemeState> mapEventToState(ChangeThemeEvent event) async* {
    if (event is DecideTheme) {
      final int optionValue = await getOption();
      if (optionValue == 0) {
        yield ChangeThemeState.lightTheme();
      } else if (optionValue == 1) {
        yield ChangeThemeState.darkTheme();
      }
    }

    if (event is DarkTheme) {
      yield ChangeThemeState.darkTheme();
      try {
        _saveOptionValue(1);
      } catch (_) {
        throw Exception("Could not persist change");
      }
    }
    if (event is LightTheme) {
      yield ChangeThemeState.lightTheme();
      try {
        _saveOptionValue(0);
      } catch (_) {
        throw Exception("Could not persist change");
      }
    }
  }
}

final ChangeThemeBloc changeThemeBloc = ChangeThemeBloc()
  ..onDecideThemeChange();
