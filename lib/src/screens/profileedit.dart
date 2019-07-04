import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nirogi/main.dart';
import 'package:nirogi/src/bloc/blocs.dart';
import 'package:nirogi/src/bloc/events.dart';
import 'package:nirogi/src/bloc/states.dart';
import 'package:nirogi/src/constants/env.dart';
import 'package:nirogi/src/functions/functions.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:nirogi/src/repository/repositories.dart';
import 'package:nirogi/src/themes/scrollOverlay.dart';
import 'package:nirogi/src/widgets/widgets.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key key}) : super(key: key);
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  SignupBloc signupBloc;
  File _image;
  GlobalKey<FormState> _formKey;
  final User updateuser = User();
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  void initState() {
    super.initState();
    signupBloc = SignupBloc(
        authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
        userRepository: userRepository);
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Edit Profile', style: Theme.of(context).textTheme.headline),
            SizedBox(
              width: 0.03 * width,
            ),
            Image.asset(
              'assets/images/icons/createpost.png',
              width: 0.07 * width,
            ),
          ],
        ),
        actions: <Widget>[
          PopupMenuButton<Choice>(
            onSelected: (Choice choice) {
              Navigator.of(context).pushNamed('/changepw');
            },
            itemBuilder: (BuildContext context) {
              return choice.map((Choice choice) {
                return PopupMenuItem<Choice>(
                  child: ChoiceCard(
                    choice: choice,
                  ),
                  value: choice,
                );
              }).toList();
            },
          )
        ],
      ),
      body: ScrollConfiguration(
        behavior: RemoveEndOfListIndicator(),
        child: SingleChildScrollView(
          child: Container(
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 0.02 * height,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              height: 0.17 * height,
                              width: 0.17 * height,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  "$baseUrl/${loggedinUser.imageUrl}",
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0.10 * height,
                              right: 0,
                              child: SizedBox(
                                height: 0.06 * height,
                                width: 0.10 * width,
                                child: FloatingActionButton(
                                  backgroundColor: Colors.white,
                                  onPressed: getImage,
                                  tooltip: 'Change Avatar',
                                  child: Image.asset(
                                    'assets/images/icons/avatar.png',
                                    width: 0.07 * width,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 0.05 * width, vertical: 0.02 * height),
                      padding: EdgeInsets.all(20.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(0, 0, 0, 0.004 * height),
                              child: TextFormField(
                                onSaved: (name) {
                                  updateuser.name = name;
                                },
                                initialValue: loggedinUser.name,
                                validator: (name) => validateName(name),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.normal,
                                ),
                                decoration: InputDecoration(
                                  errorText: "",
                                  border: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  labelText: 'Name',
                                  icon: Image.asset(
                                    'assets/images/icons/user.png',
                                    color: Colors.blue[600],
                                    width: 0.06 * width,
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              height: 0.02 * height,
                            ),
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(0, 0, 0, 0.004 * height),
                              child: TextFormField(
                                onSaved: (email) {
                                  updateuser.email = email;
                                },
                                initialValue: loggedinUser.email,
                                validator: (email) => validateEmail(email),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.normal,
                                ),
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  errorText: "",
                                  border: Theme.of(context)
                                      .inputDecorationTheme
                                      .border,
                                  icon: Image.asset(
                                    'assets/images/icons/email.png',
                                    color: Colors.blue[600],
                                    width: 0.06 * width,
                                  ),
                                  labelText: 'Email',
                                ),
                              ),
                            ),
                            Divider(
                              height: 0.02 * height,
                            ),
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(0, 0, 0, 0.004 * height),
                              child: TextFormField(
                                onSaved: (address) {
                                  updateuser.address = address;
                                },
                                initialValue: loggedinUser.address ?? "",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.normal,
                                ),
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  errorText: "",
                                  border: Theme.of(context)
                                      .inputDecorationTheme
                                      .border,
                                  labelText: 'Address',
                                  icon: Image.asset(
                                    'assets/images/icons/address.png',
                                    color: Colors.blue[600],
                                    width: 0.06 * width,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          color: Colors.blue[400],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                              child: BlocBuilder(
                            bloc: signupBloc,
                            builder: (BuildContext context, state) {
                              if (state is SignupInitialState) {
                                return Text(
                                  'Save Changes',
                                  style: Theme.of(context)
                                      .textTheme
                                      .button
                                      .copyWith(
                                          fontSize: 17, color: Colors.white),
                                );
                              } else if (state is SignupLoadingState) {
                                return CircularProgressIndicator();
                              } else if (state is SignupSuccessState) {
                                Fluttertoast.showToast(
                                    msg: state.message,
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIos: 1,
                                    backgroundColor: Colors.black,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                Navigator.pop(context);
                                return Text(
                                  'Save Changes',
                                  style: Theme.of(context)
                                      .textTheme
                                      .button
                                      .copyWith(
                                          fontSize: 17, color: Colors.white),
                                );
                              } else {
                                final errstate = state as SignupFailureState;
                                Fluttertoast.showToast(
                                    msg: errstate.error,
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIos: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                Navigator.pop(context);
                                return Text(
                                  'Save Changes',
                                  style: Theme.of(context)
                                      .textTheme
                                      .button
                                      .copyWith(
                                          fontSize: 17, color: Colors.white),
                                );
                              }
                            },
                          )),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              loggedinUser.address = updateuser.address;
                              loggedinUser.email = updateuser.email;
                              loggedinUser.name = updateuser.name;
                              signupBloc.dispatch(
                                  UpdateProfileEvent(user: updateuser));
                            }
                          },
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
