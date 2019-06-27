import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nirogi/src/models/popupchoice.dart';
import 'package:nirogi/src/models/postComments.dart';
import 'package:nirogi/src/themes/scrollOverlay.dart';
import 'package:nirogi/src/widgets/comment_card.dart';
import 'package:nirogi/src/widgets/plus_floating_icon.dart';

class EachPost extends StatefulWidget {
  final post;
  const EachPost({
    @required this.post,
    Key key,
  }) : super(key: key);

  @override
  _EachPostState createState() => _EachPostState();
}

class _EachPostState extends State<EachPost> {
  TextEditingController _controller = TextEditingController();
  bool isButtonClicked = false;
  DropDownChoice dropdownValue = const DropDownChoice(
    title: 'vote',
    icon: 'assets/images/icons/upvote.png',
  );

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return WillPopScope(
      child: Scaffold(
        bottomNavigationBar: isButtonClicked
            ? Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                  color: Colors.grey.withOpacity(0.05),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(
                      0.035 * width, 0.005 * height, 0, 0.005 * height),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/icons/imageUrl.png'),
                      ),
                      SizedBox(width: 0.04 * width),
                      Flexible(
                        child: TextField(
                          controller: _controller,
                          style: Theme.of(context).textTheme.body2.copyWith(
                                fontSize: 16,
                              ),
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: "Enter your comment here",
                            border: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                          keyboardType: TextInputType.multiline,
                        ),
                      ),
                      SizedBox(width: 0.005 * width),
                      IconButton(
                        padding: EdgeInsets.all(0),
                        icon: Icon(Icons.send),
                        color: Colors.red[700],
                        onPressed: () {
                          print(_controller.text);
                        },
                      )
                    ],
                  ),
                ),
              )
            : Container(
                height: 0,
                width: 0,
              ),
        floatingActionButton: !isButtonClicked
            ? FloatingActionButton(
                heroTag: 'Add Comment',
                tooltip: 'Add Comment',
                onPressed: () {
                  setState(() {
                    isButtonClicked = !isButtonClicked;
                  });
                },
                backgroundColor: Colors.white,
                child: PlusFloatingIcon(),
              )
            : Container(
                height: 0.0,
                width: 0.0,
              ),
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Post', style: Theme.of(context).textTheme.headline),
              SizedBox(
                width: 0.03 * width,
              ),
              Image.asset(
                'assets/images/icons/post.png',
                width: 0.07 * width,
              ),
            ],
          ),
        ),
        body: ScrollConfiguration(
          behavior: RemoveEndOfListIndicator(),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 0.01 * height),
                  padding: EdgeInsets.symmetric(horizontal: 0.03 * width),
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/images/icons/upArrow.png',
                                  width: 0.06 * width,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                height: 0.02 * width,
                              ),
                              Text(
                                widget.post.voteCount.toString(),
                                style:
                                    Theme.of(context).textTheme.body2.copyWith(
                                          fontSize: 18,
                                        ),
                              ),
                              SizedBox(
                                height: 0.02 * width,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/images/icons/downArrow.png',
                                  width: 0.06 * width,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 0.04 * width,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  widget.post.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .body1
                                      .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  textAlign: TextAlign.justify,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    margin: EdgeInsets.only(top: 5),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.red[100],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      widget.post.category,
                                      style: Theme.of(context)
                                          .textTheme
                                          .body2
                                          .copyWith(
                                            fontSize: 12,
                                          ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 0.01 * height,
                                ),
                                Text(
                                  widget.post.body,
                                  style: Theme.of(context)
                                      .textTheme
                                      .body2
                                      .copyWith(
                                        fontSize: 15,
                                      ),
                                  textAlign: TextAlign.justify,
                                ),
                                Row(
                                  children: <Widget>[
                                    Image.asset(
                                        'assets/images/icons/recent.png',
                                        height: 0.02 * height),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      widget.post.updatedAt.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .body2
                                          .copyWith(
                                            fontSize: 16,
                                          ),
                                    ),
                                    SizedBox(
                                      width: 0.02 * width,
                                    ),
                                    Image.asset('assets/images/icons/eye.png',
                                        height: 0.02 * width),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      widget.post.views.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .body2
                                          .copyWith(
                                            fontSize: 16,
                                          ),
                                    ),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    Text(
                                      widget.post.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .body2
                                          .copyWith(
                                            fontSize: 16,
                                            color: Colors.red[700],
                                          ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      height: 0.08 * width,
                                      width: 0.12 * width,
                                      decoration: BoxDecoration(
                                        color: Colors.red[50],
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage(
                                            widget.post.imageUrl,
                                          ),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  color: Colors.grey[300],
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: <Widget>[
                      Image.asset('assets/images/icons/comment.png',
                          height: 20),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.post.commentCount.toString(),
                        style: Theme.of(context).textTheme.body2.copyWith(
                              fontSize: 20,
                            ),
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                      DropdownButton<DropDownChoice>(
                        value: dropdownValue,
                        elevation: 0,
                        onChanged: (DropDownChoice choice) {
                          setState(() {
                            dropdownValue = choice;
                          });
                        },
                        items: <DropDownChoice>[
                          const DropDownChoice(
                            title: 'vote',
                            icon: 'assets/images/icons/upvote.png',
                          ),
                          const DropDownChoice(
                            title: 'time',
                            icon: 'assets/images/icons/recent.png',
                          ),
                        ].map<DropdownMenuItem<DropDownChoice>>(
                            (DropDownChoice value) {
                          return DropdownMenuItem<DropDownChoice>(
                            value: value,
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  value.icon,
                                  width: 0.04 * width,
                                ),
                                SizedBox(
                                  width: 0.02 * width,
                                ),
                                Text(value.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .body1
                                        .copyWith(fontSize: 14))
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                _BuildCommentsList(),
              ],
            ),
          ),
        ),
      ),
      onWillPop: _floatingPressed,
    );
  }

  Future<bool> _floatingPressed() async {
    if (isButtonClicked) {
      setState(() {
        isButtonClicked = !isButtonClicked;
      });
      return false;
    } else {
      return true;
    }
  }
}

class _BuildCommentsList extends StatelessWidget {
  const _BuildCommentsList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
          right: 0.02 * width,
          top: 0.01 * height,
          left: 0.04 * width,
          bottom: 0.01 * height),
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: comments.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return CommentCard(
            comment: comments[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.grey,
            height: 0.01 * height,
          );
        },
      ),
    );
  }
}
