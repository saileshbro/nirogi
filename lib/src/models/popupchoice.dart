class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final String icon;
}

const List<Choice> choice = const <Choice>[
  const Choice(
    title: 'Change password',
    icon: 'assets/images/icons/password.png',
  ),
];

const List<ForumChoice> editchoice = const <ForumChoice>[
  const ForumChoice(
    title: 'Edit Post',
    icon: 'assets/images/icons/edit.png',
  ),
];

class ForumChoice {
  const ForumChoice({this.title, this.icon, this.sort});
  final String title;
  final String icon;
  final String sort;
}

const List<ForumChoice> forumChoice = const <ForumChoice>[
  const ForumChoice(
    title: 'Most Popular',
    icon: 'assets/images/icons/popular.png',
    sort: 'popular',
  ),
  const ForumChoice(
      title: 'Most Recent',
      icon: 'assets/images/icons/recent.png',
      sort: 'recent'),
];

class DropDownChoice {
  const DropDownChoice({this.title, this.icon});
  final String title;
  final String icon;
}
