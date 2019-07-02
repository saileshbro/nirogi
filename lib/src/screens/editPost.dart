import 'package:flutter/material.dart';
import 'package:nirogi/src/models/models.dart';

import 'package:nirogi/src/themes/scrollOverlay.dart';

class EditPost extends StatefulWidget {
  final Post post;
  const EditPost({
    @required this.post,
    Key key,
  })  : assert(post != null),
        super(key: key);

  @override
  _EditPostState createState() =>
      _EditPostState(categoryId: post.category.categoryId);
}

class _EditPostState extends State<EditPost> {
  int categoryId;
  static Category categoryValue;
  _EditPostState({@required this.categoryId}) {
    categoryValue = categories[this.categoryId - 1];
  }
  int getCategoryId() {
    return this.categoryId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Edit Post', style: Theme.of(context).textTheme.headline),
            SizedBox(
              width: 14,
            ),
            Image.asset(
              'assets/images/icons/pen.png',
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
                      widget.post.name,
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
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                        initialValue: widget.post.title,
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
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.normal,
                        ),
                        initialValue: widget.post.body,
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
                            onPressed: () {},
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
