import 'package:flutter/material.dart';

class ForumBlock extends StatelessWidget {
  final post;
  const ForumBlock({
    @required this.post,
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Here');
      },
      child: Container(
        height: 90,
        child: Row(
          children: <Widget>[
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.red[50],
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    post.imageUrl,
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  post.title,
                  style: Theme.of(context).textTheme.body1.copyWith(
                        fontSize: 16,
                      ),
                ),
                Text(
                  post.name,
                  style: Theme.of(context).textTheme.body2.copyWith(
                        fontSize: 16,
                        color: Colors.red[700],
                      ),
                ),
                Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.all(5),
                        color: Colors.grey[300],
                        child: Text(
                          post.category,
                          style: Theme.of(context).textTheme.body2.copyWith(
                                fontSize: 15,
                              ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset('assets/images/icons/upvote.png', height: 20),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      post.voteCount.toString(),
                      style: Theme.of(context).textTheme.body2.copyWith(
                            fontSize: 15,
                          ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset('assets/images/icons/comment.png', height: 15),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      post.commentCount.toString(),
                      style: Theme.of(context).textTheme.body2.copyWith(
                            fontSize: 15,
                          ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset('assets/images/icons/recent.png', height: 15),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      post.updatedAt.toString(),
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
                      post.views.toString(),
                      style: Theme.of(context).textTheme.body2.copyWith(
                            fontSize: 15,
                          ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
