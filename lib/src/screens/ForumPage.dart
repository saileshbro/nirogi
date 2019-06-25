import 'package:flutter/material.dart';
import 'package:nirogi/src/models/forumPosts.dart';
import 'package:nirogi/src/models/popupchoice.dart';
import 'package:nirogi/src/widgets/choice_card.dart';
import 'package:nirogi/src/widgets/drawer.dart';
import 'package:nirogi/src/widgets/forumblock.dart';
import 'package:nirogi/src/widgets/search_box.dart';

class ForumPage extends StatefulWidget {
  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Health Forum', style: Theme.of(context).textTheme.headline),
            SizedBox(
              width: 14,
            ),
            Image.asset(
              'assets/images/icons/forum.png',
              width: 40,
            ),
          ],
        ),
        actions: <Widget>[
          PopupMenuButton<ForumChoice>(
            onSelected: (ForumChoice choice) {},
            itemBuilder: (BuildContext context) {
              return forumChoice.map((ForumChoice forumChoice) {
                return PopupMenuItem<ForumChoice>(
                  child: ForumChoiceCard(
                    choice: forumChoice,
                  ),
                  value: forumChoice,
                );
              }).toList();
            },
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SearchBox(),
          _BuildPostsList(),
        ],
      ),
    );
  }
}

class _BuildPostsList extends StatelessWidget {
  const _BuildPostsList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 10, left: 10, bottom: 10),
        child: ListView.separated(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: posts.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return ForumBlock(
              post: posts[index],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: Colors.grey,
              height: 10,
              indent: 65,
            );
          },
        ),
      ),
    );
  }
}
