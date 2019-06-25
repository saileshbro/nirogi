import 'package:flutter/material.dart';
import 'package:nirogi/src/models/popupchoice.dart';
import 'package:nirogi/src/models/postComments.dart';
import 'package:nirogi/src/widgets/comment_card.dart';

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
  DropDownChoice dropdownValue = const DropDownChoice(
    title: 'Votes',
    icon: 'assets/images/icons/upvote.png',
  );
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 0.033 * height),
        child: FloatingActionButton(
          heroTag: 'Add Comment',
          tooltip: 'Add Comment',
          onPressed: () {},
          backgroundColor: Colors.grey[300],
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                0.03 * width, 0.016 * width, 0.03 * width, 0.016 * width),
            child: Image.asset(
              'assets/images/icons/add.png',
              color: Colors.red[700],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Post', style: Theme.of(context).textTheme.headline),
            SizedBox(
              width: 14,
            ),
            Image.asset(
              'assets/images/icons/post.png',
              width: 30,
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            'assets/images/icons/upArrow.png',
                            width: 25,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.post.voteCount.toString(),
                          style: Theme.of(context).textTheme.body2.copyWith(
                                fontSize: 18,
                              ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            'assets/images/icons/downArrow.png',
                            width: 25,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.post.title,
                            style: Theme.of(context).textTheme.body1.copyWith(
                                  fontSize: 16,
                                ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.red[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                widget.post.category,
                                style:
                                    Theme.of(context).textTheme.body2.copyWith(
                                          fontSize: 15,
                                        ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.post.body,
                            style: Theme.of(context).textTheme.body2.copyWith(
                                  fontSize: 15,
                                ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image.asset('assets/images/icons/recent.png', height: 15),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget.post.updatedAt.toString(),
                      style: Theme.of(context).textTheme.body2.copyWith(
                            fontSize: 15,
                          ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset('assets/images/icons/view.png', height: 15),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget.post.views.toString(),
                      style: Theme.of(context).textTheme.body2.copyWith(
                            fontSize: 15,
                          ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Text(
                      widget.post.name,
                      style: Theme.of(context).textTheme.body2.copyWith(
                            fontSize: 16,
                            color: Colors.red[700],
                          ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 50,
                      width: 50,
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
          SizedBox(
            height: 5,
          ),
          Container(
            color: Colors.grey[300],
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: <Widget>[
                Image.asset('assets/images/icons/comment.png', height: 20),
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
                Text(
                  'Sort By:',
                  style: Theme.of(context).textTheme.body2.copyWith(
                        fontSize: 18,
                      ),
                ),
                SizedBox(
                  width: 15,
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
                      title: 'Votes',
                      icon: 'assets/images/icons/upvote.png',
                    ),
                    const DropDownChoice(
                      title: 'Date-Time',
                      icon: 'assets/images/icons/recent.png',
                    ),
                  ].map<DropdownMenuItem<DropDownChoice>>(
                      (DropDownChoice value) {
                    return DropdownMenuItem<DropDownChoice>(
                      value: value,
                      child: Row(
                        children: <Widget>[
                          Text(value.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .body1
                                  .copyWith(fontSize: 14)),
                          SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            value.icon,
                            width: 25,
                          )
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
    );
  }
}

class _BuildCommentsList extends StatelessWidget {
  const _BuildCommentsList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 10, top: 10, left: 10, bottom: 10),
        child: ListView.separated(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
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
              height: 10,
            );
          },
        ),
      ),
    );
  }
}
