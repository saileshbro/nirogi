import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nirogi/src/bloc/addpost_bloc.dart';
import 'package:nirogi/src/bloc/events.dart';
import 'package:nirogi/src/bloc/states.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:nirogi/src/themes/scrollOverlay.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  GlobalKey<FormState> _createPostField = GlobalKey<FormState>();
  final Post post = Post(category: categories[0]);
  Category categoryValue = categories[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Create Post', style: Theme.of(context).textTheme.headline),
            SizedBox(
              width: 14,
            ),
            Image.asset(
              'assets/images/icons/create.png',
              width: 30,
            ),
          ],
        ),
      ),
      body: ScrollConfiguration(
        behavior: RemoveEndOfListIndicator(),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.red[50],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/icons/profile.png',
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Sailesh Dahal',
                      style: Theme.of(context).textTheme.body2.copyWith(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Form(
                  key: _createPostField,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        onSaved: (String value) {
                          post.title = value.trim();
                        },
                        validator: (String value) {
                          if (value.trim().isEmpty) {
                            return "Empty title provided.";
                          }
                          return null;
                        },
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red[700]),
                          ),
                          labelText: 'Title',
                          labelStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.red[700],
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                          ),
                          icon: Icon(
                            Icons.title,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onSaved: (String value) {
                          post.body = value.trim();
                        },
                        validator: (String value) {
                          if (value.trim().isEmpty) {
                            return "Empty body provided.";
                          }
                          return null;
                        },
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.normal,
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red[700]),
                          ),
                          labelText: 'Body',
                          labelStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.red[700],
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                          ),
                          icon: Icon(
                            Icons.subject,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            child: DropdownButton<Category>(
                                value: categoryValue,
                                elevation: 0,
                                onChanged: (Category newValue) {
                                  setState(() {
                                    categoryValue = newValue;
                                  });

                                  post.category = categoryValue;
                                },
                                items: categories
                                    .map<DropdownMenuItem<Category>>(
                                        (Category value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(
                                      value.category,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .body2
                                          .copyWith(
                                            fontSize: 16,
                                          ),
                                    ),
                                  );
                                }).toList()),
                          ),
                          FlatButton(
                            onPressed: () {
                              if (_createPostField.currentState.validate()) {
                                _createPostField.currentState.save();
                                addPostBloc
                                    .dispatch(CreateNewPostevent(post: post));
                                Navigator.pop(context);
                              }
                            },
                            child: Text(
                              'SAVE',
                              style: Theme.of(context).textTheme.body2.copyWith(
                                    fontSize: 20,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                BlocBuilder(
                  bloc: addPostBloc,
                  builder: (BuildContext context, AddPostState state) {
                    if (state is AddPostUninitiatedState) {
                      return SizedBox();
                    } else if (state is AddPostSendingState) {
                      return Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (state is AddPostSucessState) {
                      Fluttertoast.showToast(
                          msg: state.message,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIos: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      return SizedBox();
                    } else {
                      var errorstate = state as AddPostErrorState;
                      Fluttertoast.showToast(
                          msg: errorstate.error,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIos: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);

                      return SizedBox();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
