import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nirogi/src/bloc/blocs.dart';
import 'package:nirogi/src/bloc/events.dart';
import 'package:nirogi/src/bloc/states.dart';
import 'package:nirogi/src/repository/user_repository.dart';
import 'package:nirogi/src/screens/screens.dart';
import 'package:nirogi/src/screens/splashScreenPage.dart';
import 'package:nirogi/src/widgets/loading_indicator.dart';

void main() {
  final UserRepository userRepository = UserRepository();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp(
      changeThemeBloc: changeThemeBloc,
      userRepository: userRepository,
    ));
  });
}

class MyApp extends StatefulWidget {
  final ChangeThemeBloc changeThemeBloc;
  final UserRepository userRepository;
  MyApp({
    @required this.changeThemeBloc,
    @required this.userRepository,
  });

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthenticationBloc authenticationBloc;

  @override
  void initState() {
    widget.changeThemeBloc.onDecideThemeChange();
    authenticationBloc =
        AuthenticationBloc(userRepository: widget.userRepository);
    authenticationBloc.dispatch(AppStartedEvent());
    super.initState();
  }

  @override
  void dispose() {
    authenticationBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      bloc: authenticationBloc,
      child: BlocBuilder<ChangeThemeEvent, ChangeThemeState>(
        bloc: changeThemeBloc,
        builder: (BuildContext context, ChangeThemeState state) {
          return MaterialApp(
            title: 'Hami Nirogi',
            home: BlocBuilder<AuthenticationEvent, AuthenticationState>(
              bloc: authenticationBloc,
              builder: (BuildContext context, AuthenticationState state) {
                if (state is AuthenticationUninitialisedState) {
                  return SplashPage();
                }
                if (state is AuthenticationAuthenticatedState) {
                  return HomePage();
                }
                if (state is AuthenticationUnauthenticatedState) {
                  return LoginSignup(userRepository: widget.userRepository);
                }
                if (state is AuthenticationLoadingState) {
                  return LoadingIndicator();
                }
              },
            ),
            routes: <String, WidgetBuilder>{
              "/diseases": (context) => DiseasesPage(),
              "/symptoms": (context) => SymptomsPage(),
              "/news": (context) => HealthNewsPage(),
              "/about": (context) => AboutPage(),
              "/contact": (context) => ContactPage(),
            },
            debugShowCheckedModeBanner: false,
            theme: state.themeData,
          );
        },
      ),
    );
  }
}
