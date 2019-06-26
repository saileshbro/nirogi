import 'package:flutter/material.dart';

class CommentCard extends StatelessWidget {
  final comment;
  const CommentCard({
    @required this.comment,
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(top: 10),
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
                      width: 25,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 15,
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
            height: 10,
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
                width: 10,
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      comment.imageUrl,
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
