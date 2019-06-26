import 'package:flutter/material.dart';
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
  DropDownChoice dropdownValue = const DropDownChoice(
    title: 'vote',
    icon: 'assets/images/icons/upvote.png',
  );
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 0.033 * height),
        child: FloatingActionButton(
          heroTag: 'Add Comment',
          tooltip: 'Add Comment',
          onPressed: () {},
          backgroundColor: Colors.white,
          child: PlusFloatingIcon(),
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
      body: ScrollConfiguration(
        behavior: RemoveEndOfListIndicator(),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(horizontal: 15),
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
                                width: 25,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              widget.post.voteCount.toString(),
                              style: Theme.of(context).textTheme.body2.copyWith(
                                    fontSize: 18,
                                  ),
                            ),
                            SizedBox(
                              height: 15,
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
                                style:
                                    Theme.of(context).textTheme.body1.copyWith(
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
                                height: 10,
                              ),
                              Text(
                                widget.post.body,
                                style:
                                    Theme.of(context).textTheme.body2.copyWith(
                                          fontSize: 15,
                                        ),
                                textAlign: TextAlign.justify,
                              ),
                              Row(
                                children: <Widget>[
                                  Image.asset('assets/images/icons/recent.png',
                                      height: 15),
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
                                    width: 10,
                                  ),
                                  Image.asset('assets/images/icons/view.png',
                                      height: 15),
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
                                width: 20,
                              ),
                              SizedBox(
                                width: 10,
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
    );
  }
}

class _BuildCommentsList extends StatelessWidget {
  const _BuildCommentsList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10, top: 10, left: 20, bottom: 10),
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
            height: 10,
          );
        },
      ),
    );
  }
}
