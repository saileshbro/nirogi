import 'package:flutter/material.dart';
import 'package:nirogi/src/constants/env.dart';

class CommentCard extends StatelessWidget {
  final comment;
  const CommentCard({
    @required this.comment,
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(bottom: 0.01 * height),
      padding: EdgeInsets.only(top: 0.01 * height),
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
                    height: 5,
                  ),
                  Text(
                    comment.voteCount.toString(),
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
                      width: 0.06 * width,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 0.03 * width,
              ),
              Expanded(
                child: Text(
                  comment.comment,
                  style: Theme.of(context).textTheme.body2.copyWith(
                        fontSize: 16,
                      ),
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          ),
          SizedBox(
            height: 0.02 * width,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    comment.name,
                    style: Theme.of(context).textTheme.body2.copyWith(
                          fontSize: 16,
                          color: Colors.red[700],
                        ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: <Widget>[
                      Image.asset('assets/images/icons/recent.png', height: 15),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        comment.createdAt.toString(),
                        style: Theme.of(context).textTheme.body2.copyWith(
                              fontSize: 15,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 0.06 * width,
              ),
              Container(
                height: 40,
                width: 0.09 * width,
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      '$baseUrl/${comment.imageUrl}',
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
