import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nirogi/src/bloc/blocs.dart';
import 'package:nirogi/src/bloc/events.dart';
import 'package:nirogi/src/bloc/states.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:nirogi/src/repository/repositories.dart';
import 'package:nirogi/src/screens/provincePage.dart';
import 'package:nirogi/src/screens/screens.dart';
import 'package:nirogi/src/screens/splashScreenPage.dart';
import 'package:nirogi/src/widgets/loading_indicator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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

User loggedinUser;

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    widget.changeThemeBloc.onDecideThemeChange();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      create: (context) =>
          AuthenticationBloc(userRepository: widget.userRepository)
            ..add(AppStartedEvent()),
      child: BlocBuilder<ChangeThemeBloc, ChangeThemeState>(
        bloc: changeThemeBloc,
        builder: (BuildContext context, ChangeThemeState state) {
          return MaterialApp(
            title: 'Hami Nirogi',
            home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
              bloc: BlocProvider.of<AuthenticationBloc>(context),
              builder: (BuildContext context, AuthenticationState authstate) {
                if (authstate is AuthenticationUninitialisedState) {
                  return SplashPage();
                }
                if (authstate is AuthenticationAuthenticatedState) {
                  loggedinUser = User(
                    address: authstate.address,
                    email: authstate.email,
                    imageUrl: authstate.imageUrl,
                    name: authstate.name,
                    token: authstate.token,
                  );
                  return HomePage();
                }
                if (authstate is AuthenticationUnauthenticatedState) {
                  return LoginSignup(
                    userRepository: widget.userRepository,
                  );
                }
                if (authstate is AuthenticationLoadingState) {
                  return LoadingIndicator();
                }
              },
            ),
            routes: <String, WidgetBuilder>{
              "/diseases": (context) => DiseasesPage(),
              "/symptoms": (context) => SymptomsPage(),
              "/news": (context) => HealthNewsPage(),
              "/about": (context) => AboutPage(),
              "/profile": (context) => ProfilePage(),
              "/editprofile": (context) => EditProfile(),
              "/changepw": (context) => ChangePasswordPage(),
              "/forum": (context) => ForumPage(),
              "/tools": (context) => HealthToolsPage(),
              "/province": (context) => ProvincePage(),
            },
            debugShowCheckedModeBanner: false,
            theme: state.themeData,
          );
        },
      ),
    );
  }
}
