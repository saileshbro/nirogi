import 'package:flutter/material.dart';

class PostBlock extends StatelessWidget {
  final post;
  const PostBlock({
    @required this.post,
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print('Here');
        },
        child: Material(
          borderRadius: BorderRadius.circular(5),
          elevation: 1.0,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
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
                    height: 10,
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
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '${post.time} hours ago',
                        textAlign: TextAlign.justify,
                        maxLines: 5,
                        style: Theme.of(context).textTheme.body2.copyWith(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        'assets/images/icons/eye.png',
                        height: 30,
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
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        'assets/images/icons/upvote.png',
                        height: 30,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '+ ${post.upvotes} - ${post.downvotes}',
                        textAlign: TextAlign.justify,
                        maxLines: 5,
                        style: Theme.of(context).textTheme.body2.copyWith(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        'assets/images/icons/comment.png',
                        height: 30,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${post.comments}',
                        textAlign: TextAlign.justify,
                        maxLines: 5,
                        style: Theme.of(context).textTheme.body2.copyWith(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
