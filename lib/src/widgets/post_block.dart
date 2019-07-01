import 'package:flutter/material.dart';
import 'package:nirogi/src/models/posts.dart';
import 'package:nirogi/src/screens/eachPost.dart';

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
                children: <Widget>[
                  Text(
                    post.title,
                    textAlign: TextAlign.justify,
                    maxLines: 3,
                    style: Theme.of(context).textTheme.body1.copyWith(
                          fontSize: 16,
                          color: Colors.red[700],
                        ),
                  ),
                  SizedBox(
                    height: 0.01 * height,
                  ),
                  Text(
                    post.body,
                    textAlign: TextAlign.justify,
                    maxLines: 5,
                    style: Theme.of(context)
                        .textTheme
                        .body2
                        .copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: 0.02 * height,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        '${post.updatedAt}',
                        textAlign: TextAlign.justify,
                        maxLines: 5,
                        style: Theme.of(context).textTheme.body2.copyWith(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/icons/eye.png',
                            height: 0.04 * height,
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
                            height: 0.04 * height,
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
                            height: 0.04 * height,
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
