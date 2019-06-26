import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nirogi/src/functions/functions.dart';
import 'package:nirogi/src/models/popupchoice.dart';
import 'package:nirogi/src/themes/scrollOverlay.dart';
import 'package:nirogi/src/widgets/choice_card.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
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
                              width: 0.33 * width,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                  'assets/images/icons/profile.png'),
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
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(0, 0, 0, 0.004 * height),
                              child: TextFormField(
                                validator: (name) => validateName(name),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.red[700],
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
                                    color: Colors.blue,
                                    width: 0.05 * width,
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
                                validator: (email) => validateEmail(email),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.red[700],
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
                                    color: Colors.blue,
                                    width: 0.05 * width,
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
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.red[700],
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.normal,
                                ),
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                decoration: InputDecoration(
                                  errorText: "",
                                  border: Theme.of(context)
                                      .inputDecorationTheme
                                      .border,
                                  labelText: 'Address',
                                  icon: Image.asset(
                                    'assets/images/icons/address.png',
                                    color: Colors.blue,
                                    width: 0.05 * width,
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
                          elevation: 5,
                          child: Center(
                            child: Text(
                              'Save Changes',
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  .copyWith(fontSize: 17, color: Colors.white),
                            ),
                          ),
                          onPressed: () {},
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
