import 'package:flutter/material.dart';
import 'package:nirogi/src/models/posts.dart';
import 'package:nirogi/src/models/popupchoice.dart';
import 'package:nirogi/src/screens/createPost.dart';
import 'package:nirogi/src/widgets/choice_card.dart';
import 'package:nirogi/src/widgets/drawer.dart';
import 'package:nirogi/src/widgets/forumblock.dart';
import 'package:nirogi/src/widgets/plus_floating_icon.dart';
import 'package:nirogi/src/widgets/search_box.dart';

class ForumPage extends StatefulWidget {
  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 0.033 * height),
        child: FloatingActionButton(
          heroTag: 'createPost',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreatePost(),
              ),
            );
          },
          backgroundColor: Colors.white,
          child: PlusFloatingIcon(),
        ),
      ),
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Health Forum', style: Theme.of(context).textTheme.headline),
            SizedBox(
              width: 0.03 * width,
            ),
            Image.asset(
              'assets/images/icons/forum.png',
              width: 0.09 * width,
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            right: 0.02 * width, left: 0.04 * width, bottom: 0.01 * height),
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
              height: 0.01 * height,
            );
          },
        ),
      ),
    );
  }
}
