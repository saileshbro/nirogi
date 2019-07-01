import 'package:flutter/material.dart';
import 'package:nirogi/src/screens/eachPost.dart';

class ForumBlock extends StatelessWidget {
  final post;
  const ForumBlock({
    @required this.post,
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return InkWell(
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
      child: Container(
        padding: EdgeInsets.only(bottom: 0.01 * height, top: 0.01 * height),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 0.09 * height,
                  width: 0.14 * width,
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
                  width: 0.02 * width,
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        post.title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.body1.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.all(5),
                          color: Colors.blueGrey[700],
                          child: Text(
                            post.category,
                            style: Theme.of(context).textTheme.body2.copyWith(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 0.02 * width,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  post.name,
                  style: Theme.of(context).textTheme.body2.copyWith(
                        fontSize: 16,
                        color: Colors.red[700],
                      ),
                ),
                SizedBox(
                  width: 0.02 * width,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset('assets/images/icons/upvote.png',
                              height: 0.03 * height),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            post.voteCount.toString(),
                            style: Theme.of(context).textTheme.body2.copyWith(
                                  fontSize: 15,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Image.asset('assets/images/icons/comment.png',
                              height: 0.02 * height),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            post.commentCount.toString(),
                            style: Theme.of(context).textTheme.body2.copyWith(
                                  fontSize: 15,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Image.asset('assets/images/icons/recent.png',
                              height: 0.02 * height),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            post.updatedAt.toString(),
                            style: Theme.of(context).textTheme.body2.copyWith(
                                  fontSize: 15,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Image.asset('assets/images/icons/eye.png',
                              height: 0.02 * height),
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
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
