import 'package:flutter/material.dart';
import 'package:nirogi/src/models/models.dart';
import 'package:nirogi/src/screens/screens.dart';

class PostBlock extends StatelessWidget {
  final Post post;
  const PostBlock({
    @required this.post,
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EachPost(
                    post: post,
                  ),
            ),
          );
        },
        child: Material(
          borderRadius: BorderRadius.circular(5),
          elevation: 1.0,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Padding(
              padding: EdgeInsets.all(0.01 * height),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          post.title,
                          textAlign: TextAlign.justify,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.body1.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.red[700],
                              ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.all(5),
                        color: Colors.blueGrey[700],
                        child: Text(
                          post.category.category,
                          style: Theme.of(context).textTheme.body2.copyWith(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0.01 * height,
                  ),
                  Text(
                    post.body,
                    textAlign: TextAlign.justify,
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .body2
                        .copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: 0.02 * height,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        '${post.createdAt}',
                        textAlign: TextAlign.justify,
                        maxLines: 5,
                        style: Theme.of(context).textTheme.body2.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/icons/eye.png',
                            height: 0.03 * height,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${post.views}',
                            textAlign: TextAlign.justify,
                            maxLines: 5,
                            style: Theme.of(context).textTheme.body2.copyWith(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/icons/upvote.png',
                            height: 0.03 * height,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            post.voteCount > 0
                                ? "+${post.voteCount}"
                                : "${post.voteCount}",
                            textAlign: TextAlign.justify,
                            maxLines: 5,
                            style: Theme.of(context).textTheme.body2.copyWith(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/icons/comment.png',
                            height: 0.03 * height,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${post.commentCount}',
                            textAlign: TextAlign.justify,
                            maxLines: 5,
                            style: Theme.of(context).textTheme.body2.copyWith(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
